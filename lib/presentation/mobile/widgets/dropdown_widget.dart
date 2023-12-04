import 'package:flutter/material.dart';
import '../../../l10n/l10n.dart';
import 'package:provider/provider.dart';
import '../../../provider/local_provider.dart';

class DropdownWidget extends StatefulWidget {
  final List<String> dropdownListValues;
  const DropdownWidget({super.key, required this.dropdownListValues});

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String dropdownValue = '';

  @override
  void initState() {
    super.initState();

    dropdownValue = widget.dropdownListValues.first;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale;
    dropdownValue = L10n.getTitle(locale.languageCode);
    return DropdownButtonHideUnderline(
        child: ButtonTheme(
            // alignedDropdown: true,
            child: DropdownButton<String>(
      dropdownColor: const Color.fromARGB(255, 76, 155, 175),
      value: dropdownValue,
      isExpanded: true,
      icon: const Visibility(visible: false, child: Icon(Icons.arrow_downward)),
      elevation: 0,
      style: const TextStyle(
          fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),
      // onChanged: (Locale? value) {
      //   setState(() {
      //     dropdownValue = L10n.getTitle(value?.languageCode ?? 'en');
      //   });
      // },
      onChanged: (String? value) {
        final provider = Provider.of<LocaleProvider>(context, listen: false);
        var currentLocale = L10n.getLocale(value ?? 'en');
        provider.setLocale(currentLocale);
        setState(() {
          dropdownValue = L10n.getTitle(currentLocale.languageCode);
        });
      },
      items: widget.dropdownListValues
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(
              color: dropdownValue == value ? Colors.white : Colors.black,
            ),
          ),
        );
      }).toList(),
    )));
  }
}
