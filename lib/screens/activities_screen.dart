import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import '../custom_colors.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  DateTime _currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Activities',
          style: TextStyle(
              color: Color(CustomColors.pinkDark),
              fontSize: 22,
              fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: CalendarCarousel<Event>(
          onDayPressed: (DateTime date, List<Event> events) {
            this.setState(() => _currentDate = date);
          },
          weekendTextStyle: TextStyle(
            color: Colors.red,
          ),
          thisMonthDayBorderColor: Colors.grey,
//      weekDays: null, /// for pass null when you do not want to render weekDays
//      headerText: Container( /// Example for rendering custom header
//        child: Text('Custom Header'),
//      ),
          customDayBuilder: (
            /// you can provide your own build function to make custom day containers
            bool isSelectable,
            int index,
            bool isSelectedDay,
            bool isToday,
            bool isPrevMonthDay,
            TextStyle textStyle,
            bool isNextMonthDay,
            bool isThisMonthDay,
            DateTime day,
          ) {
            /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
            /// This way you can build custom containers for specific days only, leaving rest as default.

            // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
            if (day.day == 15) {
              return Center(
                child: Icon(Icons.local_airport),
              );
            } else {
              return null;
            }
          },
          weekFormat: false,

          height: 420.0,
          selectedDateTime: _currentDate,
          daysHaveCircularBorder: false,

          /// null for not rendering any border, true for circular border, false for rectangular border
        ),
      ),
    );
  }
}
