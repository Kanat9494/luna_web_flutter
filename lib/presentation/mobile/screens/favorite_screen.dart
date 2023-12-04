import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luna_web_flutter/presentation/mobile/widgets/car_list_item.dart';
import 'package:luna_web_flutter/presentation/mobile/widgets/favorite_list_item.dart';

import '../../../models/car.dart';

// 1
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  double minHeight = 193;
  double maxHeight = 473;
  // bool _isExpanded = false;
  ValueNotifier<bool> _notifierIsExpanded = ValueNotifier<bool>(false);

  // Initial Selected Value
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var brands = [
    'KIA',
    'TOYOTA',
    'LEXUS',
    'KIA',
    'TOYOTA',
    'LEXUS',
    'KIA',
    'TOYOTA',
    'LEXUS',
    'KIA',
    'TOYOTA',
    'LEXUS',
    'KIA',
    'TOYOTA',
    'LEXUS',
  ];
  var models = [
    'K5',
    'K7',
    'MORNING',
  ];
  double start = 30.0;
  double end = 50.0;

  @override
  void dispose() {
    _notifierIsExpanded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: _notifierIsExpanded,
          builder: (context, _isExpanded, child) {
            return AnimatedContainer(
                // Define how long the animation should take.
                duration: const Duration(
                  milliseconds: 50,
                ),
                // Provide an optional curve to make the animation feel smoother.
                curve: Curves.fastOutSlowIn,
                height: _isExpanded ? maxHeight : minHeight,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                    color: Color(0xff3066BE)),
                child: Column(
                    // mainAxisSize: ,
                    children: <Widget>[
                      const SizedBox(
                        height: 50,
                      ),
                      const Text("Luna",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffffffff))),
                      const SizedBox(height: 16),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.search,
                                              color: Color(0xffA0A0A0)),
                                          suffixIcon: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: 1,
                                                height: 24,
                                                color: const Color(0xffA0A0A0),
                                              ),
                                              // const SizedBox(width: 16),
                                              IconButton(
                                                alignment: Alignment.center,
                                                icon: SvgPicture.asset(
                                                    "assets/icons/filter_icon.svg"),
                                                onPressed: () {
                                                  print('Search');
                                                },
                                              ),
                                            ],
                                          ),
                                          hintText: 'Search',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                          isCollapsed: true),
                                      onChanged: (text) {
                                        // Обработка изменений в тексте поиска
                                      },
                                    ),
                                  ),
                                ],
                              ))),
                      if (_isExpanded)
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      child: Container(
                                        // width: double.infinity,
                                        height: 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            )),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                              icon: const Icon(
                                                Icons.arrow_forward_ios,
                                                color: Color(0xff2C3E50),
                                              ),
                                              isExpanded: true,
                                              hint: const Text('Brands',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black)),
                                              // value: "Sports",
                                              items: brands.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items),
                                                );
                                              }).toList(),
                                              onChanged: (val) {
                                                setState(() {
                                                  // categoryValue = val.toString();
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      child: Container(
                                        // width: double.infinity,
                                        height: 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            )),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                              icon: const Icon(
                                                Icons.arrow_forward_ios,
                                                color: Color(0xff2C3E50),
                                              ),
                                              isExpanded: true,
                                              hint: const Text('Models',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black)),
                                              // value: "Sports",
                                              items: models.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items),
                                                );
                                              }).toList(),
                                              onChanged: (val) {
                                                setState(() {
                                                  // categoryValue = val.toString();
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Container(
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: TextField(
                                              // textAlignVertical: TextAlignVertical.center,
                                              style: const TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                suffixIcon: IconButton(
                                                  alignment: Alignment.center,
                                                  icon: SvgPicture.asset(
                                                      "assets/icons/date_icon.svg"),
                                                  onPressed: () async {
                                                    final currentDate =
                                                        DateTime.now();
// 7
                                                    final selectedDate =
                                                        await showDatePicker(
                                                      context: context,
                                                      initialDate: currentDate,
                                                      firstDate: currentDate,
                                                      lastDate: DateTime(
                                                          currentDate.year + 5),
                                                    );
                                                  },
                                                ),
                                                hintText: 'Year from',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                border: InputBorder.none,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 16,
                                                        right: 8,
                                                        top: 8,
                                                        bottom: 9),
                                              ),
                                              onChanged: (text) {
                                                // Обработка изменений в тексте поиска
                                              },
                                            ))),
                                  ),
                                  Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Container(
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: TextField(
                                              // textAlignVertical: TextAlignVertical.center,
                                              style: const TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                suffixIcon: IconButton(
                                                  alignment: Alignment.center,
                                                  icon: SvgPicture.asset(
                                                      "assets/icons/date_icon.svg"),
                                                  onPressed: () async {
                                                    final currentDate =
                                                        DateTime.now();
// 7
                                                    final selectedDate =
                                                        await showDatePicker(
                                                      context: context,
                                                      initialDate: currentDate,
                                                      firstDate: currentDate,
                                                      lastDate: DateTime(
                                                          currentDate.year + 5),
                                                    );
// 8
                                                  },
                                                ),
                                                hintText: 'Year till',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                border: InputBorder.none,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 16,
                                                        right: 8,
                                                        top: 8,
                                                        bottom: 9),
                                              ),
                                              onChanged: (text) {
                                                // Обработка изменений в тексте поиска
                                              },
                                            ))),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Text("Price range",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white)),
                                ),
                              ),
                              // const SizedBox(
                              //   height: 8,
                              // ),
                              RangeSlider(
                                activeColor: Color(0xffFF7F51),
                                inactiveColor:
                                    Color(0xffE3F2FD80).withOpacity(0.5),
                                values: RangeValues(start, end),
                                labels: RangeLabels(
                                    start.toString(), end.toString()),
                                onChanged: (value) {
                                  setState(() {
                                    start = value.start;
                                    end = value.end;
                                  });
                                },
                                min: 10.0,
                                max: 80.0,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('\$50',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white)),
                                    Text('\$20000',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white))
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  width: 171,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(0xffff7f51)),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: const Center(
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'Flat Button',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (!_isExpanded) Spacer(),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: TextButton(
                              onPressed: () {
                                _notifierIsExpanded.value = !_isExpanded;
                                // setState(() {
                                //   _isExpanded = !_isExpanded;
                                //   // if(_isExpanded){
                                //   //
                                //   // }
                                // });
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text("Short filter",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffD9D9D9))),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Icon(
                                      // <-- Icon
                                      _isExpanded
                                          ? Icons.keyboard_arrow_up_outlined
                                          : Icons.keyboard_arrow_down_outlined,
                                      size: 20.0,
                                      color: const Color(0xffD9D9D9)),
                                ],
                              )))
                    ]));
          },
        ),
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 50,
              itemBuilder: (BuildContext context, int index) {
                return FavoriteListItem(
                    car: Car(
                  carId: index + 1,
                  color: (100 + index * 100),
                  title: 'Toyota Rav4',
                  yearOfIssue: 2000 + index,
                  subtitle: 'SUV 5 Doors',
                  volume: 2.0,
                  mileage: 50000,
                  location: 'Bishkek',
                  images: [
                    'https://picsum.photos/id/${index + 1}/200/300',
                    'https://picsum.photos/id/${index + 1}/200/300',
                    'https://picsum.photos/id/${index + 1}/200/300'
                  ],
                ));
              }),
        ),
      ],
    );
  }
}
