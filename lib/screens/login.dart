import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_flutter_project/screens/bloglist.dart';
import '../controllers/logincontroller.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());
  final _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Login screen"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Sample Flutter App",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 25),
                    child: Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width / 100 * 80,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: new BorderRadius.all(
                              const Radius.circular(20.0),
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 5),
                            child: TextFormField(
                              controller: loginController.email,
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: "Email"),
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 25),
                    child: Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width / 100 * 80,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: new BorderRadius.all(
                              const Radius.circular(20.0),
                            ),
                          ),
                          child: Obx(() => Padding(
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 5),
                              child: TextFormField(
                                obscureText:
                                    loginController.toggleObscureTxt.value,
                                controller: loginController.passwd,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        icon: Icon(Icons.remove_red_eye),
                                        onPressed: () {
                                          loginController
                                                  .toggleObscureTxt.value =
                                              !loginController
                                                  .toggleObscureTxt.value;
                                        }),
                                    border: InputBorder.none,
                                    hintText: "Password"),
                              )))),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      loginController.login().then((value) {
                        if (value == true) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => BlogList()));
                        } else {
                          loginController.errorOccured = true.obs;
                        }
                      });
                    },
                    color: Colors.green,
                    child: Container(
                        width: MediaQuery.of(context).size.width / 100 * 70,
                        // color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text("Submit",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                )),
                          ),
                        )),
                  ),
                  Obx(
                    () => loginController.errorOccured.value
                        ? Text(
                            "Login Error",
                            style: TextStyle(color: Colors.red),
                          )
                        : Text(""),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
