import 'package:flutter_test/flutter_test.dart';
import 'package:github_app/core/networking/result_api.dart';
import 'package:github_app/features/popularRepository/data/model/popular_model.dart';
import 'package:github_app/features/popularRepository/domain/repository/popular_repository.dart';
import 'package:github_app/features/popularRepository/domain/usecases/get_popular_by_name.dart';
import 'package:mocktail/mocktail.dart';

class MockPopularRepository extends Mock implements PopularRepository {}

void main() {
  late GetPopularByNameuseCase usecase;
  late MockPopularRepository mockPopularRepository;

  setUp(() {
    mockPopularRepository = MockPopularRepository();
    usecase = GetPopularByNameuseCase(popularRepository: mockPopularRepository);
  });

  group('GetPopularByNameuseCase', () {
    test('should return Success when getPopularRepositoryByLanguage is called',
        () async {
      // arrange
      final listPopularModel = [
        PopularModel(
          "3",
          "moayad",
          "description",
          PrimaryLanguage("language"),
          334,
          "url",
        )
      ];
      when(() => mockPopularRepository.getPopularRepositoryByLanguage('Moayad TArig'))
          .thenAnswer((_) async => Success(listPopularModel));

      // act
      final result = await usecase.call('language_name');

      // assert
      expect(result, isA<ResultApi<List<PopularModel>>>());
    });

    test('should return Failure when getPopularRepositoryByLanguage is called',
        () async {
      // arrange
      when(() => mockPopularRepository.getPopularRepositories())
          .thenAnswer((_) async => Failure('error'));

      // act
      final result = await usecase.call('language_name');

      // assert
      expect(result, isA<ResultApi<List<PopularModel>>>());
  
    });
  });
}
