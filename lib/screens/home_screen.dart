import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:henri_poterie/widgets/book.dart';

import '../bloc/library_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            LibraryBloc()..add(const LibraryEventBooksRequested()),
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Henri Poterie"),
            ),
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                    alignment: Alignment.topCenter,
                    child: BlocBuilder<LibraryBloc, LibraryState>(
                        builder: (context, state) {
                      if (state.status == LibraryStatus.loading) {
                        return const Center(
                            heightFactor: 3,
                            child: CircularProgressIndicator());
                      }
                      return Wrap(
                        spacing: 20,
                        children: [
                          for (var book in state.books) Book(book: book)
                        ],
                      );
                    })))));
  }
}
