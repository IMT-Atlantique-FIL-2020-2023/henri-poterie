import 'package:flutter/material.dart';
import 'package:henri_poterie/models/book.dart' as model;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_cubit.dart';
import '../models/book.dart';
import '../models/cart.dart';

class BookProfil extends StatelessWidget {
  final model.Book _book;

  const BookProfil({super.key, required model.Book book}) : _book = book;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, Cart>(
        builder: (context, cart) => Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: NetworkImage(_book.coverUrl.toString()), width: 200),
          const SizedBox(height: 20),
          Text(
            _book.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'ISBN: ${_book.isbn}',
            style: const TextStyle(color: Colors.blueGrey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text('\$${_book.price}', style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.shopping_basket,
              size: 25.0,
            ),
            label: const Text('Add to cart'),
            style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
            onPressed: () {
              context.read<CartCubit>().addBook(_book);
            },
          )
        ],
      ),
    ));
  }
}
