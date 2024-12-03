part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

class PostsFetchingLoadingState extends PostsState {}

class PostsActionState extends PostsState {}

class PostsInitial extends PostsState {}

class PostFetchingSucessfulState extends PostsState {
  final List<PostDataUiModel> posts;

  PostFetchingSucessfulState({
    required this.posts,
  });
}

class PostsFetchingErrorState extends PostsState {
  final String error;

  PostsFetchingErrorState({
    required this.error,
  });
}

class PostAdditionSuccessState extends PostsActionState {}

class PostAdditionErrorState extends PostsActionState {}
