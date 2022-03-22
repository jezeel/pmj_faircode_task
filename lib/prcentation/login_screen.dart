import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/login_model/login_response_model.dart';
import '../widgets/login_background.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isChecked = false;
  bool loginStatus = false;

  late Box box1;

  @override
  void initState() {
    super.initState();
    createBox();
  }

  void createBox()async{
    box1 = await Hive.openBox('logindata');
    getdata();

  }

  void getdata() async{
    if(box1.get('username')!= null){
      usernameController.text = box1.get('username');
      isChecked = true;
      setState(() {

      });

    }
    if(box1.get('password')!= null){
      passwordController.text = box1.get('password');

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          LoginBackgroundImage(),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 160, left: 40, right: 40),
              height: 550,
              width: 350,
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  CircleAvatar(
                    radius: 80.0,
                    backgroundColor: Colors.grey[100],
                    child: ClipRRect(
                      child: Text("Vedic", style: TextStyle(
                        color: Colors.lightGreen, fontSize: 35,
                      ),),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.teal.shade900,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Username",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(
                                controller: usernameController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                              decoration: BoxDecoration(color: Colors.grey[100]),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Password",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(color: Colors.grey[100]),
                              child: TextFormField(
                                onEditingComplete: () => TextInput.finishAutofillContext(),
                                controller: passwordController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                obscureText: true,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.teal.shade900,
                                      value: isChecked,
                                      onChanged: (value){
                                        isChecked = !isChecked;
                                        setState(() {
                                         login();
                                        });
                                      },
                                    ),
                                    Text("Remember Me",style: TextStyle(color: Colors.teal.shade900, fontSize: 12),),

                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child:  Text(
                                    "Forgot Password?",
                                    style: TextStyle(color: Colors.orange.shade400, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: FlatButton(
                                  color: Colors.orange[300],
                                  onPressed: () {
                                    valiedCredential(usernameController.text,
                                        passwordController.text);
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(fontSize: 15, color: Colors.white),
                                  )),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }








  void login(){
    if (isChecked){
      box1.put('username', usernameController.text);
      box1.put('password', passwordController.text);
    }
  }


  void showInSnackBar(String value) {
    _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(value)));
  }


  valiedCredential(String username, password) async {
    var loginStatus = false;
    var data = jsonEncode({
      'username': username,
      'password': password,
    });
    print("data == " + data);
    var mocInput =
    await rootBundle.loadString('assets/login_json/login_input.json');
    print("mocInput == " + mocInput);

    if (data.toString() == mocInput.toString()){
      setState(() {
        loginStatus = true;
      });

      print(loginStatus);
      return onLoginState();
    } else {
      print("moc data and input not equal");
      print(loginStatus);
      return showInSnackBar("Invalid Username and Password ");
    }
  }
  LoginResponseModel? loginResponseData;

  buttonPressed() async {
    var response =
    await rootBundle.loadString('assets/login_json/login_response.json');
    final jsonData = jsonDecode(response);
    print(jsonData);
    if(jsonData!= null){
      return LoginResponseModel.fromJson(jsonData);

    } else {
      print("failed");
      return LoginResponseModel.fromJson({"success": false});
    }
  }
  onLoginState()async{
    loginResponseData =  await buttonPressed();
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomeScreen(loginStatus: loginStatus, loginResponseData: loginResponseData!,);
        },
      ),
    );
  }


}
