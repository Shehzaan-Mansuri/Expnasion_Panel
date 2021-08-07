import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Expansion Tile';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: Center(child: const Text(_title))),
        body: ExpandingItems(),
      ),
    );
  }
}

class ExpandingItems extends StatefulWidget {
  ExpandingItems({Key key}) : super(key: key);

  @override
  _ExpandingItemsState createState() => _ExpandingItemsState();
}

class _ExpandingItemsState extends State<ExpandingItems> {
  List<bool> _isExpanded = List.generate(10, (_) => false);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: ExpansionPanelList(
          expansionCallback: (index, isExpanded) => setState(() {
            _isExpanded[index] = !isExpanded;
          }),
          children: [
            for (int i = 0; i < 10; i++)
              ExpansionPanel(
                body: ListTile(
                    subtitle: Text(
                        "... amet, consectetur adipiscing elit. Nullam ultricies porta rutrum. Vivamus id ultrices velit. Sed tellus lorem, egestas ac magna non, fringilla sagittis erat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce tempor mi et eleifend fermentum. Sed quis molestie nunc.")),
                headerBuilder: (_, isExpanded) {
                  return Center(
                    child: Text("Shehzaan is a Flutter..."),
                  );
                },
                isExpanded: _isExpanded[i],
              )
          ],
        ),
      ),
    );
  }
}