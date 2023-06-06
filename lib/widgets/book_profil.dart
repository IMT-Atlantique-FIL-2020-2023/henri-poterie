import 'package:flutter/material.dart';

class BookProfil extends StatelessWidget {
  const BookProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
              image: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/henri-potier.appspot.com/o/hp0.jpg?alt=media'),
              width: 200),
          const SizedBox(height: 20),
          const Text(
            'Henri Potier à l\'école des sorciers',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            'ISBN: 8fabf68-8374-48fe-a7ea-a00ccd07afff',
            style: TextStyle(color: Colors.blueGrey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          const Text('\$35',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.shopping_basket,
              size: 25.0,
            ),
            label: const Text('Add to cart'),
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder()),
            onPressed: () {
              print('add to cart');
            },
          )
        ],
      ),
    );
  }

}