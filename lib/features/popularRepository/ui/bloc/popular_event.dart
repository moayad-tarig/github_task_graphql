part of 'popular_bloc.dart';

sealed class PopularEvent extends Equatable {
  const PopularEvent();

  @override
  List<Object> get props => [];
}



class GetPopularRepositoriesEvent extends PopularEvent {}

class GetPopularRepositoryByLanguageEvent extends PopularEvent {
  final String language;
  const GetPopularRepositoryByLanguageEvent({required this.language});
}
