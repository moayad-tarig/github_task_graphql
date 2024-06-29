import 'package:github_app/core/networking/result_api.dart';
import 'package:github_app/features/popularRepository/data/model/popular_model.dart';

abstract class PopularRepository {
  Future<ResultApi<List<PopularModel>>> getPopularRepositories();
  Future<ResultApi<List<PopularModel>>> getPopularRepositoryByLanguage(
      String language);
}
