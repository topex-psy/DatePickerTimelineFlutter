library date_picker_timeline;

import 'package:date_picker_timeline/date_widget.dart';
import 'package:date_picker_timeline/extra/color.dart';
import 'package:date_picker_timeline/extra/style.dart';
import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

class DatePickerTimeline extends StatefulWidget {
  final double height;
  final double itemWidth;
  final TextStyle monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final DateTime currentDate;
  final DateTime minDate;
  final DateTime maxDate;
  final DateChangeListener onDateChange;
  final String locale;

  // Creates the DatePickerTimeline Widget
  DatePickerTimeline(
    this.currentDate, {
    Key key,
    this.height = 80,
    this.itemWidth = 60,
    this.monthTextStyle = defaultMonthTextStyle,
    this.dayTextStyle = defaultDayTextStyle,
    this.dateTextStyle = defaultDateTextStyle,
    this.selectionColor = AppColors.defaultSelectionColor,
    @required this.minDate,
    @required this.maxDate,
    this.onDateChange,
    this.locale = "en_US",
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _DatePickerState();
}

class _DatePickerState extends State<DatePickerTimeline> {
  DateTime _currentDate;
  int _currentIndex;
  ScrollController _scrollController = ScrollController();
  int _daysCount;

  @override void initState() {
    super.initState();

    initializeDateFormatting(widget.locale, null);
    _currentDate = widget.currentDate;
    _currentIndex = widget.currentDate.difference(widget.minDate).inDays + 1;
    _daysCount = widget.maxDate.difference(widget.minDate).inDays + 1;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_currentIndex * widget.itemWidth);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: ListView.builder(
        itemCount: _daysCount,
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        itemBuilder: (context, index) {
          // Return the Date Widget
          DateTime _date = widget.minDate.add(Duration(days: index));
          DateTime date = DateTime(_date.year, _date.month, _date.day);
          bool isSelected = compareDate(date, _currentDate);

          return DateWidget(
            width: widget.itemWidth,
            date: date,
            monthTextStyle: widget.monthTextStyle,
            dateTextStyle: widget.dateTextStyle,
            dayTextStyle: widget.dayTextStyle,
            locale: widget.locale,
            selectionColor: isSelected ? widget.selectionColor : Colors.transparent,
            onDateSelected: (selectedDate) {
              // A date is selected
              if (widget.onDateChange != null) {
                widget.onDateChange(selectedDate);
              }
              _scrollController.animateTo(index * widget.itemWidth, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
              setState(() {
                _currentDate = selectedDate;
                _currentIndex = index;
              });
            },
          );
        },
      ),
    );
  }

  bool compareDate(DateTime date1, DateTime date2) {
    return date1.day == date2.day &&
        date1.month == date2.month &&
        date1.year == date2.year;
  }
}
