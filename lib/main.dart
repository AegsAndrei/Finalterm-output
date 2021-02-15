import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:Myapp()));
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Incorrect email and password.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Try Again'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Myapp()));
              },
            ),
          ],
        );
      },
    );
  }
  @override

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;


    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset("assets/images/login.gif",fit: BoxFit.fill,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Login',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              SizedBox(height: 30.0,),
              Container( width: 350.0,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),),

              SizedBox(height: 20.0,),
              Container( width: 350.0,
                child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: Icon(Icons.visibility_off),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),),

              SizedBox(height: 30.0,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('  Forget password?',style: TextStyle(fontSize: 12.0),),
                    Container(
                      width: 200,
                      height: 45,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side: BorderSide(color: Color(0xFF7D97A3))),
                      child: Text('Login', style: TextStyle(color: Colors.white),),
                      color: Color(0xFF7D97A3),
                      onPressed: (){
                        if (emailController.text == "cictapps@wvsu.edu.ph" &&
                            passwordController.text == "toor") {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Second()));
                        }
                        //if it's incorrect this will be the output
                        else {
                          _showMyDialog();
                        }
                      },
                    ),
    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}


class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        color: Color(0xFF7D97A3),
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width,
                height: height*0.45,
                child: Image.asset('assets/images/wolf.gif',fit: BoxFit.fill,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Welcome to Wolf Pack', textAlign: TextAlign.center, style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Begin your journey now. \n Start hunting!', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
              Container(
                width: 200,
                height: 50,
                margin: const EdgeInsets.only(top: 200.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(color: Colors.white)),
                  child: Text('Logout' ,style: TextStyle(fontSize: 18.0)),
                  color: Colors.white,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Myapp()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
