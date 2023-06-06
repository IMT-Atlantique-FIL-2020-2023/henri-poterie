import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/material.dart';

class BasketSheet extends StatelessWidget {
  late final Widget innerWidget;
  BasketSheet(Widget widget, {super.key}) {
    innerWidget = widget;
  }
  final List<IconData> icons = const [
    Icons.message,
    Icons.call,
    Icons.mail,
    Icons.notifications,
    Icons.settings,
  ];
  @override
  Widget build(BuildContext context) {
    const minExtent = 110.0;

    return DraggableBottomSheet(
      minExtent: minExtent,
      useSafeArea: false,
      curve: Curves.easeIn,
      previewWidget: _previewWidget(),
      expandedWidget: _expandedWidget(),
      backgroundWidget: Padding(
        padding: const EdgeInsets.only(bottom: minExtent),
        child: innerWidget
      ),
      duration: const Duration(milliseconds: 10),
      maxExtent: MediaQuery.of(context).size.height * 0.8,
      onDragging: (pos) {},
    );

  }

  Widget _previewWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(220, 220, 220, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 40,
            height: 6,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(180, 180, 180, 1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Flexible(
                  flex: 50,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Column(
                      children: [
                      Align(alignment: Alignment.topLeft, child: Text("50.20 €", style: TextStyle(color: Colors.black, fontSize: 30, decoration: TextDecoration.none),)),
                      Align(alignment: Alignment.topLeft, child: Text("2 items", style: TextStyle(color: Colors.black, fontSize: 20, decoration: TextDecoration.none,),)),
                      ],
                    ),
                  )),
              Flexible(
                  flex: 50,
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: [
                        ElevatedButton(
                            style:  ElevatedButton.styleFrom(
                              shape: const StadiumBorder(), padding: const EdgeInsets.all(15.0)),
                            onPressed: () {  },
                            child: const Text("Checkout", style: TextStyle(fontSize: 25))
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Widget _expandedWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: <Widget>[
          const Icon(Icons.keyboard_arrow_down, size: 30, color: Colors.white),
          const SizedBox(height: 8),
          const Text(
            'Hey...I\'m expanding!!!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              itemCount: icons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icons[index], color: Colors.pink, size: 40),
              ),
            ),
          )
        ],
      ),
    );
  }
}