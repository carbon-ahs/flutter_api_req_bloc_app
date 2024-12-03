import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    // on<PostsEvent>((event, emit) {});
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
  }
  FutureOr<void> postsInitialFetchEvent(
    PostsInitialFetchEvent event,
    Emitter<PostsState> emit,
  ) async {
    var client = http.Client();
    try {
      final response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      print(response.body);
      // emit(PostsLoadedState(response.body));
    } catch (e) {
      log(e.toString());
    }
  }
}
