import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_app/features/popularRepository/ui/bloc/popular_bloc.dart';
import 'package:github_app/features/popularRepository/ui/widgets/language_dropdown_widget.dart';
import 'package:github_app/features/popularRepository/ui/widgets/list_tile_widget.dart';
import 'package:github_app/features/popularRepository/ui/widgets/listview_widgets.dart';

class PopularRepositoriesPage extends StatelessWidget {
  const PopularRepositoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> listOfLanguages = [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Over Engineered GitHub Application'),
      ),
      body: BlocConsumer<PopularBloc, PopularState>(
        listener: (context, state) {
          if (state is PopularLanguageListByLanguageLoaded) {
            listOfLanguages = state.languages;
          }
        },
        builder: (context, state) {
          return BlocBuilder<PopularBloc, PopularState>(
            builder: (context, state) {
              if (state is PopularLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is PopularLoaded) {
                return Column(
                  children: [
                    dropDownLangues(context, listOfLanguages),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.popularRepositoriesList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 8.0,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 6.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(64, 75, 96, .9),
                              ),
                              child: MakeListWidget(
                                state.popularRepositoriesList[index],
                                index + 1,
                                context,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else if (state is PopularError) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state is PopularByLanguageLoaded) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<PopularBloc>(context)
                                  .add(GetPopularRepositoriesEvent());
                            },
                            child: Icon(Icons.restart_alt_rounded),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: listViewWidget(state.popularRepositories, context),
                    ),
                  ],
                );
              } else {
                // Handle other states if needed
                return Center(
                  child: Text('Unhandled state: $state'),
                );
              }
            },
          );
        },
      ),
    );
  }
}
