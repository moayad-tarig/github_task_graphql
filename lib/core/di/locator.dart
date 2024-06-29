import 'package:get_it/get_it.dart';
import 'package:github_app/core/services/graphql_servies.dart';
import 'package:github_app/core/utils/graphql_config.dart';
import 'package:github_app/features/popularRepository/data/repository/popular_repository_imp.dart';
import 'package:github_app/features/popularRepository/domain/repository/popular_repository.dart';
import 'package:github_app/features/popularRepository/domain/usecases/get_popular_by_name.dart';
import 'package:github_app/features/popularRepository/domain/usecases/get_popular_usecase.dart';
import 'package:github_app/features/popularRepository/ui/bloc/popular_bloc.dart';

GetIt sl = GetIt.instance;

void setup() {
//networking

  sl.registerFactory(() => GraphQlConfig());
  sl.registerFactory(() => GraphQLServices(graphQlConfig: sl()));

// cubit

  sl.registerFactory(() => PopularBloc(sl(), sl(), sl()));

//repo
  sl.registerFactory<PopularRepository>(
      () => PopularRepositoryImp(graphQLServices: sl()));

  //usecase
  sl.registerFactory(() => GetPopularUsecase(popularRepository: sl()));
  sl.registerFactory(() => GetPopularByNameuseCase(popularRepository: sl()));
}
