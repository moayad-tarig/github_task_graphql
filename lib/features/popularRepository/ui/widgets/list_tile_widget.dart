import 'package:flutter/material.dart';
import 'package:github_app/features/popularRepository/data/model/popular_model.dart';

Widget MakeListWidget(PopularModel list, int index, BuildContext context) {
  return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: const EdgeInsets.only(right: 12.0),
        decoration: const BoxDecoration(
            border:
                Border(right: BorderSide(width: 1.0, color: Colors.white24))),
        child: Text(
          index.toString(),
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.white),
        ),
      ),
      title: Text(
        list.name.toString(),
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        children: [
          Row(
            children: <Widget>[
              const Text(" Starz Count", style: TextStyle(color: Colors.white)),
              const SizedBox(width: 5.0),
              Text(
                "${list.stargazerCount}",
                style: const TextStyle(color: Colors.yellowAccent),
              ),
              const SizedBox(width: 5.0),
            ],
          ),
          Row(children: <Widget>[
            Text(
              "Language ",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.white),
            ),
            Text(
              list.primaryLanguage?.language.toString() ?? 'Not Known',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.redAccent),
            ),
            SizedBox(width: 5.0),
          ]),
        ],
      ),
      trailing: const Icon(Icons.keyboard_arrow_right,
          color: Colors.white, size: 30.0));
}
