import 'dart:io';

import 'package:intl/intl.dart';
import '../core.dart';

hbox(double h) {
  return SizedBox(
    height: h,
  );
}

wbox(double w) {
  return SizedBox(
    width: w,
  );
}

textInter(String text, Color colors, double size, FontWeight fw) {
  return Text(text,
      style: GoogleFonts.inter(
          textStyle: TextStyle(color: colors, fontSize: size, fontWeight: fw)));
}

gFontStyle(Color colors, double size, FontWeight fw) {
  return GoogleFonts.inter(
      textStyle: TextStyle(color: colors, fontSize: size, fontWeight: fw));
}

navigateMe(BuildContext context, dynamic page) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Get.to(page);
  });
}

void showTopSnackBar(
  context,
  String title,
  String message,
  // {Duration? duration}
) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Get.snackbar(title, message);
  });
}

alerts(context, String message) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Message'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

boxPass(
  String hint,
  TextEditingController cont,
  Function(String) onChanged,
) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(0.06)),
    child: Padding(
      padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
      child: TextFormField(
        controller: cont,
        onChanged: onChanged,
        style: gFontStyle(Colors.white, 13, FontWeight.w500),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15),
            suffixIcon: Image.asset(
              AssetsHelper.icEye,
              height: 14,
            ),
            border: InputBorder.none,
            hintText: hint,
            hintStyle:
                gFontStyle(Colors.white.withOpacity(0.4), 13, FontWeight.w500)),
      ),
    ),
  );
}

boxUser(String hint, TextEditingController cont) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(0.06)),
    child: Padding(
      padding: EdgeInsets.fromLTRB(14, 10, 14, 10),
      child: TextFormField(
        controller: cont,
        style: gFontStyle(Colors.white, 13, FontWeight.w500),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle:
                gFontStyle(Colors.white.withOpacity(0.4), 13, FontWeight.w500)),
      ),
    ),
  );
}

titleLoginRegis(String text) {
  return Padding(
    padding: EdgeInsets.only(left: 20),
    child: textInter(text, Colors.white, 24, FontWeight.w700),
  );
}

buttonBack(Function() func) {
  return InkWell(
    onTap: func,
    child: Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          hbox(50),
          Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
            size: 16,
          ),
          textInter('Back', Colors.white, 16, FontWeight.w700)
        ],
      ),
    ),
  );
}

bodyBG(Widget widget) {
  return SafeArea(
    child: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff1f4247), Color(0xff0d1d23), Color(0xff09141a)],
          stops: [0.20, 0.65, 0.8],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )),
        child: widget),
  );
}

buttonLoginRegis(String text, TextEditingController cont1,
    TextEditingController cont2, Function() func) {
  return InkWell(
    onTap: func,
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          cont1.text.isEmpty && cont2.text.isEmpty
              ? BoxShadow(color: Colors.transparent)
              : BoxShadow(
                  color: HexColor('#62CDCB'),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(2, 4),
                )
        ],
        gradient: LinearGradient(
          colors: cont1.text.isEmpty && cont2.text.isEmpty
              ? [Color(0xff102137), Color(0xff569ec8)]
              : [
                  HexColor('#62CDCB'),
                  HexColor('#4599DB'),
                  HexColor('#4599DB'),
                ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
          child: Padding(
        padding: EdgeInsets.only(top: 12, bottom: 12),
        child: textInter(
            text,
            cont1.text.isEmpty && cont2.text.isEmpty
                ? Colors.white30
                : Colors.white,
            16,
            FontWeight.w700),
      )),
    ),
  );
}

textLoginRegisAcc(
  String text1,
  String text2,
  Function() func,
) {
  return Center(
    child: InkWell(
      onTap: func,
      child: RichText(
        text: TextSpan(
          text: text1,
          style: gFontStyle(Colors.white, 13, FontWeight.w400),
          children: <TextSpan>[
            TextSpan(
                text: text2,
                style: TextStyle(
                    color: HexColor('#94783E'),
                    decoration: TextDecoration.underline,
                    decorationColor: HexColor('#94783E'),
                    fontWeight: FontWeight.normal)),
          ],
        ),
      ),
    ),
  );
}

rowAbout(String text, String hint, TextEditingController cont) {
  return Row(
    children: [
      Expanded(
        flex: 3,
        child: textInter(
            text, Colors.white.withOpacity(0.33), 13, FontWeight.w500),
      ),
      wbox(15),
      Expanded(
        flex: 7,
        child: Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.white.withOpacity(0.22), width: 1),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white.withOpacity(0.08)),
          child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: TextField(
                controller: cont,
                textAlign: TextAlign.right,
                style: gFontStyle(Colors.white, 13, FontWeight.w500),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: gFontStyle(
                        Colors.white.withOpacity(0.3), 13, FontWeight.w500)),
              )),
        ),
      ),
    ],
  );
}

