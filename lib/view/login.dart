import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
          child: Column(
            children: [
              Card(
                child: Container(
                    color: Colors.transparent,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [Icon(Icons.bus_alert)],
                        ),
                        TabBar(
                            controller: tabController,
                            indicator: UnderlineTabIndicator(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 3.0,
                                color: Colors.black,
                              ),
                              insets: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width / 4),
                            ),
                            tabs: const [
                              Tab(child: Text('Signin')),
                              Tab(child: Text('Signup'))
                            ]),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: TabBarView(controller: tabController, children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          'Welcome Back',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        const Text(
                          'Text ever since the 1500s, when an unknown printer took a galley',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomTextfield(
                          labeltext: 'User name',
                          hintText: 'Enter your name',
                          icon: Icons.person,
                          errorText: 'User Name',
                        ),
                        const CustomTextfield(
                          labeltext: 'Password',
                          hintText: 'Enter your Password',
                          icon: Icons.note,
                          errorText: 'Password',
                        ),
                        CustomElevatedButton(text: 'SignIn', onPressed: () {}),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('or'),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                child: Image.asset(
                                    'asset/images/Logo-google-icon.png')),
                            const SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                                child:
                                    Image.asset('asset/images/facebook.png')),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Don't have an account?"),
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          'Welcome Back',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        const Text(
                          'Text ever since the 1500s, when an unknown printer took a galley',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomTextfield(
                          labeltext: 'User name',
                          hintText: 'Enter your name',
                          icon: Icons.person,
                          errorText: 'User name',
                        ),
                        const CustomTextfield(
                          labeltext: 'Password',
                          hintText: 'Enter your Password',
                          icon: Icons.lock,
                          errorText: 'Password',
                        ),
                        const CustomTextfield(
                          labeltext: 'Confirm Password',
                          hintText: 'Enter your Password',
                          icon: Icons.lock,
                          errorText: 'Confirm Password',
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Reset Password?',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        CustomElevatedButton(text: 'SignUp', onPressed: () {}),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('or'),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                child: Image.asset(
                                    'asset/images/Logo-google-icon.png')),
                            const SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                                child:
                                    Image.asset('asset/images/facebook.png')),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Already have an account?"),
                        const Text(
                          'Log in ',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.labeltext,
    required this.hintText,
    required this.icon,
    required this.errorText,
  });
  final String labeltext;
  final String hintText;
  final IconData icon;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            errorText,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: labeltext,
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: Icon(icon),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
              filled: true,
              fillColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double width;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}


// class MyElevatedButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return 
     
      
//          ElevatedButton(
//           onPressed: () {
           
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('Button Pressed!')),
//             );
//           },
//           style: ElevatedButton.styleFrom(
//             foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
//             shadowColor: Colors.black, // Shadow color
//             elevation: 5, // Elevation for shadow effect
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15), // Rounded corners
//             ),
//             padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16), // Padding inside the button
//           ),
//           child: Text(
//             'Press Me',
//             style: TextStyle(fontSize: 18),
//           ),
         
//       ),
  
//   }
// }
