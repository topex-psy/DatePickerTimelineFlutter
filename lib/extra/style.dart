import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/extra/dimen.dart';

const TextStyle defaultMonthTextStyle = TextStyle(
  color: AppColors.defaultMonthColor,
  fontSize: Dimen.monthTextSize,
  fontFamily: 'NotoSans',
  fontWeight: FontWeight.bold,
  height: 1.4
);

const TextStyle defaultDateTextStyle = TextStyle(
  color: AppColors.defaultDateColor,
  fontSize: Dimen.dateTextSize,
  fontFamily: 'NotoSans',
  fontWeight: FontWeight.bold,
  height: 1.4
);

const TextStyle defaultDayTextStyle = TextStyle(
  color: AppColors.defaultDayColor,
  fontSize: Dimen.dayTextSize,
  fontFamily: 'NotoSans',
  fontWeight: FontWeight.normal,
  height: 1.4
);