rowAbout1(String text, String text2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      textInter(text, Colors.white.withOpacity(0.33), 13, FontWeight.w500),
      wbox(5),
      textInter(text2, Colors.white, 14, FontWeight.w500),
    ],
  );
}

rowAboutNum(String text, String hint, TextEditingController cont) {
  return Row(
    children: [
      Expanded(
        flex: 3,
        child: textInter(
            text, Colors.white.withOpacity(0.33), 13, FontWeight.w500),
      ),
      wbox(15),
      Expanded(
        flex: 7,
        child: Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.white.withOpacity(0.22), width: 1),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white.withOpacity(0.08)),
          child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: cont,
                textAlign: TextAlign.right,
                style: gFontStyle(Colors.white, 13, FontWeight.w500),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: gFontStyle(
                        Colors.white.withOpacity(0.3), 13, FontWeight.w500)),
              )),
        ),
      ),
    ],
  );
}

rowDate(String text, String hint, TextEditingController cont, Function() func) {
  return Row(
    children: [
      Expanded(
        flex: 3,
        child: textInter(
            text, Colors.white.withOpacity(0.33), 13, FontWeight.w500),
      ),
      wbox(15),
      Expanded(
        flex: 7,
        child: Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.white.withOpacity(0.22), width: 1),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white.withOpacity(0.08)),
          child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: TextField(
                onTap: func,
                readOnly: true,
                controller: cont,
                textAlign: TextAlign.right,
                style: gFontStyle(Colors.white, 13, FontWeight.w500),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: gFontStyle(
                        Colors.white.withOpacity(0.3), 13, FontWeight.w500)),
              )),
        ),
      ),
    ],
  );
}

rowAboutDropdown(String text, String value, Function(String?)? onChanged,
    List<DropdownMenuItem<String>>? items) {
  return Row(
    children: [
      Expanded(
        flex: 3,
        child: textInter(
            text, Colors.white.withOpacity(0.33), 13, FontWeight.w500),
      ),
      wbox(15),
      Expanded(
        flex: 7,
        child: Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.white.withOpacity(0.22), width: 1),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white.withOpacity(0.08)),
          child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: DropdownButton<String>(
                  value: value,
                  icon: Icon(Icons.keyboard_arrow_down),
                  elevation: 16,
                  onChanged: onChanged,
                  style: gFontStyle(
                      Colors.white.withOpacity(0.3), 13, FontWeight.w500),
                  dropdownColor: HexColor('#162329'),
                  underline: SizedBox(),
                  items: items,
                ),
              )),
        ),
      ),
    ],
  );
}

appBarProfile(DataProfile profile) {
  return AppBar(
    backgroundColor: HexColor('#09141A'),
    elevation: 0,
    leading: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        hbox(50),
        Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.white,
          size: 16,
        ),
        textInter('Back', Colors.white, 16, FontWeight.w700)
      ],
    ),
    centerTitle: true,
    title: textInter(
        '@${profile.name ?? profile.email}', Colors.white, 14, FontWeight.w600),
  );
}

appBarInterest(Function() func1, Function() func2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onTap: func1,
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
              size: 16,
            ),
            textInter('Back', Colors.white, 16, FontWeight.w700)
          ],
        ),
      ),
      InkWell(
        onTap: func2,
        child: textInter('Save', HexColor('#ABFFFD'), 14, FontWeight.w600),
      )
    ],
  );
}

Future pickImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  return pickedFile;
}

rowHororscope(String text) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), color: HexColor('#1E221E')),
    child: Padding(
      padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textInter(
              text == "Aries"
                  ? "♈ Aries"
                  : text == "Taurus"
                      ? "♉ Taurus"
                      : text == "Gemini"
                          ? "♊ Gemini"
                          : text == "Cancer"
                              ? "♋ Cancer"
                              : text == "Leo"
                                  ? "♌ Leo"
                                  : text == "Virgo"
                                      ? "♍ Virgo"
                                      : text == "Scorpius"
                                          ? "♏ Scorpius"
                                          : text == "Sagittarius"
                                              ? "♐ Sagittarius"
                                              : text == "Capricornus"
                                                  ? "♑ Capricornus "
                                                  : text == "Aquarius"
                                                      ? "♒ Aquarius"
                                                      : "♓ Pisces",
              Colors.white,
              14,
              FontWeight.w600),
        ],
      ),
    ),
  );
}

