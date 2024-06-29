import 'package:github_app/core/networking/result_api.dart';
import 'package:github_app/features/popularRepository/data/model/popular_model.dart';
import 'package:github_app/features/popularRepository/domain/repository/popular_repository.dart';

class GetPopularByNameuseCase {
  final PopularRepository popularRepository;

  GetPopularByNameuseCase({
    required this.popularRepository,
  });

  Future<ResultApi<List<PopularModel>>> call(String name) async {
    return await popularRepository.getPopularRepositoryByLanguage(name);
  }
}
