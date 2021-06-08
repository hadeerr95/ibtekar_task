import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibtekar_task/resources/strings.dart';

abstract class BaseStatefulWidget extends StatefulWidget {}

abstract class BaseStat<T extends BaseStatefulWidget> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getScreenBody(),
    );
  }

  getAppBar() {
    return AppBar(
      title: Text(APP_TITLE),
    );
  }

  getScreenBody();
}