rowZodiac(String text) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), color: HexColor('#1E221E')),
    child: Padding(
      padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textInter(text, Colors.white, 14, FontWeight.w600),
        ],
      ),
    ),
  );
}

Future<String> showCustomDatePicker({
  required BuildContext context,
  String format = 'dd MM yyyy',
}) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now().subtract(Duration(days: 365 * 40)),
    lastDate: DateTime.now().add(Duration(days: 365 * 5)),
  );

  if (picked != null) {
    return DateFormat(format).format(picked);
  } else {
    return '';
  }
}

Map<String, List<int>> horoscope = {
  'Aries': [3, 21, 4, 19],
  'Taurus': [4, 20, 5, 20],
  'Gemini': [5, 21, 6, 21],
  'Cancer': [6, 22, 7, 22],
  'Leo': [7, 23, 8, 22],
  'Virgo': [8, 23, 9, 22],
  'Libra': [9, 23, 10, 23],
  'Scorpius': [10, 24, 11, 21],
  'Sagittarius': [11, 22, 12, 21],
  'Capricornus': [12, 22, 1, 19],
  'Aquarius': [1, 20, 2, 18],
  'Pisces': [2, 19, 3, 20],
};

String calculateHoroscope(DateTime birthdate) {
  int month = birthdate.month;
  int day = birthdate.day;

  for (var entry in horoscope.entries) {
    List<int> range = entry.value;
    if ((month == range[0] && day >= range[1]) ||
        (month == range[2] && day <= range[3])) {
      return entry.key;
    }
  }

  return '--';
}

Map<DateTime, String> zodiacData = {
  DateTime(2023, 1, 22): 'Rabbit',
  DateTime(2022, 2, 1): 'Tiger',
  DateTime(2021, 2, 12): 'Ox',
  DateTime(2020, 1, 25): 'Rat',
  DateTime(2019, 2, 5): 'Pig',
  DateTime(2018, 2, 16): 'Dog',
  DateTime(2017, 1, 28): 'Rooster',
  DateTime(2016, 2, 8): 'Monkey',
  DateTime(2015, 2, 19): 'Goat',
  DateTime(2014, 1, 31): 'Horse',
  DateTime(2013, 2, 10): 'Snake',
  DateTime(2012, 1, 23): 'Dragon',
  DateTime(2011, 2, 3): 'Rabbit',
  DateTime(2010, 2, 14): 'Tiger',
  DateTime(2009, 1, 26): 'Ox',
  DateTime(2008, 2, 7): 'Rat',
  DateTime(2007, 2, 18): 'Boar',
  DateTime(2006, 1, 29): 'Dog',
  DateTime(2005, 2, 9): 'Rooster',
  DateTime(2004, 1, 22): 'Monkey',
  DateTime(2003, 2, 1): 'Goat',
  DateTime(2002, 2, 12): 'Horse',
  DateTime(2001, 1, 24): 'Snake',
  DateTime(2000, 2, 5): 'Dragon',
  DateTime(1999, 2, 16): 'Rabbit',
  DateTime(1998, 1, 28): 'Tiger',
  DateTime(1997, 2, 7): 'Ox',
  DateTime(1996, 2, 19): 'Rat',
  DateTime(1995, 1, 31): 'Boar',
  DateTime(1994, 2, 10): 'Dog',
  DateTime(1993, 1, 23): 'Rooster',
  DateTime(1992, 2, 4): 'Monkey',
  DateTime(1991, 2, 15): 'Goat',
  DateTime(1990, 1, 27): 'Horse',
  DateTime(1989, 2, 6): 'Snake',
  DateTime(1988, 2, 17): 'Dragon',
  DateTime(1987, 1, 29): 'Rabbit',
  DateTime(1986, 2, 9): 'Tiger',
  DateTime(1985, 2, 20): 'Ox',
  DateTime(1984, 2, 2): 'Rat',
  DateTime(1983, 2, 13): 'Boar',
};

String calculateZodiac(DateTime birthdate) {
  // Find the closest zodiac start date that is before the birthdate
  DateTime closestStartDate = zodiacData.keys.firstWhere(
    (date) => date.isAfter(birthdate),
    orElse: () => zodiacData.keys.last,
  );

  // If the birthdate is before the first zodiac start date, it's the last zodiac
  if (birthdate.isBefore(zodiacData.keys.first)) {
    return zodiacData.values.last;
  }

  return zodiacData[closestStartDate]!;
}

