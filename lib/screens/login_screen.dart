import 'package:flutter/material.dart';
import 'package:chat_demo/providers/userBloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _verticalHeight = 1.0;

  _addHeightToMainComp() {
    setState(() {
      _verticalHeight = 0.33;
    });
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _addHeightToMainComp());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          Positioned(
            child: FormLoginCard(verticalHeight: _verticalHeight),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.76,
            left: MediaQuery.of(context).size.width * 0.05,
            child: Container(
              child: FadeInImage.assetNetwork(
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.10,
                alignment: Alignment.center,
                fit: BoxFit.contain,
                fadeInCurve: Curves.decelerate,
                placeholder: 'assets/images/space.gif',
                image: 'https://spacedev.uy/assets/img/space.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FormLoginCard extends StatelessWidget {
  const FormLoginCard({
    Key key,
    @required double verticalHeight,
  })  : _verticalHeight = verticalHeight,
        super(key: key);

  final double _verticalHeight;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(
        seconds: 1,
      ),
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * _verticalHeight,
      ),
      curve: Curves.decelerate,
      child: Container(
        child: Container(
          child: FormButtonContainer(),
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          color: Theme.of(context).accentColor,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
      ),
    );
  }
}

class FormButtonContainer extends StatefulWidget {
  const FormButtonContainer({
    Key key,
  }) : super(key: key);

  @override
  _FormButtonContainerState createState() => _FormButtonContainerState();
}

class _FormButtonContainerState extends State<FormButtonContainer> {
  final password = TextEditingController();
  final email = TextEditingController();

  @override
  void dispose() {
    password.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(),
              child: TextField(
                controller: email,
                style: TextStyle(
                  height: 3,
                ),
                decoration: InputDecoration(
                  hasFloatingPlaceholder: true,
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  hintText: 'Email....',
                ),
              ),
            ),
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(),
              child: TextField(
                controller: password,
                obscureText: true,
                style: TextStyle(
                  height: 3,
                ),
                decoration: InputDecoration(
                  hasFloatingPlaceholder: true,
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  hintText: 'Password....',
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: FlatButton(
                    onPressed: () async {
                      try {
                        UserBloc().logintoMatterMost(
                            email.text, password.text);
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/homeScreen',
                      );
                    },
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Recover Account',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }
}

class ErrorLogin extends StatelessWidget {
  const ErrorLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: <Widget>[
          Icon(Icons.report_problem),
          Text('Opssss'),
        ],
      ),
      content: Text(
        'There seems there was an error with the credentials given, plsease try again',
      ),
      actions: <Widget>[
        RaisedButton(
          color: Colors.white,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop('dialog');
          },
          child: Text(
            'Ok',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
      elevation: 25.0,
    );
  }
}
