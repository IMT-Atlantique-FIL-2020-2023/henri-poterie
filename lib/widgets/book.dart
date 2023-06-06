import 'package:flutter/cupertino.dart';

class Book extends StatelessWidget {
  const Book({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
          Navigator.pushNamed(context, '/book')
        },
        child: const Center(
            child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image(
                        image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/henri-potier.appspot.com/o/hp0.jpg?alt=media')),
                    Text(
                      'Henri Potier à l\'école des sorciers',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    Text('\$35',)
                  ],
                ),
            ),
        )
    );
  }
}
