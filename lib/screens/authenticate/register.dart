import 'package:flutter/material.dart';
import 'package:ibooxy/services/auth.dart';
import 'package:ibooxy/util/constants.dart';
import 'package:ibooxy/util/loading.dart';

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
                'Sign up to Booxy',
                style: TextStyle(color: darkThemeColors),
              ),
              actions: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(Icons.person_outline),
                  label: Text(
                    'Sign In',
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
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Password'),
                      style: TextStyle(color: darkThemeColors),
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
                      color: buttonsColor,
                      child: Text(
                        'Register ',
                        style: TextStyle(
                            color: lighThemeColors,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          //valid form send request to firebase
                          print('[ ]: ' + email + ' [passwodr]: ' + password);

                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error = 'error message : email not valid';
                              loading = false;
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
