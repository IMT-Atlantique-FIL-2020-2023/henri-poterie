import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:henri_poterie/models/library.dart';

import '../models/book.dart';

part 'library_event.dart';

part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  LibraryBloc() : super(const LibraryState()) {
    on<LibraryEventBooksRequested>(_onLibraryBooksRequested);
  }

  Future<void> _onLibraryBooksRequested(
    LibraryEventBooksRequested event,
    Emitter<LibraryState> emit,
  ) async {
    emit(state.copyWith(status: () => LibraryStatus.loading));
    final library = await Library.fetchLibrary();
    emit(state.copyWith(
      status: () => LibraryStatus.success,
      books: () => library.books,
    ));
  }
}
