import 'package:github_app/core/networking/result_api.dart';
import 'package:github_app/core/services/graphql_servies.dart';
import 'package:github_app/features/popularRepository/data/model/popular_model.dart';
import 'package:github_app/features/popularRepository/domain/repository/popular_repository.dart';

class PopularRepositoryImp implements PopularRepository {
  final GraphQLServices graphQLServices;

  PopularRepositoryImp({required this.graphQLServices});

  @override
  Future<ResultApi<List<PopularModel>>> getPopularRepositories() async {
    try {
      final result = await graphQLServices.getPopularRepositories();
      List<dynamic> data = result.data!["search"]["edges"];
      if (data.isEmpty) {
        throw Exception("Error with Query");
      }

      List<PopularModel> popularRepositoriesList =
          data.map((e) => PopularModel.fromJson(e['node'])).toList();

      return Success(popularRepositoriesList);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<ResultApi<List<PopularModel>>> getPopularRepositoryByLanguage(
      String language) async {
    final result = await graphQLServices.getPopularRepositories();
    List<dynamic> list = result.data!["search"]["edges"];

    final popularRepositoriesList = list
        .where((repo) {
          final primaryLanguage = repo['node']['primaryLanguage'];
          return primaryLanguage != null && primaryLanguage['name'] == language;
        })
        .map((repo) => PopularModel.fromJson(repo['node']))
        .toList();

    if (popularRepositoriesList.isEmpty) {
      return Failure("Dos't Found");
    }
    return Success(popularRepositoriesList);
  }
}
