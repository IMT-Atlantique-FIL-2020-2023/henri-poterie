part of 'library_bloc.dart';

sealed class LibraryEvent extends Equatable {
  const LibraryEvent();

  @override
  List<Object> get props => [];
}

final class LibraryEventBooksRequested extends LibraryEvent {
  const LibraryEventBooksRequested();
}
