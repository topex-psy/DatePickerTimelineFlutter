# DatePickerTimeline

[![Pub](https://img.shields.io/pub/v/date_picker_timeline?color=%232bb6f6)](https://pub.dev/packages/date_picker_timeline)

Flutter Date Picker Library that provides a calendar as a horizontal timeline. This version enables you to select date from past and future by passing `minDate` and `maxDate` constructor. Also automatically jump to `currentDate`, and added some scroll animation.

<p>
 <img src="https://raw.githubusercontent.com/iamvivekkaushik/DatePickerTimelineFlutter/master/screenshots/demo.gif?raw=true"/>
</p>

## How To Use

Import the following package in your dart file

```dart
import 'package:date_picker_timeline/date_picker_timeline.dart';
```

## Usage

Use the `DatePickerTimeline` Widget

```dart
Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      DatePickerTimeline(
        DateTime.now(),
        minDate: DateTime.now().subtract(Duration(days: 10)),
        maxDate: DateTime.now(),
        onDateChange: (date) {
          // New date selected
          print(date.day.toString());
        },
      ),
    ],
)
```

##### Constructor:

```dart
DatePickerTimeline(
  this.currentDate, {
  Key key,
  this.height = 80,
  this.itemWidth = 60,
  this.monthTextStyle = defaultMonthTextStyle,
  this.dayTextStyle = defaultDayTextStyle,
  this.dateTextStyle = defaultDateTextStyle,
  this.selectionColor = AppColors.defaultSelectionColor,
  this.minDate,
  this.maxDate,
  this.onDateChange,
  this.locale,
}) : super(key: key);
```

About This Fork
------

* This version enables you to select date from past and future by passing `minDate` and `maxDate` constructor.
* Also automatically jump to `currentDate`, and added some scroll animation.


Original Author
------

* [Vivek Kaushik](http://github.com/iamvivekkaushik/)


Contributors
------------
* [BradInTheUSA](https://github.com/bradintheusa)
* [Roger](https://github.com/rogermedeirosdasilva)
