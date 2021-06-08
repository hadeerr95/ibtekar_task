import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibtekar_task/base/base_stateful_widget.dart';
import 'package:ibtekar_task/blocs/people_bloc.dart';
import 'package:ibtekar_task/blocs/people_event.dart';
import 'package:ibtekar_task/blocs/people_state.dart';
import 'package:ibtekar_task/models/people_model.dart';

class MyHomePage extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends BaseStat<MyHomePage> {
  PeopleListEvent? event;
  ScrollController? controller;
  static int apiPage = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    addEvent();
    controller = new ScrollController()..addListener(_scrollListener);
  }

  void addEvent() {
    apiPage++;
    event = PeopleListEvent(apiPage);
    context.read<PeopleBloc>().add(event!);
  }

  void _scrollListener() {
    print(controller!.position.extentAfter);
    if (controller!.position.extentAfter < 500) {
      addEvent();
    }
  }

  List<PeopleModel> peoples = [];
  @override
  getScreenBody() {
    return BlocBuilder<PeopleBloc, PeopleListState>(builder: (context, state) {
      if (state is PeopleListFetchedState && state.peoples.length > 0) {
        peoples.addAll(state.peoples);
        return ListView.builder(
            controller: controller,
            itemCount: peoples.length,
            itemBuilder: (context, index) {
              return buildPeopleItem(peoples[index]);
            });
      }
      return Center(child: CircularProgressIndicator());
    });
  }

  buildPeopleItem(PeopleModel peopl) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Text(peopl.name),
        ],
      ),
    );
  }
}
