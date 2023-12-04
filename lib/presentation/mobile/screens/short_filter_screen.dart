import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luna_web_flutter/presentation/themes.dart';

class ShortFilterScreen extends StatefulWidget {
  @override
  State<ShortFilterScreen> createState() => _ShortFilterScreenState();
}

class _ShortFilterScreenState extends State<ShortFilterScreen> {
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
  double start = 100.0;
  double end = 500000.0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Search & Filter",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            )),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: Theme.of(context).own().arrowBackIosIcon),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),

              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Color(0xff3D3D3D),
                          //                   <--- border color
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              textAlignVertical: TextAlignVertical.center,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search,
                                      color: Color(0xffA0A0A0)),
                                  hintText: 'Search',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                  isCollapsed: true),
                              onChanged: (text) {
                                // Обработка изменений в тексте поиска
                              },
                            ),
                          ),
                        ],
                      ))),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  // width: double.infinity,
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(
                      color: Color(0xff3D3D3D),
                      //                   <--- border color
                      width: 1.0,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xff3066BE),
                        ),
                        isExpanded: true,
                        hint: const Text('Brands',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
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
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  // width: double.infinity,
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(
                      color: Color(0xff3D3D3D),
                      //                   <--- border color
                      width: 1.0,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xff3066BE),
                        ),
                        isExpanded: true,
                        hint: const Text('Models',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
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
                          color: Colors.black)),
                ),
              ),
              // const SizedBox(
              //   height: 8,
              // ),
              RangeSlider(
                activeColor: Color(0xff3066BE),
                inactiveColor: Color(0xffE3F2FD).withOpacity(0.5),
                values: RangeValues(start, end),
                labels: RangeLabels(start.toString(), end.toString()),
                onChanged: (value) {
                  setState(() {
                    start = value.start;
                    end = value.end;
                  });
                },
                min: 100.0,
                max: 500000.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${start.toInt()}',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    Text('\$${end.toInt()}',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black))
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              // textAlignVertical: TextAlignVertical.center,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  alignment: Alignment.center,
                                  icon: SvgPicture.asset(
                                      "assets/icons/date_icon.svg",
                                      color: Color(0xff3066BE)),
                                  onPressed: () async {
                                    final currentDate = DateTime.now();
// 7
                                    final selectedDate = await showDatePicker(
                                      context: context,
                                      initialDate: currentDate,
                                      firstDate: currentDate,
                                      lastDate: DateTime(currentDate.year + 5),
                                    );
                                  },
                                ),
                                hintText: 'Year from',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(),
                                contentPadding: const EdgeInsets.only(
                                    left: 16, right: 8, top: 8, bottom: 9),
                              ),
                              onChanged: (text) {
                                // Обработка изменений в тексте поиска
                              },
                            ))),
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              // textAlignVertical: TextAlignVertical.center,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  alignment: Alignment.center,
                                  icon: SvgPicture.asset(
                                      "assets/icons/date_icon.svg",
                                      color: Color(0xff3066BE)),
                                  onPressed: () async {
                                    final currentDate = DateTime.now();
// 7
                                    final selectedDate = await showDatePicker(
                                      context: context,
                                      initialDate: currentDate,
                                      firstDate: currentDate,
                                      lastDate: DateTime(currentDate.year + 5),
                                    );
// 8
                                  },
                                ),
                                hintText: 'Year till',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.black),
                                ),
                                contentPadding: const EdgeInsets.only(
                                    left: 16, right: 8, top: 8, bottom: 9),
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
              TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("More filter",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff3D3D3D))),
                      const SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: 20.0, color: const Color(0xff3D3D3D)),
                    ],
                  )),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Container(
            // margin: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xff3066BE)),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: const Center(
                child: Text("Search",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white))),
          ),
        ),
        SizedBox(
          height: 16,
        )
      ]),
    );
  }
}
