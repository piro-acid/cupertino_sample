import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: TabPage(),
      theme: CupertinoThemeData(primaryColor: Colors.blue),
    );
  }
}

class TabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            title: Text('Place bid'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            title: Text('Profile'),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        assert(index >= 0 && index <= 3);
        switch (index) {
          case 0:
            return MyHomePage();
            break;
          case 1:
            return Container(color: Colors.yellow);
            break;
          case 2:
            return Container(color: Colors.green);
            break;
        }
        return null;
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isCupertinoIndicatorShowing = false;
  bool _isShowCupertinoSlider = false;
  double _sliderValue = 0.5;
  bool _isShowCupertinoSwitch = false;
  bool _cupertinoSwitchValue = false;
  bool _isShowSegmentedControl = false;
  int _selectedGroup = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          trailing: Icon(CupertinoIcons.settings),
          middle: Text("Title"),
          leading: Icon(CupertinoIcons.back),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              _buildButtonForShowCupertinoActionSheet(),
              SizedBox(height: 20.0),
              _buildButtonForShowCupertinoIndicator(),
              SizedBox(height: 20.0),
              _buildButtonForShowCupertinoAlertDialog(),
              SizedBox(height: 20.0),
              _buildButtonForShowCupertinoDatetimePicker(),
              SizedBox(height: 20.0),
              _buildButtonForShowCupertinoPicker(),
              SizedBox(height: 20.0),
              _buildButtonForShowCupertinoTimePicker(),
              SizedBox(height: 20.0),
              _buildButtonForShowCupertinoSlider(),
              SizedBox(height: 20.0),
              _buildButtonForShowCupertinoSwitch(),
              SizedBox(height: 20.0),
              _buildButtonForShowCupertinoSegmentedControl(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonForShowCupertinoIndicator() {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width - 40.0,
          child: CupertinoButton(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Show indicator",
              style: TextStyle(fontSize: 14.0),
            ),
            color: Colors.grey,
            onPressed: () {
              setState(
                () => _isCupertinoIndicatorShowing =
                    !_isCupertinoIndicatorShowing,
              );
            },
          ),
        ),
        _isCupertinoIndicatorShowing
            ? CupertinoActivityIndicator(
                animating: _isCupertinoIndicatorShowing,
              )
            : Container(),
      ],
    );
  }

  Widget _buildButtonForShowCupertinoActionSheet() {
    return Container(
      width: MediaQuery.of(context).size.width - 40.0,
      child: CupertinoButton(
        padding: EdgeInsets.all(10.0),
        child: Text(
          "Show action sheet",
          style: TextStyle(fontSize: 14.0),
        ),
        color: Colors.grey,
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) {
              return showCupertinoActionSheet(context);
            },
          );
        },
      ),
    );
  }

  Widget _buildButtonForShowCupertinoAlertDialog() {
    return Container(
      width: MediaQuery.of(context).size.width - 40.0,
      child: CupertinoButton(
        padding: EdgeInsets.all(10.0),
        child: Text(
          "Show alert dialog",
          style: TextStyle(fontSize: 14.0),
        ),
        color: Colors.grey,
        onPressed: () {
          showCupertinoDialog(
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: Text("This is a title"),
                content: Text("This is a content"),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text("Default Button"),
                    onPressed: () => Navigator.of(context).pop(),
                    isDefaultAction: true,
                  ),
                  CupertinoDialogAction(
                    child: Text("Destructive Button"),
                    onPressed: () => Navigator.of(context).pop(),
                    isDestructiveAction: true,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildButtonForShowCupertinoDatetimePicker() {
    return Container(
      width: MediaQuery.of(context).size.width - 40.0,
      child: CupertinoButton(
        padding: EdgeInsets.all(10.0),
        child: Text(
          "Show date picker",
          style: TextStyle(fontSize: 14.0),
        ),
        color: Colors.grey,
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: MediaQuery.of(context).size.height / 3,
                child: CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (value) => print(value),
                  mode: CupertinoDatePickerMode.dateAndTime,
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildButtonForShowCupertinoPicker() {
    return Container(
      width: MediaQuery.of(context).size.width - 40.0,
      child: CupertinoButton(
        padding: EdgeInsets.all(10.0),
        child: Text(
          "Show picker",
          style: TextStyle(fontSize: 14.0),
        ),
        color: Colors.grey,
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: MediaQuery.of(context).size.height / 3,
                child: CupertinoPicker(
                  diameterRatio: 1.0,
                  itemExtent: 30.0,
                  children: <Widget>[
                    Text("Item1"),
                    Text("Item2"),
                    Text("Item3"),
                    Text("Item4"),
                  ],
                  onSelectedItemChanged: (int index) => print(index),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildButtonForShowCupertinoTimePicker() {
    return Container(
      width: MediaQuery.of(context).size.width - 40.0,
      child: CupertinoButton(
        padding: EdgeInsets.all(10.0),
        child: Text(
          "Show time picker",
          style: TextStyle(fontSize: 14.0),
        ),
        color: Colors.grey,
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: MediaQuery.of(context).size.height / 3,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 20.0,
                  ),
                  child: CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.hms,
                    onTimerDurationChanged: (Duration duration) =>
                        print(duration),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildButtonForShowCupertinoSlider() {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width - 40.0,
          child: CupertinoButton(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Show slider",
              style: TextStyle(fontSize: 14.0),
            ),
            color: Colors.grey,
            onPressed: () {
              setState(
                () => _isShowCupertinoSlider = !_isShowCupertinoSlider,
              );
            },
          ),
        ),
        _isShowCupertinoSlider
            ? CupertinoSlider(
                value: _sliderValue,
                onChanged: (value) {
                  setState(() => _sliderValue = value);
                },
              )
            : Container(),
      ],
    );
  }

  Widget _buildButtonForShowCupertinoSwitch() {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width - 40.0,
          child: CupertinoButton(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Show switch",
              style: TextStyle(fontSize: 14.0),
            ),
            color: Colors.grey,
            onPressed: () {
              setState(
                () => _isShowCupertinoSwitch = !_isShowCupertinoSwitch,
              );
            },
          ),
        ),
        _isShowCupertinoSwitch
            ? CupertinoSwitch(
                value: _cupertinoSwitchValue,
                onChanged: (value) {
                  setState(() => _cupertinoSwitchValue = value);
                },
              )
            : Container(),
      ],
    );
  }

  Widget _buildButtonForShowCupertinoSegmentedControl() {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width - 40.0,
          child: CupertinoButton(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Show segmented control",
              style: TextStyle(fontSize: 14.0),
            ),
            color: Colors.grey,
            onPressed: () {
              setState(
                () => _isShowSegmentedControl = !_isShowSegmentedControl,
              );
            },
          ),
        ),
        _isShowSegmentedControl
            ? Container(
                width: MediaQuery.of(context).size.width - 20.0,
                child: CupertinoSegmentedControl(
                  children: {
                    1: Text("FIRST"),
                    2: Text("SECOND"),
                  },
                  groupValue: _selectedGroup,
                  onValueChanged: (value) {
                    setState(
                      () => _selectedGroup = value,
                    );
                  },
                  selectedColor: Colors.blue,
                  pressedColor: Colors.blue,
                  unselectedColor: Colors.white,
                  borderColor: Colors.blue,
                ),
              )
            : Container(),
      ],
    );
  }
}

Widget showCupertinoActionSheet(BuildContext context) {
  return CupertinoActionSheet(
    title: Text("CupertinoActionsSheet"),
    message: Text("This is a message. Long message is shown like this."),
    actions: <Widget>[
      CupertinoActionSheetAction(
        child: Text("Button1"),
        onPressed: () {
          print("Button1 pressed");
          Navigator.of(context).pop();
        },
      ),
      CupertinoActionSheetAction(
        child: Text("Button2"),
        onPressed: () {
          print("Button2 pressed");
          Navigator.of(context).pop();
        },
      ),
    ],
    cancelButton: CupertinoButton(
      child: Text("Cancel"),
      onPressed: () => Navigator.of(context).pop(),
    ),
  );
}
