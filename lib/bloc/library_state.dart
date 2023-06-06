part of 'library_state_bloc.dart';

enum LibraryStatus { initial, loading, success, failure }

final class LibraryState extends Equatable {
  const LibraryState({
    this.status = LibraryStatus.initial,
    this.books = const [],
  });

  final LibraryStatus status;
  final List<Book> books;

  LibraryState copyWith({
    LibraryStatus Function()? status,
    List<Book> Function()? books,
  }) {
    return LibraryState(
      status: status != null ? status() : this.status,
      books: books != null ? books() : this.books,
    );
  }

  @override
  List<Object?> get props => [status, books];
}
