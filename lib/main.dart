import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const PrimaryColor = const Color(0xff0d3985);
const AccentColor = const Color(0xffffffff);
const BackgroundColor = const Color(0xffe5e5e5);
const TextColor = const Color(0xff363636);
const TextColor2 = const Color(0xff4c4c4c);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: PrimaryColor,
        accentColor: AccentColor,
      ),
      title: 'cubeDDC',
      home: MyHomePage(title: 'cubeDDC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 72,
                color: AccentColor,
                padding: EdgeInsets.all(24),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.account_circle,
                      color: PrimaryColor,
                      size: 28,
                    ),
                    Text(
                      'S20000722',
                      style: TextStyle(
                        color: TextColor,
                        fontSize: 24,
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: PrimaryColor,
                      size: 28,
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 250,
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'DDC Label',
                            style: TextStyle(
                              color: TextColor,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 408,
                            height: 56,
                            color: TextColor2,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height - 378,
                          color: AccentColor,
                          padding: EdgeInsets.all(24),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 72,
                color: TextColor2,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 72,
                        child: Row(
                          children: [
                            Icon(
                              Icons.save,
                              color: AccentColor,
                              size: 20,
                            ),
                            Text(
                              'Save',
                              style: TextStyle(
                                color: AccentColor,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.sync,
                            color: AccentColor,
                            size: 20,
                          ),
                          Text(
                            'Sync',
                            style: TextStyle(
                              color: AccentColor,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.navigate_before,
                            color: AccentColor,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.navigate_next,
                            color: AccentColor,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
