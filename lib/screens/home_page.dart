import 'package:flutter/material.dart';
import 'package:ibtekar_task/base/base_stateful_widget.dart';

class MyHomePage extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends BaseStat<MyHomePage> {
  @override
  getScreenBody() {
    return Container(
      color: Colors.red,
    );
  }
}
