import 'package:flutter/material.dart';
import 'package:ibooxy/screens/authenticate/register.dart';
import 'package:ibooxy/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
          'Sign in to Booxy',
        ),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person_outline),
            label: Text(
              'Register',
              style: TextStyle(color: Colors.black38),
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
                validator: (val) => val.isEmpty ? 'Incorrect email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.length < 6
                    ? 'Enter a password 6 plus chars long'
                    : null,
                style: TextStyle(color: Colors.red),
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Sin In',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    //valid form send request to firebase
                    dynamic result =
                        await _auth.signInWithEmailAndPass(email, password);
                    if (result == null) {
                      setState(() {
                        setState(() {
                          error = 'Could not sign in';
                        });
                      });
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
