import 'package:flutter/material.dart';
import 'package:lunar/calendar/Lunar.dart';
import 'package:lunar/calendar/LunarMonth.dart';

class LunarCalendar extends StatefulWidget {
  const LunarCalendar({super.key});

  @override
  State<LunarCalendar> createState() => _LunarCalendarState();
}

class _LunarCalendarState extends State<LunarCalendar> {
  final DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Lunar date = Lunar.fromDate(_selectedDate);
    LunarMonth month = LunarMonth.fromYm(date.getYear(), date.getMonth())!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('农历日历'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
        ),
        itemBuilder: (context, index) {
          Lunar lunar =
              Lunar.fromYmd(date.getYear(), date.getMonth(), index + 1);
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(lunar.getMonthInChinese()),
                Text(lunar.getDayInChinese()),
              ],
            ),
          );
        },
        itemCount: month.getDayCount(),
      ),
    );
  }
}
