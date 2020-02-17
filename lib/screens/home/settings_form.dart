import 'package:flutter/material.dart';
import 'package:ibooxy/util/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4']; //to be on the dropdown

  String _currentName;
  String _currentSugars; //['0', '1', '2', '3', '4']
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'update your settings',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration.copyWith(
              hintText: 'Name',
            ),
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(
              () => _currentName = val,
            ),
          ),
          SizedBox(height: 20.0),

          //dropdown
          //map through the sugars's list and render each item to the dropdownFrom as an item
          DropdownButtonFormField(
            decoration: textInputDecoration,
            value: _currentSugars ?? '0',
            validator: (val) => val.isEmpty ? 'Choose how many sugars' : null,
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.sentiment_very_satisfied),
                    SizedBox(width: 20.0),
                    Text('$sugar sugars'),
                  ],
                ),
              );
            }).toList(),
            onChanged: (val) {
              setState(() => _currentSugars = val);
            },
          ),
          SizedBox(height: 20.0),
          //slider
          Slider(
            value: (_currentStrength ?? 100).toDouble(),
            activeColor: Colors.brown[_currentStrength ?? 100],
            inactiveColor: Colors.brown[_currentStrength ?? 100],
            min: 100,
            max: 900,
            divisions: 8,
            onChanged: (val) => setState(
              () => _currentStrength = val.round(),
            ),
          ),
          SizedBox(height: 20.0),
          //submit button
          RaisedButton(
            onPressed: () async {
              print(_currentName);
              print(_currentStrength);
              print(_currentSugars);
            },
            color: Colors.deepPurple[400],
            child: Text(
              'update',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
