part of 'popular_bloc.dart';

sealed class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object> get props => [];
}

final class PopularInitial extends PopularState {}

class PopularLoading extends PopularState {}

class PopularLoaded extends PopularState {
  final List<PopularModel> popularRepositoriesList;
  const PopularLoaded({required this.popularRepositoriesList});
}

class PopularError extends PopularState {
  final String message;
  const PopularError({required this.message});
}

class PopularByLanguageLoaded extends PopularState {
  final List<PopularModel> popularRepositories;
  const PopularByLanguageLoaded({required this.popularRepositories});
}

class PopularLanguageListByLanguageLoaded extends PopularState {
  final List<String> languages;
  const PopularLanguageListByLanguageLoaded({required this.languages});
}
