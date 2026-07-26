import 'package:flutter/material.dart';

class Demoform extends StatefulWidget {
  const Demoform({super.key});

  @override
  State<Demoform> createState() => _DemoformState();


}

class _DemoformState extends State<Demoform> {

  var username = TextEditingController();
  var password = TextEditingController();
  var formkey = GlobalKey<FormState>();

  List<Map<String,dynamic>> Hobbies = [
    {"title":"flutter","value":false},
    {"title":"java","value":false},
    {"title":"python","value":false},
  ];



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Form",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w300,fontFamily: "Arimo",),),
        backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: username,
                decoration: InputDecoration(
                  labelText: "Enter Username",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if(value==null || value.isEmpty)
                    {
                      return "Please Enter username";
                    }
                  return null;
                },
              ),


              SizedBox(
                height: 8.0,
              ),


              TextFormField(
                controller: password,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  labelText: "Enter Password",
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if(value==null || value.isEmpty)
                    {
                      return "Please Enter Password";
                    }
                  return null;
                },
              ),

              SizedBox(
                height: 15.0,
              ),

              Row(
                children: [
                  Text(
                    "Select Hobbies",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

             ...Hobbies.map<Widget>((item){
                return  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(item["title"]),
                    value: item["value"],
                    onChanged: (value) {
                      item["value"] = value;
                      setState(() {

                      });
                    },
                );
             }).toList(),

              SizedBox(
                height: 15.0,
              ),
              ElevatedButton(onPressed: () {
                if(formkey.currentState!.validate())
                  {
                    print("Username: ${username.text}");
                    print("Password: ${password.text}");
                  }

              }, child: Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }
}
