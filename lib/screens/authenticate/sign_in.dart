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
      backgroundColor: Colors.blueGrey[500],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
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
                validator: (val) => val.isEmpty ? 'Incorrect email' : null,
                onChanged: (val) {
                  setState(() => this.email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) {
                  if (val.isEmpty) {
                    setState(() => error = 'Empty password');
                  } else {}
                },
                style: TextStyle(color: Colors.white),
                obscureText: true,
                onChanged: (val) {
                  setState(() => this.password = val);
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
                  print(this.email);
                  print(this.password);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