buildTextFieldTags({
  required TextfieldTagsController<String> textfieldTagsController,
}) {
  return TextFieldTags<String>(
      textfieldTagsController: textfieldTagsController,
      initialTags: ['Music', 'Reading'],
      textSeparators: [' ', ','],
      inputFieldBuilder: (context, inputFieldValues) {
        return TextField(
          controller: inputFieldValues.textEditingController,
          focusNode: inputFieldValues.focusNode,
        );
      });
}

containerPhoto(
  DataProfile profile,
  bool save,
  File? imageFile,
  String genderValue,
  TextEditingController horoscope,
  TextEditingController zodiac,
) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Container(
      width: Get.width,
      height: Get.height * 0.25,
      decoration: BoxDecoration(
        image: profile.name != null
            ? DecorationImage(
                image: AssetImage(
                  AssetsHelper.imgBAdventure,
                ),
                fit: BoxFit.fill)
            : null,
        color: HexColor('#162329'),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textInter('@${profile.email},', Colors.white, 14, FontWeight.w700),
            profile.name == null ? hbox(0) : hbox(4),
            profile.name == null
                ? hbox(0)
                : textInter(genderValue, Colors.white, 14, FontWeight.w700),
            profile.name == null ? hbox(0) : hbox(4),
            profile.name == null
                ? hbox(0)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      horoscope.text == ''
                          ? wbox(0)
                          : rowHororscope(horoscope.text),
                      wbox(10),
                      zodiac.text == '' ? wbox(0) : rowZodiac(zodiac.text)
                    ],
                  )
          ],
        ),
      ),
    ),
  );
}

containerAbout(
  DataProfile profile,
  BuildContext context,
  bool about,
  String genderValue,
  TextEditingController cont1,
  TextEditingController name,
  TextEditingController horoscope,
  TextEditingController zodiac,
  TextEditingController heights,
  TextEditingController weights,
  File? imageFile,
  Widget widgetGender,
  Function() func1,
  Function() func2,
  Function() func3,
  Function() func4,
) {
  return Container(
    height: about == true
        ? Get.height * 0.62
        : profile.name != null
            ? Get.height * 0.23
            : Get.height * 0.1,
    width: Get.width,
    decoration: BoxDecoration(
        color: Color.fromARGB(255, 23, 30, 33).withOpacity(0.9),
        borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textInter('About', Colors.white, 14, FontWeight.w700),
              about == false
                  ? InkWell(
                      onTap: func1,
                      child: Image.asset(AssetsHelper.icPen, height: 16))
                  : InkWell(
                      onTap: func2,
                      child: textInter('Save & Update', HexColor('#94783E'), 12,
                          FontWeight.w500)),
            ],
          ),
          hbox(20),
          about == false
              ? profile.name == null
                  ? textInter('Add in your your to help others know you better',
                      Colors.white.withOpacity(0.52), 14, FontWeight.w500)
                  : Column(
                      children: [
                        rowAbout1(
                          'Birthday',
                          cont1.text.replaceAll(' ', ' / '),
                        ),
                        hbox(8),
                        rowAbout1('Horoscope', horoscope.text ?? ''),
                        hbox(8),
                        rowAbout1('Zodiac', zodiac.text ?? ''),
                        hbox(8),
                        rowAbout1(
                            'Height', '${profile.height.toString()} cm' ?? ''),
                        hbox(8),
                        rowAbout1(
                            'Weight', '${profile.weight.toString()} kg' ?? ''),
                      ],
                    )
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: func3,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white.withOpacity(0.08)),
                            child: imageFile != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.file(
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.fill,
                                        imageFile!))
                                : Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        wbox(10),
                        textInter(
                            'Add image', Colors.white, 12, FontWeight.w500)
                      ],
                    ),
                    rowAbout('Display name:', 'Enter name', name),
                    hbox(10),
                    widgetGender,
                    hbox(10),
                    rowDate('Birthday:', 'DD MM YYYY', cont1, func4),
                    hbox(10),
                    rowAbout('Horoscope:', '--', horoscope),
                    hbox(10),
                    rowAbout('Zodiac:', '--', zodiac),
                    hbox(10),
                    rowAboutNum('Height:', 'Add height', heights),
                    hbox(10),
                    rowAboutNum('Weight:', 'Add weight', weights),
                    hbox(10),
                  ],
                ),
        ],
      ),
    ),
  );
}
