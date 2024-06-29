import 'package:flutter/material.dart';
import 'package:github_app/features/popularRepository/data/model/popular_model.dart';
import 'package:github_app/features/popularRepository/ui/widgets/list_tile_widget.dart';

Widget listViewWidget(List<PopularModel>  popularRepositoriesList, BuildContext context) {
  return ListView.builder(
    itemCount: popularRepositoriesList.length,
    itemBuilder: (BuildContext context, int index) {
      return Card(
        elevation: 8.0,
        margin:  EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration:
              const BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: MakeListWidget(popularRepositoriesList[index] , index + 1, context),
        ),
      );
    },
  );
}
