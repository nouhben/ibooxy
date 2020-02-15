import 'package:firebase_auth/firebase_auth.dart';
import 'package:ibooxy/models/user.dart';
import 'package:ibooxy/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance; //private object _name

  //create user object based of firebase user
  User _userFromFirebaseUSer(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth changes user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //map(this._userFromFirebaseUSer); this 2 maps are equivalent
        .map((FirebaseUser user) => this._userFromFirebaseUSer(user));
  }

  //sign in annon
  Future signInAnnon() async {
    try {
      AuthResult result = await this._auth.signInAnonymously();
      FirebaseUser user = result.user;
//use the function up :
      return this._userFromFirebaseUSer(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sigin with mail and pass
  Future signInWithEmailAndPass(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUSer(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with mail and pass
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      //create a new document for the user with uid
      await DatabaseService(uid: user.uid)
          .updateUserData('5 suggars', 'new boox', 700);
      return _userFromFirebaseUSer(user);
    } catch (e) {
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await this._auth.signOut();
    } catch (e) {
      print(e.toString() + 'Can\'t sign out....');
      return null;
    }
  }
}
