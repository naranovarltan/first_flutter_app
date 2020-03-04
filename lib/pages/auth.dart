import 'package:first_flutter_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/domain/user.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthrizationPage extends StatefulWidget {
  AuthrizationPage({Key key}) : super(key: key);

  @override
  _AuthrizationPageState createState() => _AuthrizationPageState();
}

class _AuthrizationPageState extends State<AuthrizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email;
  String _password;
  bool _showLogin = true;

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
        padding: EdgeInsets.only(top: 100),
        child: Container(
          child: Align(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Text(
                'Logo',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget _input(
      Icon icon,
      String hintText,
      TextEditingController controller,
      bool obscureText,
    ) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          style: TextStyle(color: Colors.white, fontSize: 20),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white30,
            ),
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: IconTheme(
                data: IconThemeData(color: Colors.white),
                child: icon,
              ),
            ),
          ),
        ),
      );
    }

    Widget _submitButton(String label, void submit()) {
      return RaisedButton(
        splashColor: Colors.indigo,
        highlightColor: Colors.indigo,
        color: Colors.white,
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          submit();
        },
      );
    }

    Widget _form(String label, void submit()) {
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child: _input(
                Icon(Icons.email),
                'email',
                _emailController,
                false,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: _input(
                Icon(Icons.lock),
                'password',
                _passwordController,
                true,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _submitButton(label, submit),
              ),
            ),
          ],
        ),
      );
    }

    void _signinButtonAction() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email == null || _password == null) {
        return;
      }

      User user =
          await authService.singinWithEmailAndPassword(_email, _password);

      if (user == null) {
        Fluttertoast.showToast(
          msg: "This is Center Short Toast",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }

      _emailController.clear();
      _passwordController.clear();
    }

    void _signupButtonAction() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email == null || _password == null) {
        return;
      }

      User user =
          await authService.singinWithEmailAndPassword(_email, _password);

      if (user == null) {
        Fluttertoast.showToast(
          msg: "This is Center Short Toast",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }

      _emailController.clear();
      _passwordController.clear();
    }

    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text('auth Page'),
        ),
        body: Column(
          children: <Widget>[
            _logo(),
            (_showLogin
                ? Column(
                    children: <Widget>[
                      _form('sign in', _signinButtonAction),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                          child: Text(
                            'Not sign up yet, register now',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              _showLogin = false;
                            });
                          },
                        ),
                      )
                    ],
                  )
                : Column(
                    children: <Widget>[
                      _form('sign up', _signupButtonAction),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                          child: Text(
                            'Let\'s sing in',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              _showLogin = true;
                            });
                          },
                        ),
                      )
                    ],
                  ))
          ],
        ),
      ),
    );
  }
}
