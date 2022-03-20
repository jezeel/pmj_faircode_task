import 'package:flutter/material.dart';

import '../model/login_model/login_response_model.dart';

class ProfileScreen extends StatelessWidget {
  LoginResponseModel loginResponseData;
  ProfileScreen({Key? key, required this.loginResponseData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            SizedBox(height: 30,),
            Text("Profile", style: TextStyle(
                color: Colors.teal[900], fontWeight: FontWeight.bold, fontSize: 18
            ),),
            SizedBox(height: 50,),
            loginResponseData == null ? Text("null") :
            profileData(
                loginResponseData.data!.name.toString(), loginResponseData.data!.email.toString(),
                loginResponseData.data!.mobil.toString(), loginResponseData.data!.age.toString(),
                loginResponseData.data!.sex.toString()
            ),
          ],
        )
    );
  }
  Card profileData(
      String name,
      String email,
      String mobil,
      String age,
      String sex,
      ){
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.teal.shade900,
                radius: 45,
                child: Icon(Icons.person, size: 80, color: Colors.white,),
              ),
              const SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(color:Colors.teal, fontSize: 18, fontWeight: FontWeight.bold ),),
                  Text(email, style: const TextStyle(color:Colors.teal, fontSize: 15, fontWeight: FontWeight.bold ),),
                  Text(age, style: const TextStyle(color:Colors.teal, fontSize: 15, fontWeight: FontWeight.bold ),),
                  Text(mobil, style: const TextStyle(color:Colors.teal, fontSize: 15, fontWeight: FontWeight.bold ),),
                  Text(sex, style: const TextStyle(color:Colors.teal, fontSize: 15, fontWeight: FontWeight.bold ),)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }



}
