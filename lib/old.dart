
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(24, 26, 24, 0),
          child: ListView(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Alamat Email',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 6),
                child: const TextField(
                  // controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Type your email address',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                  ),
                ),
              ),
              Divider(height: 16),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Kata Sandi',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 6),
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: 'Masukkan kata sandi',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                  ),
                ),
              ),
              Divider(height: 24),
              Container(
                height: 45,
                child: RaisedButton(
                  color: HexColor('#FFC700'),
                  textColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Text('Masuk'),
                  onPressed: () {
                  },
                ),
              ),
              Divider(height: 12),
              Container(
                height: 45,
                child: RaisedButton(
                  color: HexColor('#00365E'),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Text('Daftar Akun Baru'),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RegisterPage())
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Register Page'),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(24, 26, 24, 0),
          child: ListView(
            children: [
              CircleAvatar(
                radius: 90,
                child: Image.asset("assets/images/circle-avatar.jpg"),
              )
            ],
          ),
        ),
      ),
    );
  }
}