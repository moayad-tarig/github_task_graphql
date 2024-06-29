import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_app/core/networking/result_api.dart';
import 'package:github_app/features/popularRepository/data/model/popular_model.dart';
import 'package:github_app/features/popularRepository/domain/repository/popular_repository.dart';
import 'package:github_app/features/popularRepository/domain/usecases/get_popular_by_name.dart';
import 'package:github_app/features/popularRepository/domain/usecases/get_popular_usecase.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  PopularRepository popularRepository;
  GetPopularByNameuseCase getPopularByName;
  GetPopularUsecase getPopularUsecase;

  PopularBloc(
      this.popularRepository, this.getPopularByName, this.getPopularUsecase)
      : super(PopularInitial()) {
    on<PopularEvent>((event, emit) async {
      List<String> listOfLanguage = [];
      if (event is GetPopularRepositoriesEvent) {
        emit(PopularLoading());

        final result = await getPopularUsecase();

        switch (result) {
          case Success():
            Set<String> setOfLanguages = result.data
                .map((element) => element.primaryLanguage?.language as String?)
                .where((language) => language != null)
                .map((language) => language!)
                .toSet();
            listOfLanguage = setOfLanguages.toList();

            emit(
                PopularLanguageListByLanguageLoaded(languages: listOfLanguage));

            emit(PopularLoaded(popularRepositoriesList: result.data));
            break;
          case Failure():
            emit(PopularError(message: result.Error));
          default:
        }
        ;
      }

      if (event is GetPopularRepositoryByLanguageEvent) {
        emit(PopularLoading());

        final result =
            await GetPopularByNameuseCase(popularRepository: popularRepository)
                .call(event.language);
        switch (result) {
          case Success():
            Set<String> setOfLanguages = result.data
                .map((element) => element.primaryLanguage?.language as String?)
                .where((language) => language != null)
                .map((language) => language!)
                .toSet();
            listOfLanguage = setOfLanguages.toList();

            emit(
                PopularLanguageListByLanguageLoaded(languages: listOfLanguage));
            emit(PopularByLanguageLoaded(popularRepositories: result.data));
            break;
          case Failure():
            emit(PopularError(message: result.Error));
          default:
        }
      }

      ;
    });
  }
}
