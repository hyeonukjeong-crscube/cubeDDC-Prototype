import 'package:flutter/material.dart';
import 'package:select_dialog/select_dialog.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

const PrimaryColor = const Color(0xff0d3985);
const AccentColor = const Color(0xffffffff);
const BackgroundColor = const Color(0xfff9f9f9);
const TextColor = const Color(0xff363636);
const TextColor2 = const Color(0xff4c4c4c);
const TextColor3 = const Color(0xffacacac);
const _LightGrey = const Color(0xffcacaca);
const _LightGrey2 = const Color(0xff575757);
const _LightGrey3 = const Color(0xffeeeeee);
const BorderColor = const Color(0xffd4d4d4);
const subjectList = [
  'S000001',
  'S000002',
  'S000003',
  'S000004',
  'S000005',
  'S000006',
  'S000007',
  'S000008',
  'S000009',
  'S000010',
];
String _novalue = "No Value";
String subjectName = "S000001";
String currentTime = "Get Current Time";
List<bool> radioBool = [
  true,
  false,
  false,
];
List<bool> checkeBool = [
  true,
  false,
  false,
];
final ImagePicker _picker = ImagePicker();
PickedFile _image;
var imageName = TextEditingController();
DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: PrimaryColor,
        accentColor: AccentColor,
        unselectedWidgetColor: PrimaryColor,
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
  Future _getImage() async {
    PickedFile image = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      _image == null
          ? imageName.text = "No File Selected"
          : imageName.text = _image.path.split('/').last;
    });
  }

  void getCurrentTime() {
    setState(() {
      currentTime = formatter.format(DateTime.now());
    });
  }

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
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AccentColor,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: BorderColor,
                    ),
                  ),
                ),
                child: InkWell(
                  onTap: () => SelectDialog.showModal(
                    context,
                    backgroundColor: AccentColor,
                    searchBoxDecoration: InputDecoration(
                      hintText: 'Subject Name',
                      hintStyle: TextStyle(
                        color: TextColor2,
                        fontSize: 24,
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: TextColor2,
                        size: 22,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: BorderColor,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: BorderColor,
                        ),
                      ),
                    ),
                    constraints: BoxConstraints(
                      maxWidth: 460,
                      maxHeight: 560,
                    ),
                    titleStyle: TextStyle(
                      color: TextColor,
                      fontSize: 24,
                    ),
                    label: 'Search Subject',
                    selectedValue: _novalue,
                    items: subjectList,
                    itemBuilder: (
                      BuildContext context,
                      item,
                      bool isSelected,
                    ) {
                      return Container(
                        child: ListTile(
                          leading: Icon(
                            Icons.account_circle,
                            color: PrimaryColor,
                            size: 30,
                          ),
                          selected: isSelected,
                          title: Text(
                            item,
                            style: TextStyle(
                              color: TextColor,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      );
                    },
                    onChange: (String selected) {
                      setState(() {
                        _novalue = selected;
                        subjectName = selected;
                      });
                    },
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.account_circle,
                        color: PrimaryColor,
                        size: 28,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        subjectName,
                        style: TextStyle(
                          color: TextColor,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Icon(
                        Icons.search,
                        color: PrimaryColor,
                        size: 28,
                      )
                    ],
                  ),
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
                            // decoration: BoxDecoration(
                            //   color: _LightGrey3,
                            //   border: Border.all(
                            //     width: 1,
                            //     color: BorderColor,
                            //   ),
                            //   borderRadius: BorderRadius.all(
                            //     Radius.circular(5),
                            //   ),
                            // ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height - 378,
                          padding: EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: AccentColor,
                            border: Border.all(
                              width: 1,
                              color: BorderColor,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Now',
                                  style: TextStyle(
                                    color: TextColor,
                                    fontSize: 24,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '$currentTime',
                                      style: TextStyle(
                                        color: TextColor2,
                                        fontSize: 24,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Icon(
                                      Icons.schedule,
                                      color: PrimaryColor,
                                      size: 24,
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    SizedBox(
                                      width: 76,
                                      height: 40,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: PrimaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                        ),
                                        onPressed: () => {getCurrentTime()},
                                        child: Text(
                                          'Now',
                                          style: TextStyle(
                                            color: AccentColor,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                                Text(
                                  'Radio',
                                  style: TextStyle(
                                    color: TextColor,
                                    fontSize: 24,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Column(
                                  children: [
                                    for (var i = 0; i < 3; i += 1)
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 8,
                                              ),
                                              RoundCheckBox(
                                                onTap: (bool value) {
                                                  setState(() {
                                                    radioBool[i] = value;
                                                  });
                                                },
                                                isChecked: radioBool[i],
                                                size: 32,
                                                borderColor: Colors.transparent,
                                                checkedWidget: Icon(
                                                  Icons.radio_button_checked,
                                                  color: PrimaryColor,
                                                  size: 28,
                                                ),
                                                uncheckedWidget: Icon(
                                                  Icons.radio_button_unchecked,
                                                  color: PrimaryColor,
                                                  size: 28,
                                                ),
                                                checkedColor:
                                                    Colors.transparent,
                                                uncheckedColor:
                                                    Colors.transparent,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                'Example ${i + 1}',
                                                style: TextStyle(
                                                  color: TextColor2,
                                                  fontSize: 24,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 48,
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                                Text(
                                  'Check',
                                  style: TextStyle(
                                    color: TextColor,
                                    fontSize: 24,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Column(
                                  children: [
                                    for (var i = 0; i < 3; i += 1)
                                      Row(
                                        children: [
                                          Checkbox(
                                            onChanged: (bool value) {
                                              setState(() {
                                                checkeBool[i] = value;
                                              });
                                            },
                                            value: checkeBool[i],
                                            activeColor: PrimaryColor,
                                          ),
                                          Text(
                                            'Example ${i + 1}',
                                            style: TextStyle(
                                              color: TextColor2,
                                              fontSize: 24,
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                                Text(
                                  'Text Area',
                                  style: TextStyle(
                                    color: TextColor,
                                    fontSize: 24,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: BorderColor,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: BorderColor,
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: TextColor2,
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                                Text(
                                  'File Upload',
                                  style: TextStyle(
                                    color: TextColor,
                                    fontSize: 24,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                TextField(
                                  readOnly: true,
                                  controller: imageName,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: BorderColor,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: BorderColor,
                                      ),
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        _getImage();
                                      },
                                      child: Icon(
                                        Icons.file_upload,
                                        color: PrimaryColor,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: TextColor2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 72,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: PrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: () => showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: AccentColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                              ),
                              title: Column(
                                children: <Widget>[
                                  Text(
                                    "Saved",
                                    style: TextStyle(
                                      color: TextColor,
                                    ),
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text(
                                    "OK",
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.save,
                              size: 20,
                              color: AccentColor,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 24,
                                color: AccentColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 144,
                      height: 72,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: _LightGrey,
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: () => showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: AccentColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                              ),
                              title: Column(
                                children: <Widget>[
                                  Text(
                                    "Synced",
                                    style: TextStyle(
                                      color: TextColor,
                                    ),
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text(
                                    "OK",
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.sync,
                              size: 20,
                              color: AccentColor,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Sync',
                              style: TextStyle(
                                fontSize: 24,
                                color: AccentColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 72,
                      height: 72,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: _LightGrey2,
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: () {},
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 25,
                          color: AccentColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 72,
                      height: 72,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: _LightGrey2,
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: () {},
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 25,
                          color: AccentColor,
                        ),
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
