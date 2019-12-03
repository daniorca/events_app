import 'package:code_challenge/src/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventDate extends StatelessWidget {
  const EventDate({
    Key key,
    @required this.startDate,
  }) : super(key: key);

  final Start startDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
            DateFormat("dd").format(
                startDate.localDate),
            style: Theme.of(context)
                .textTheme
                .display3
                .copyWith(
                    color: Colors.red[700],
                    fontWeight: FontWeight.bold)),
        Text(
            DateFormat("MMM").format(
                startDate.localDate),
            style: Theme.of(context)
                .textTheme
                .display4
                .copyWith(fontWeight: FontWeight.bold)),
        Text(
            DateFormat("yyyy").format(
                startDate.localDate),
            style: Theme.of(context)
                .textTheme
                .display1
                .copyWith(color: Colors.grey)),
      ],
    );
  }
}