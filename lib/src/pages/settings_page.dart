import 'package:flutter/material.dart';
import 'package:user_preferences/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor = false;
  int _gender = 1;
  String _name = 'Peter';

  TextEditingController? _txtController;

  @override
  void initState() {
    super.initState();
    _txtController = new TextEditingController(text: _name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
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
                value: _secondaryColor,
                title: Text('Secondary Color'),
                onChanged: (value) {
                  setState(() {
                    _secondaryColor = value;
                  });
                }),
            RadioListTile(
                value: 1,
                title: Text('Male'),
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value as int;
                  });
                }),
            RadioListTile(
                value: 2,
                title: Text('Female'),
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value as int;
                  });
                }),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _txtController,
                decoration:
                    InputDecoration(labelText: 'Name', helperText: 'User Name'),
                onChanged: (value) {},
              ),
            )
          ],
        ));
  }
}
