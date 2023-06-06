import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/material.dart';

class BasketSheet extends StatefulWidget {
  final Widget widget;

  const BasketSheet({super.key, required this.widget});

  @override
  State<StatefulWidget> createState() {
    return _BasketSheetState();
  }
}

class _BasketSheetState extends State<BasketSheet> {
  late final Widget innerWidget = widget.widget;
  final separatorColor = const Color.fromRGBO(180, 180, 180, 1);
  final List<IconData> icons = const [
    Icons.message,
    Icons.call,
    Icons.mail,
    Icons.notifications,
    Icons.settings,
  ];
  final List<String> entries = <String>[
    'A',
    'B',
    'C',
    'C',
    'C',
    'C',
    'C',
    'C',
    'C',
    'C',
    'C',
    'C',
    'C',
    'C',
    'C',
    'C',
    'C',
    'C',
    'C',
    'C'
  ];
  final List<int> colorCodes = <int>[
    600,
    500,
    100,
    100,
    100,
    100,
    100,
    100,
    100,
    100,
    100,
    100,
    100,
    100,
    100,
    100,
    100,
    100,
    100,
    100
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableBottomSheet(
      minExtent: 110,
      useSafeArea: false,
      curve: Curves.easeIn,
      previewWidget: _previewWidget(),
      expandedWidget: _expandedWidget(),
      backgroundWidget: innerWidget,
      duration: const Duration(milliseconds: 10),
      maxExtent: MediaQuery.of(context).size.height * 0.8,
      onDragging: (pos) {},
    );
  }

  Widget getHeaderWidgets() {
    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Container(
            width: 40,
            height: 6,
            decoration: BoxDecoration(
              color: separatorColor,
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
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "50.20 €",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 30,
                                  decoration: TextDecoration.none),
                            )),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "2 items",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                              ),
                            )),
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
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                padding: const EdgeInsets.all(15.0)),
                            onPressed: () {},
                            child: const Text("Checkout",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.normal,
                                )))
                      ],
                    ),
                  ))
            ],
          ),
        ]));
  }

  Widget getWidget(List<Widget> children) {
    return Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(220, 220, 220, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(children: children));
  }

  Widget _previewWidget() {
    return getWidget([getHeaderWidgets()]);
  }

  Widget getBooksWidget() {
    return Expanded(
        child: ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          // Each Dismissible must contain a Key. Keys allow Flutter to
          // uniquely identify widgets.
          key: UniqueKey(),
          background: Container(
              color: const Color.fromRGBO(220, 20, 60, 1),
              child: Container(
                  margin: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/trash-can.png"),
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.centerLeft
                    ),
                  ))
              ,
              ),
          //Container(color: const Color.fromRGBO(220, 20, 60, 1))
          // Provide a function that tells the app
          // what to do after an item has been swiped away.
          onDismissed: (direction) {
            // Remove the item from the data source.
            setState(() {
              entries.removeAt(index);
              colorCodes.removeAt(index);
            });

            // Then show a snackbar.
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('caca dismissed')));
          },
          child: Container(
            height: 80,
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
            child: Row(children: [
              Image.network(
                  'https://media.licdn.com/dms/image/C4D03AQFpv8dHg5sz8A/profile-displayphoto-shrink_100_100/0/1600197041834?e=1691625600&v=beta&t=-q05aypl3mtM8FKZiu5OPxy_ErE6oZNUxnv0G2cdJms'),
              Flexible(
                flex: 50,
                child: Container(
                    margin: const EdgeInsets.only(left: 15.0),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Harry la Fraude à l'école des pessis",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    )),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                    margin: const EdgeInsets.only(left: 15.0),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "50.20 €",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Roboto",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    )),
              )
            ]),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: separatorColor,
          height: 0,
        );
      },
    ));
  }

  Widget _expandedWidget() {
    return getWidget([getHeaderWidgets()] + [getBooksWidget()]);
  }
}
