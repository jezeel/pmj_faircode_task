import 'package:faircode_test_pmj/model/login_model/login_response_model.dart';
import 'package:faircode_test_pmj/prcentation/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  bool loginStatus;
  LoginResponseModel loginResponseData;
  HomeScreen({Key? key, required this.loginStatus, required this.loginResponseData}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            Text("Login Success", style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold,
                color: Colors.teal.shade900
            ),),
            const SizedBox(height: 50,),
            widget.loginResponseData == null ? Text("null") :
            loadedDataUI(
                widget.loginResponseData.data!.name.toString(),
                widget.loginResponseData.data!.age.toString(),
                widget.loginResponseData.data!.email.toString()
            ),
            const SizedBox(height: 200,),
            const Text("Go to Profile Screen"),
            FlatButton(
                color: Colors.orange.shade400,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProfileScreen(loginResponseData: widget.loginResponseData);
                      },
                    ),
                  );
                }, child: const Text("Profile"))
          ],
        )
    );
  }


  Container loadedDataUI(String name,String? age, String email){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 150,
      width: 500,
      child: Card(
        elevation: 5,
        color: Colors.blueGrey.shade100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              Text("Name: "+name, style: TextStyle(color: Colors.teal.shade900, fontWeight: FontWeight.bold,
                  fontSize: 20),),
              Text("Age: "+age.toString(), style: TextStyle(color: Colors.teal.shade900, fontWeight: FontWeight.bold,
                  fontSize: 16),),
              Text("Email: "+email,
                style: TextStyle(color: Colors.teal.shade900, fontWeight: FontWeight.bold,
                    fontSize: 16),),
              const SizedBox(height: 20,),
              Text("The data completely loaded from Local json file.", style: TextStyle(
                  color: Colors.teal.shade500,fontSize: 12
              ),)
            ],
          ),
        ),
      ),
    );
  }

}
