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

  List<String> city = ["Rajkot","Ahemdabad","Morbi","Jamanagar","Vadodara"];

  // List<DropdownMenuItem> democity = [
  //   DropdownMenuItem(child: Text("Rajkot"),value: "Rajkot"),
  //   DropdownMenuItem(child: Text("Ahemdabad"),value: "Ahemdabad"),
  //   DropdownMenuItem(child: Text("Morbi"),value: "Morbit"),
  //   DropdownMenuItem(child: Text("Jamanagar"),value: "Jamanagar"),
  //   DropdownMenuItem(child: Text("Vadodara"),value: "Vadodara"),
  // ];

  String? Selectedvalue;

  Map<String, dynamic>? userDetails;

  void submitForm() {

    if (formkey.currentState!.validate()) {

      List<String> selectedHobbies = Hobbies
          .where((hobby) => hobby["value"] == true)
          .map((hobby) => hobby["title"].toString())
          .toList();

      setState(() {

        userDetails = {
          "name": nameController.text.trim(),
          "address": addressController.text.trim(),
          "email": emailController.text.trim(),
          "password": passwordController.text.trim(),
          "phone": mobileController.text.trim(),
          "city": Selectedvalue,
          "gender": gender,
          "hobbies": selectedHobbies,
        };

      });
    }
  }

  void showUserDetails(Map<String, dynamic> userDetails) {

    showDialog(
      context: context,
      builder: (context) {

        return AlertDialog(
          title: const Text("User Details"),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text("Name: ${userDetails["name"]}"),
              Text("Email: ${userDetails["email"]}"),
              Text("Phone: ${userDetails["phone"]}"),
              Text(
                "Gender: ${userDetails["gender"] ?? "Not selected"}",
              ),
              Text(
                "Hobbies: ${userDetails["hobbies"].join(", ")}",
              ),
            ],
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F5),
      appBar: AppBar(
        title: Text("Registration Form",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w300,fontFamily: "Arimo",),),
        backgroundColor: const Color(0xFF8B1E3F),
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

                Row(
                  children: [
                    const Text(
                      "City",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2B2B2B),
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xFFE8D6DB),
                          ),
                        ),
                        child: DropdownButton(
                          value: Selectedvalue,
                          hint: const Text(
                            "Select Your City",
                            style: TextStyle(
                              color: Color(0xFF777777),
                            ),
                          ),

                          isExpanded: true,
                          underline: const SizedBox(),

                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Color(0xFF8B1E3F),
                          ),

                          items: city.map((String cityname) {
                            return DropdownMenuItem<String>(
                              value: cityname,
                              child: Text(
                                cityname,
                                style: const TextStyle(
                                  color: Color(0xFF2B2B2B),
                                ),
                              ),
                            );
                          }).toList(),

                          onChanged: (value) {
                            setState(() {
                              Selectedvalue = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
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
        
                const SizedBox(height: 20,),


                Row(
                  children: [
                    // SUBMIT BUTTON
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF8B1E3F),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: submitForm,
                        // onPressed: () {
                        //   if (formkey.currentState!.validate()) {
                        //     print("Username: ${nameController.text}");
                        //     print("Address: ${addressController.text}");
                        //     print("Email: ${emailController.text}");
                        //     print("Password: ${passwordController.text}");
                        //     print("Mobile No: ${mobileController.text}");
                        //   }
                        // },
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 15),

                    // RESET BUTTON
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF8B1E3F),
                          side: const BorderSide(
                            color: Color(0xFF8B1E3F),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          formkey.currentState?.reset();

                          nameController.clear();
                          addressController.clear();
                          emailController.clear();
                          passwordController.clear();
                          mobileController.clear();

                          setState(() {
                            Selectedvalue = null;
                            gender = null;

                            for (var hobby in Hobbies) {
                              hobby["value"] = false;
                            }

                          });
                        },
                        child: const Text(
                          "Reset",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                buildUserDetails(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildUserDetails() {
    if (userDetails == null) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(height: 25),

        const Text(
          "User Details",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Card(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("Name: ${userDetails!["name"]}"),

                Text("Address: ${userDetails!["address"]}"),

                Text("Email: ${userDetails!["email"]}"),

                Text("Password: ${userDetails!["password"]}"),

                Text("Mobile: ${userDetails!["phone"]}"),

                Text(
                  "City: ${userDetails!["city"] ?? "Not selected"}",
                ),

                Text(
                  "Gender: ${userDetails!["gender"] ?? "Not selected"}",
                ),

                Text(
                  "Hobbies: ${userDetails!["hobbies"].join(", ")}",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}
