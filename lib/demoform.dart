import 'package:flutter/material.dart';
import '../Custom_widgets/TextFormField.dart';

class Demoform extends StatefulWidget {
  const Demoform({super.key});

  @override
  State<Demoform> createState() => _DemoformState();


}

class _DemoformState extends State<Demoform> {

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mobileController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  List<Map<String,dynamic>> Hobbies = [
    {"title":"Reading","value":false},
    {"title":"Music","value":false},
    {"title":"Movie","value":false},
  ];

  String? gender;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Form",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w300,fontFamily: "Arimo",),),
        backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
        
                TextFormField1(
                  controller: nameController,
                  labelText: "Name",
                  icon: Icons.person,
        
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your name";
                    }
        
                    if (value.trim().length < 3) {
                      return "Name must be at least 3 characters";
                    }
        
                    return null;
                  },
        
                ),
        
                const SizedBox(height: 15),
        
                TextFormField1(
                  controller: addressController,
                  labelText: "Address",
                  icon: Icons.home,
        
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your address";
                    }
        
                    if (value.trim().length < 10) {
                      return "Please enter a valid address";
                    }
        
                    return null;
                  },
        
                ),
        
                const SizedBox(height: 15),
        
                TextFormField1(
                  controller: emailController,
                  labelText: "Email",
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
        
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your email";
                    }
        
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',).hasMatch(value.trim())) {
                      return "Please enter a valid email";
                    }
        
                    return null;
                  },
        
                ),
        
                const SizedBox(height: 15),
        
                TextFormField1(
                  controller: passwordController,
                  labelText: "Password",
                  icon: Icons.lock,
                  obscureText: true,
        
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
        
                    if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    }
        
                    return null;
                  },
        
                ),
        
                const SizedBox(height: 15),
        
                TextFormField1(
                  controller: mobileController,
                  labelText: "Mobile Number",
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
        
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your mobile number";
                    }
        
                    if (!RegExp(r'^[0-9]{10}$').hasMatch(value.trim())) {
                      return "Mobile number must be 10 digits";
                    }
        
                    return null;
                  },
        
                ),
        
                SizedBox(height: 15.0,),
        
        
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
        
                    const Text(
                      "Gender",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
        
                    RadioListTile(
                        title: Text("Male"),
                        value: "Male",
                        groupValue: gender,
                        onChanged: (value) {
                          gender = value;
                          setState(() {
        
                          });
                        },
        
                    ),
        
                    RadioListTile(
                      title: Text("Female"),
                      value: "Female",
                      groupValue: gender,
                      onChanged: (value) {
                        gender = value;
                        setState(() {
        
                        });
                      },
        
                    ),
                  ],
                ),
        
        
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    const Text(
                      "Hobbies",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
        
                    ...Hobbies.map((item) {
        
                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(item["title"]),
                      value: item["value"],
                      onChanged: (value) {
                        item['value'] = value;
        
                        setState(() {
        
                        });
                      },
                    );
        
                  }).toList(),
                ],
                ),
        
                
        
        
                ElevatedButton(onPressed: () {
                  if(formkey.currentState!.validate())
                    {
                      print("Username: ${nameController.text}");
                      print("Address: ${addressController.text}");
                      print("Email: ${emailController.text}");
                      print("Password: ${passwordController.text}");
                      print("Mobile No: ${mobileController.text}");
                    }
        
                }, child: Text("Submit")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
