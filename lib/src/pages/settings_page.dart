import 'package:flutter/material.dart';
import 'package:user_preferences/src/shared_prefs/user_prefs.dart';
import 'package:user_preferences/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool? _secondaryColor;
  int? _gender;
  String _name = 'Peter';

  TextEditingController? _txtController;

  final prefs = new UserPrefs();

  @override
  void initState() {
    super.initState();
    prefs.lastPage = SettingsPage.routeName;
    _gender = prefs.gender;
    _secondaryColor = prefs.secondaryColor;
    _txtController = new TextEditingController(text: prefs.userName);
  }

  _setSelectedRadio(int? value) {
    prefs.gender = value;
    _gender = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
                value: _secondaryColor as bool,
                title: Text('Secondary Color'),
                onChanged: (value) {
                  setState(() {
                    _secondaryColor = value;
                    prefs.secondaryColor = value;
                  });
                }),
            RadioListTile(
              value: 1,
              title: Text('Male'),
              groupValue: _gender,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
                value: 2,
                title: Text('Female'),
                groupValue: _gender,
                onChanged: _setSelectedRadio),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _txtController,
                decoration:
                    InputDecoration(labelText: 'Name', helperText: 'User Name'),
                onChanged: (value) {
                  prefs.userName = value;
                },
              ),
            )
          ],
        ));
  }
}
