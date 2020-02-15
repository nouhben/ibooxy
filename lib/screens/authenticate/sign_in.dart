import 'package:flutter/material.dart';
import 'package:ibooxy/services/auth.dart';
import 'package:ibooxy/util/constants.dart';
import 'package:ibooxy/util/loading.dart';

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
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: lighThemeColors,
            appBar: AppBar(
              backgroundColor: lighThemeColors,
              elevation: 0.0,
              title: Text(
                'Sign in to Booxy',
                style: TextStyle(color: darkThemeColors),
              ),
              actions: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(Icons.person_outline),
                  label: Text(
                    'Register',
                    style: TextStyle(color: darkThemeColors),
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
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      validator: (val) =>
                          val.isEmpty ? 'Incorrect email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Password'),
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
                      color: buttonsColor,
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: lighThemeColors,
                          fontWeight: FontWeight.w800,
                          fontSize: 18.0,
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          //valid form send request to firebase
                          dynamic result = await _auth.signInWithEmailAndPass(
                              email, password);
                          if (result == null) {
                            setState(() {
                              setState(() {
                                error = 'Could not sign in';
                                loading = false;
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
