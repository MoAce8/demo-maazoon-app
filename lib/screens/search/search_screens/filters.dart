import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maazoon/shared/components.dart';
import 'package:maazoon/shared/constants.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool rateVisible = false;
  bool placeVisible = false;
  bool dayVisible = false;
  bool timeVisible = false;

  double minRate = 1;

  List locations = [
    'مصر',
    'السعودية',
    'الامارات',
  ];
  String selectedLocation = 'مصر';

  DateTime? pickedDate;
  TimeOfDay? pickedStartTime;
  TimeOfDay? pickedEndTime;
  final formatter = DateFormat.yMd();
  final tFormat = DateFormat.Hm();

  final egypt = [
    'القاهرة',
    'الاسكندرية',
  ];

  final ksa = [
    'الرياض',
    'مكة',
    'المدينة',
  ];

  final uae = [
    'دبي',
    'ابو ظبي',
  ];
  String selectedCity = '';

  List citiesList = [];

  getCities(String countryId) async {}

  setCounty(String? country) {
    for (var pet in locations) {
      if (pet == country) {
        getCities(pet.id!);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(28),
          topLeft: Radius.circular(28),
        ),
        gradient: LinearGradient(
          colors: [
            AppColors.oliveAccent.withOpacity(0.6),
            AppColors.white,
            AppColors.white,
            AppColors.white,
            AppColors.white
          ],
          begin: Alignment.topCenter,
          end: Alignment.center,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: screenWidth(context) / 5,
                  height: screenHeight(context) / 100,
                  decoration: BoxDecoration(
                      color: AppColors.grey22,
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
              SizedBox(
                height: screenHeight(context) / 30,
              ),
              Text(
                'التصفية',
                style: TextStyle(
                  fontSize: screenWidth(context) / 15.5,
                ),
              ),
              SizedBox(
                height: screenHeight(context) / 78,
              ),
              ExpansionTile(
                iconColor: AppColors.black,
                collapsedIconColor: AppColors.black,
                shape: const OutlineInputBorder(borderSide: BorderSide.none),
                title: Text(
                  'تصفية حسب التقييم',
                  style: TextStyle(
                    fontSize: screenWidth(context) / 18.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: screenWidth(context) / 18,
                          ),
                          Text(
                            'أقل عدد نجوم',
                            style: TextStyle(
                              fontSize: screenWidth(context) / 25,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: minRate,
                        onChanged: (val) {
                          setState(() {
                            minRate = val;
                          });
                        },
                        inactiveColor: AppColors.primaryGreen,
                        activeColor: AppColors.lightGreen,
                        thumbColor: AppColors.primaryGreen,
                        max: 5,
                        min: 1,
                        label: minRate.round().toString(),
                        divisions: 5,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight(context) / 78,
              ),
              ExpansionTile(
                iconColor: AppColors.black,
                collapsedIconColor: AppColors.black,
                shape: const OutlineInputBorder(borderSide: BorderSide.none),
                title: Text(
                  'تصفية حسب المكان',
                  style: TextStyle(
                    fontSize: screenWidth(context) / 18.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  DropdownButtonFormField(
                    hint: const Text('اختر الدولة'),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: AppColors.grey22)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: AppColors.grey22)),
                    ),
                    items: locations
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (val) {
                      ///string city,List cities
                      ///on change ==>city
                      ///cities for country for List
                      //  setState(() {
                      //   test=[];
                      // });
                      setState(() {
                        selectedCity = '';
                        citiesList = [];
                        selectedLocation = val.toString();

                        if (selectedLocation == 'مصر') {
                          for (int i = 0; i < egypt.length; i++) {
                            citiesList.add(egypt[i]);
                          }
                        }
                        if (selectedLocation == 'السعودية') {
                          for (int i = 0; i < ksa.length; i++) {
                            citiesList.add(ksa[i]);
                          }
                        }
                        if (selectedLocation == 'الامارات') {
                          selectedCity = 'دبي';
                          for (int i = 0; i < uae.length; i++) {
                            citiesList.add(uae[i]);
                          }
                        }
                      });
                    },
                  ),
                  SizedBox(
                    height: screenHeight(context) / 78,
                  ),
                  DropdownButtonFormField(
                    hint: const Text('اختر المدينة'),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: AppColors.grey22)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide:
                              const BorderSide(color: AppColors.grey22)),
                    ),
                    value: citiesList.isEmpty ? null : citiesList[0],
                    items: citiesList.isEmpty
                        ? []
                        : citiesList
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedCity = val.toString();
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight(context) / 78,
              ),
              ExpansionTile(
                iconColor: AppColors.black,
                collapsedIconColor: AppColors.black,
                shape: const OutlineInputBorder(borderSide: BorderSide.none),
                title: Text(
                  'تصفية حسب اليوم المتاح',
                  style: TextStyle(
                    fontSize: screenWidth(context) / 18.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'اختر يوم عقد القران',
                          style: TextStyle(
                              fontSize: screenWidth(context) / 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: screenHeight(context) / 40,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                  color: AppColors.darkGrey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                  color: AppColors.darkGrey,
                                ),
                              ),
                              hintText: pickedDate == null
                                  ? 'اختر يوم عقد القران'
                                  : formatter.format(pickedDate!),
                              hintStyle: TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: screenWidth(context) / 22,
                              ),
                              labelText: 'اختر يوم عقد القران',
                              labelStyle: TextStyle(
                                color: AppColors.black,
                                fontSize: screenWidth(context) / 22,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              suffixIcon: const Icon(Icons.date_range)),
                          readOnly: true,
                          onTap: () async {
                            final now = DateTime.now();
                            final newDate = await showDatePicker(
                              context: context,
                              initialDate: now,
                              firstDate:
                                  DateTime(now.year - 1, now.month, now.day),
                              lastDate: now,
                            );
                            setState(() {
                              pickedDate = newDate;
                            });
                          },
                        ),
                        SizedBox(
                          height: screenHeight(context) / 30,
                        ),
                        Text(
                          'اختر وقت عقد القران',
                          style: TextStyle(
                              fontSize: screenWidth(context) / 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: screenHeight(context) / 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(
                                        color: AppColors.darkGrey,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(
                                        color: AppColors.darkGrey,
                                      ),
                                    ),
                                    hintText: pickedStartTime == null
                                        ? 'من'
                                        : pickedStartTime!.format(context),
                                    hintStyle: TextStyle(
                                      color: AppColors.darkGrey,
                                      fontSize: screenWidth(context) / 22,
                                    ),
                                    labelText: 'من',
                                    labelStyle: TextStyle(
                                      color: AppColors.black,
                                      fontSize: screenWidth(context) / 22,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    suffixIcon: const Icon(Icons.access_time)),
                                readOnly: true,
                                onTap: () async {
                                  final now = TimeOfDay.now();
                                  final newTime = await showTimePicker(
                                    context: context,
                                    initialTime: now,
                                    initialEntryMode: TimePickerEntryMode.dialOnly,
                                  );
                                  setState(() {
                                    pickedStartTime = newTime;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: screenWidth(context) * 0.2,
                            ),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(
                                        color: AppColors.darkGrey,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(
                                        color: AppColors.darkGrey,
                                      ),
                                    ),
                                    hintText: pickedEndTime == null
                                        ? 'الى'
                                        : pickedEndTime!.format(context),
                                    hintStyle: TextStyle(
                                      color: AppColors.darkGrey,
                                      fontSize: screenWidth(context) / 22,
                                    ),
                                    labelText: 'الى',
                                    labelStyle: TextStyle(
                                      color: AppColors.black,
                                      fontSize: screenWidth(context) / 22,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    suffixIcon: const Icon(Icons.access_time)),
                                readOnly: true,
                                onTap: () async {
                                  final now = TimeOfDay.now();
                                  final newTime = await showTimePicker(
                                    context: context,
                                    initialTime: now,
                                    initialEntryMode: TimePickerEntryMode.dialOnly,
                                  );
                                  setState(() {
                                    pickedEndTime = newTime;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: screenHeight(context) / 10,
              ),
              AppElevatedButton(
                context: context,
                onPressed: () {},
                title: 'تصفية النتائج',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
