import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:luna_web_flutter/api/api.dart';
import 'package:luna_web_flutter/blocs/cars_list/cars_list_cubit.dart';
import 'package:luna_web_flutter/presentation/mobile/screens/home.dart';
import 'package:luna_web_flutter/provider/local_provider.dart';
import 'package:luna_web_flutter/provider/theme_provider.dart';
import 'presentation/mobile/widgets/menu_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'presentation/mobile/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'l10n/l10n.dart';

void main() {
  GetIt.I.registerSingleton<Api>(Api());

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ThemeModel()),
      ChangeNotifierProvider(create: (context) => LocaleProvider()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, themeModel, child) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CarsListCubit()),
        ],
        child: MaterialApp(
            theme: themeModel.mode,
            // darkTheme: MyTheme.dark(),
            // supportedLocales: L10n.all,
            // // locale: provider.locale,
            // localizationsDelegates: const [
            //   AppLocalizations.delegate,
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            // ],
            debugShowCheckedModeBanner: false,
            // title: 'Flutter Demo',
            // theme: ThemeData(
            //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            //   useMaterial3: true,
            // ),
            home: const CheckIsWebOrMobile()
            // home: MyHomePage(),
            ),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<bool> checkFirstLaunch() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
//prefs.remove('isFirstLaunch');
    final bool? isFirstLaunch = prefs.getBool('isFirstLaunch');
    if (isFirstLaunch == false) {
      return true;
    } else {
      return false;
    }
  }

  final menuItemList = const <MenuItem>[
    MenuItem(Icons.home_outlined, 'Home'),
    MenuItem(Icons.favorite_border, 'Favorites'),
    MenuItem(Icons.add, 'Add'),
    MenuItem(Icons.person_outline_outlined, 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
          future: checkFirstLaunch(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Или ваш виджет загрузки
            } else if (snapshot.hasError) {
              return ErrorWidget(const Text('Error'));
            } else {
              if (snapshot.data == true) {
                return const Home();
              } else {
                return const WelcomeScreen();

                //return const Home();
              }
            }
          }),
    );
  }
}

class CheckIsWebOrMobile extends StatefulWidget {
  const CheckIsWebOrMobile({super.key});

  @override
  State<CheckIsWebOrMobile> createState() => _CheckIsWebOrMobileState();
}

class _CheckIsWebOrMobileState extends State<CheckIsWebOrMobile> {
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width >= 700)
      return Container(
        child: Text('Web'),
      );
    else
      return const Home();
  }
}
