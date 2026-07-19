import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MATRIMONY",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200)),backgroundColor: Colors.red,foregroundColor: Colors.white,),
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Row(
            children: [
              dashboardbtn(title: "Add user",img: "assets/images/content.png"),
              dashboardbtn(title: "User List",img: "assets/images/contact-list.png"),
            ],
          ),
          Row(
            children: [
              dashboardbtn(title: "Favorite",img: "assets/images/like.png"),
              dashboardbtn(title: "About us",img: "assets/images/profile.png"),
            ],
          ),
        ],
      ),
    );
  }

  Widget dashboardbtn({required title,required img})
  {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8.0),
        height: 150,
        child: Card(
          elevation: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(img,
                height: 60,
                width: 60,
                color: Colors.red,
              ),
              SizedBox(
                height: 8,
              ),
              Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,)),
            ],
          ),
        ),
      ),
    );
  }
}
