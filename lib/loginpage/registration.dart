import 'package:flutter/material.dart';
import 'package:flutter_all_widgets/navigation_bar.dart';
import 'package:get/get.dart';

class login extends StatefulWidget {
  login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController name = TextEditingController();

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100))),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Registration',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'For great expresrience',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: name,
                          decoration: InputDecoration(
                              hintText: 'your name',
                              border: OutlineInputBorder(gapPadding: 4)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email is required';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              border: OutlineInputBorder(gapPadding: 4)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email is required';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        //varibles

                        TextFormField(
                          controller: password,
                          obscureText: secure,
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    secure = !secure;
                                  });
                                },
                                child: secure
                                    ? Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.black,
                                      )
                                    : Icon(Icons.remove_red_eye_outlined,
                                        color: Colors.black),
                              ),
                              hintText: 'Password',
                              border: OutlineInputBorder(gapPadding: 4)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email is required';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 7,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(MediaQuery.of(context).size.height, 50),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      }

                      print(email.text);
                      print(password.text);
                      print(name.text);
                    },
                    child: Text('Register')),
              )
            ],
          )),
    ));
  }
}
