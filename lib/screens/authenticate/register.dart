import 'package:flutter/material.dart';
import 'package:ibooxy/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[500],
        elevation: 0.0,
        title: Text(
          'Sign up to Booxy',
        ),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person_outline),
            label: Text(
              'Sign In',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                style: TextStyle(color: Colors.black87),
                obscureText: true,
                validator: (val) => val.length < 6
                    ? 'Enter a password 6 plus chars long'
                    : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Register ',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    //valid form send request to firebase
                    print('[ ]: ' + email + ' [passwodr]: ' + password);

                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() {
                        error = 'error message : email not valid';
                      });
                    } else {
                      print(result);
                    }
                  }
                },
              ),
              SizedBox(height: 10.0),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 13.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
