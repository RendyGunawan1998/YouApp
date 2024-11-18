import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../core.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController bday = TextEditingController();
  TextEditingController horoscope = TextEditingController();
  TextEditingController zodiac = TextEditingController();
  TextEditingController heights = TextEditingController();
  TextEditingController weights = TextEditingController();
  File? imageFile;

  List<String> gender = <String>['Select Gender', 'Male', 'Female'];
  String genderValue = '';

  bool about = false;
  bool save = false;

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(GetProfile());
    genderValue = gender.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              color: HexColor('#09141A'),
            ),
            child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
              if (state is ProfileLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ProfileLoaded) {
                final profile = state.profile;
                name.text = profile.name ?? '';
                bday.text = profile.birthday ?? '';
                heights.text = profile.height != null
                    ? '${profile.height.toString()} cm'
                    : "";
                weights.text = profile.weight != null
                    ? '${profile.weight.toString()} kg'
                    : "";
                horoscope.text = profile.birthday != null
                    ? calculateHoroscope(
                        DateFormat('dd MM yyyy').parse(bday.text))
                    : profile.horoscope ?? '--';
                zodiac.text = profile.birthday != null
                    ? calculateZodiac(DateFormat('dd MM yyyy').parse(bday.text))
                    : profile.zodiac ?? '--';
                genderValue = gender[1];

                return Padding(
                  padding: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        appBarProfile(profile),
                        containerPhoto(profile, save, imageFile, genderValue,
                            horoscope, zodiac),
                        hbox(15),
                        containerAbout(
                            profile,
                            context,
                            about,
                            genderValue,
                            bday,
                            name,
                            horoscope,
                            zodiac,
                            heights,
                            weights,
                            imageFile,
                            rowAboutDropdown('Gender:', genderValue,
                                (String? value) {
                              setState(() {
                                genderValue = value!;
                              });
                            },
                                gender.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: SizedBox(
                                      width: 100,
                                      child: Text(
                                        value,
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  );
                                }).toList()), () {
                          if (mounted) {
                            setState(() {
                              about = !about;
                            });
                          }
                        }, () {
                          if (mounted) {
                            setState(() {
                              setState(() {
                                about = !about;
                                save = true;
                                context.read<ProfileBloc>().add(CreatePressed(
                                    name: name.text.isNotEmpty ? name.text : "",
                                    birthday:
                                        bday.text.isNotEmpty ? bday.text : "",
                                    height: heights.text.isNotEmpty
                                        ? int.parse(heights.text.contains('cm')
                                            ? heights.text.replaceAll(' cm', '')
                                            : heights.text)
                                        : 0,
                                    weight: weights.text.isNotEmpty
                                        ? int.parse(weights.text.contains('kg')
                                            ? weights.text.replaceAll(' kg', '')
                                            : weights.text)
                                        : 0));

                                context.read<ProfileBloc>().add(GetProfile());
                              });
                            });
                          }
                        }, () async {
                          XFile picked = await pickImage();
                          if (picked.path.isNotEmpty) {
                            if (mounted) {
                              setState(() {
                                imageFile = File(picked.path);
                              });
                            }
                          }
                        }, () async {
                          final pickDate =
                              await showCustomDatePicker(context: context);
                          if (pickDate != "" || pickDate.isNotEmpty) {
                            horoscope.text = calculateHoroscope(
                                DateFormat('dd MM yyyy').parse(pickDate));
                            zodiac.text = calculateZodiac(
                                DateFormat('dd MM yyyy').parse(pickDate));
                            if (mounted) {
                              bday.text = pickDate;
                            }
                          }
                        }),
                        hbox(15),
                        Container(
                          height: profile.interests.isEmpty
                              ? Get.height * 0.1
                              : null,
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 23, 30, 33)
                                  .withOpacity(0.9),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    textInter('Interest', Colors.white, 14,
                                        FontWeight.w700),
                                    InkWell(
                                        onTap: () {
                                          if (mounted) {
                                            setState(() {
                                              Get.to(() => InterestScreen(
                                                    profile: profile,
                                                  ));
                                            });
                                          }
                                        },
                                        child: Image.asset(AssetsHelper.icPen,
                                            height: 16)),
                                  ],
                                ),
                                hbox(20),
                                profile.interests.isEmpty ||
                                        profile.interests[0] == ""
                                    ? textInter(
                                        'Add in your interest to find a better match',
                                        Colors.white.withOpacity(0.52),
                                        14,
                                        FontWeight.w500)
                                    : Padding(
                                        padding: EdgeInsets.only(bottom: 8),
                                        child: Wrap(
                                          spacing: 8, // space between items
                                          children: profile.interests
                                              .map((e) => Container(
                                                    padding: EdgeInsets.all(4),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          HexColor('#1C272C'),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                10, 5, 10, 5),
                                                        child: textInter(
                                                            e,
                                                            Colors.white,
                                                            13,
                                                            FontWeight.w600)),
                                                  ))
                                              .toList(),
                                        ),
                                      )

                                // TagEditor(
                                //     textStyle: gFontStyle(
                                //         Colors.white, 14, FontWeight.w600),
                                //     length: profile.interests.length,
                                //     readOnly: true,
                                //     enabled: true,
                                //     hasAddButton: false,
                                //     inputDecoration: InputDecoration(
                                //       border: InputBorder.none,
                                //     ),
                                //     onTagChanged: (newValue) {},
                                //     tagBuilder: (context, index) => Chips1(
                                //       index: index,
                                //       label: profile.interests[index],
                                //       onDeleted: (index) {},
                                //     ),
                                //   )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Container();
            })),
      ),
    );
  }
}
