import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SizedBox sizedBox = const SizedBox(height: 22);
  Color backgroundColorBody = const Color.fromARGB(255, 33, 40, 43);
  Color backgroundColorAppBar = const Color.fromARGB(255, 57, 73, 80);

  // سنين شهور ايام
  String year = "";
  String month = "";
  String dayNumber = "";
  // اليوم الحالي وهو بيحسب اليوم بالارقام بيبدا من يوم الاتنين كده 1 وهكذا
  String weekday = "";
  // ساعات دقائق ثواني
  int hour = 0;
  String minute = "";
  String second = "";
  // يحدد الوقت بنهار ولا بليل ص او م
  String pmORam = "ص";

// يستخدم لتغيير كل ثانية
  changeEverySec() {
    Timer.periodic(const Duration(milliseconds: 1), (timer) {
      setState(() {
        // سنين شهور ايام
        year = DateTime.now().year.toString();
        month = DateTime.now().month.toString();
        dayNumber = DateTime.now().day.toString();
        // اليوم الحالي
        weekday = DateTime.now().weekday.toString();
        switch (weekday) {
          case '1':
            weekday = 'الاثنين';
            break;
          case '2':
            weekday = 'الثلاثاء';
            break;
          case '3':
            weekday = 'الأربعاء';
            break;
          case '4':
            weekday = 'الخميس';
            break;
          case '5':
            weekday = 'الجمعة';
            break;
          case '6':
            weekday = 'السبت';
            break;
          case '7':
            weekday = 'الأحد';
            break;
        }
        //   // ساعات دقائق ثواني
        hour = DateTime.now().hour;
        if (hour > 12) {
          hour = hour - 12;
          pmORam = "م";
        }
        minute = DateTime.now().minute.toString();
        second = DateTime.now().second.toString();
      });
    });
  }

// يتم استخدام هذا الكود بتنفيذ امر مره واحده فقط عند فتح التطبيق
// يعني انا فتح دلواتي التطبيق بعد مثلا 7 ثواني يعرض نص مكتوب محمود {يعني هيتنفذ بعد 5 ثواني}
  String seconds = '';
  calledOneTimeAfter5Sec() {
    Timer(const Duration(seconds: 5), () {
      setState(() {
        seconds = 'Mahmoud Hany';
      });
    });
  }

  // يتم استدعاؤه مرة واحدة عند بدء تشغيل التطبيق الخاص بك لأول مرة
  @override
  void initState() {
    super.initState();
    changeEverySec();
    calledOneTimeAfter5Sec();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorBody,
      appBar: AppBar(
        backgroundColor: backgroundColorAppBar,
        title: const Text(
          'Time & Date App',
          style: TextStyle(
            fontSize: 27,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              seconds,
              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
            sizedBox,
            TextWidget(
              text:
                  '${hour.toString().padLeft(2, '0')}:${minute.padLeft(2, '0')}:${second.padLeft(2, '0')} $pmORam',
            ),
            sizedBox,
            TextWidget(text: "اليوم : $weekday"),
            sizedBox,
            TextWidget(text: "التاريخ : $year/$month/$dayNumber "),
          ],
        ),
      ),
    );
  }
}
