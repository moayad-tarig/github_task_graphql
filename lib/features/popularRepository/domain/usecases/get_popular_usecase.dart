import 'package:github_app/core/networking/result_api.dart';
import 'package:github_app/features/popularRepository/data/model/popular_model.dart';
import 'package:github_app/features/popularRepository/domain/repository/popular_repository.dart';

class GetPopularUsecase {
  final PopularRepository popularRepository;

  GetPopularUsecase({
    required this.popularRepository,
  });

//make class callable

  Future<ResultApi<List<PopularModel>>> call() async {
    return await popularRepository.getPopularRepositories();
  }
}
