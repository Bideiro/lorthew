import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lorthew/services/auth.dart';

class ProfileEditP extends StatefulWidget {
  @override
  _ProfileEditPState createState() => _ProfileEditPState();
}

class _ProfileEditPState extends State<ProfileEditP> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String fname = '';
  String lname = '';
  String aboutMe = '';
  String email = '';
  String phoneNum = '';
  String location = '';

  // late TextEditingController _firstNameController;
  // late TextEditingController _lastNameController;
  // late TextEditingController _aboutMeController;
  // late TextEditingController _emailController;
  // late TextEditingController _phoneController;
  // late TextEditingController _locationController;

  // @override
  // void initState() {
  //   super.initState();
  //   _firstNameController = TextEditingController();
  //   _lastNameController = TextEditingController();
  //   _aboutMeController = TextEditingController();
  //   _emailController = TextEditingController();
  //   _phoneController = TextEditingController();
  //   _locationController = TextEditingController();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:const  Text(
                'Cancel',
                style: TextStyle(
                  color: (Color(0xFFFDD835)),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(
              'Edit Profile',
              style: TextStyle(
                fontFamily: 'Bebas',
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: 75.0),
          ],
        ),
        toolbarHeight: 80.0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 25.0),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(44, 132, 157, 188),
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage('Usericon')),
                ),
                child: IconButton(
                  iconSize: 100,
                  splashRadius: 1,
                  icon: const Icon(Icons.add),
                  splashColor: const Color.fromARGB(102, 255, 0, 0),
                  tooltip: "Add/Change your icon.",
                  color: Colors.black,
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 10.0),
              // buildEditableField("First Name", _firstNameController,
              //     maxLength: 50, textAlign: TextAlign.left),
              // buildEditableField("Last Name", _lastNameController,
              //     maxLength: 50, textAlign: TextAlign.left),
              // buildEditableField("About Me", _aboutMeController,
              //     maxLines: 6, textAlign: TextAlign.left),
              // buildEditableField("Email", _emailController,
              //     maxLength: 50, textAlign: TextAlign.left),
              // buildEditableField("Phone", _phoneController,
              //     textAlign: TextAlign.left),
              // buildEditableField("Location", _locationController,
              //     textAlign: TextAlign.left),
              Padding (
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.grey[200],
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'First Name',
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 20),
                            border: InputBorder.none,
                          ),
                          onChanged: (val) {
                            setState(() => fname = val);
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.grey[200],
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Last Name',
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 20),
                            border: InputBorder.none,
                          ),
                          onChanged: (val) {
                            setState(() => lname = val);
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.grey[200],
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'About Me',
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 20),
                            border: InputBorder.none,
                          ),
                          onChanged: (val) {
                            setState(() => aboutMe = val);
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.grey[200],
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 20),
                            border: InputBorder.none,
                          ),
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.grey[200],
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Phone',
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 20),
                            border: InputBorder.none,
                          ),
                          onChanged: (val) {
                            setState(() => phoneNum = val);
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.grey[200],
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Last Name',
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 20),
                            border: InputBorder.none,
                          ),
                          onChanged: (val) {
                            setState(() => lname = val);
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.grey[200],
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Location',
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 20),
                            border: InputBorder.none,
                          ),
                          onChanged: (val) {
                            setState(() => location = val);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50.0),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      print(fname + lname + aboutMe + email + phoneNum + location);
                      // dynamic result = await _auth
                      //     .updateProfileData(
                      //     fname, lname ,aboutMe, email, phoneNum , location);
                      // if (result == null) {
                      //   //setState(() => error = 'please god');
                      // }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFFFDD835)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(LineIcons.doubleCheck, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }

// Widget buildEditableField(String label, TextEditingController controller,
//     {int maxLines = 1,
//       TextAlign textAlign = TextAlign.left,
//       int maxLength = 160}) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 16.0,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         SizedBox(width: 10),
//         Container(
//           width: 280,
//           decoration: BoxDecoration(
//             color: Colors.grey[200],
//             borderRadius: BorderRadius.circular(12),
//           ),
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           child: TextFormField(
//             controller: controller,
//             maxLines: maxLines,
//             textAlign: textAlign,
//             maxLength: maxLength,
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               hintText: 'Enter your $label',
//               fillColor: Colors.grey[200],
//               hintStyle: TextStyle(fontSize: 14.0),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
}
