import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Authscreen extends StatefulWidget {
  const Authscreen({super.key});

  @override
  State<Authscreen> createState() => _AuthscreenState();
}

class _AuthscreenState extends State<Authscreen> {
  bool _obscureText = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool is_filled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_checkFilled);
    passwordController.addListener(_checkFilled);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _checkFilled() {
    setState(() {
      is_filled =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }


  bool isFilled(){
    return emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 30, top: 60, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              'Enter Email Adress',
              style: TextStyle(
                fontFamily: 'Gilroy',
                color: Color(0XFF3859C5),
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Backup your private data to your personalcloud',
              style: TextStyle(
                fontFamily: 'Gilroy',
                color: Color(0XFF3859C5).withOpacity(0.7),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 70),
            TextField(
              controller: emailController,

              decoration: InputDecoration(
                hintText: 'Email or Phone Number',
                hintStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                  color: const Color(0XFF3859C5).withOpacity(0.5),
                ),
                border: InputBorder.none,

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0XFF3859C5), width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0XFF3859C5), width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                color: Color(0XFF3859C5),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              obscureText: _obscureText,
              obscuringCharacter: '*',
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                  color: const Color(0XFF3859C5).withOpacity(0.5),
                ),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Color(0XFF3859C5), width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Color(0XFF3859C5), width: 2),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  color: Color(0XFF3859C5).withOpacity(0.5),
                ),
              ),

              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                color: Color(0XFF3859C5),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/forgot-password');
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: const Color(0XFF3859C5).withOpacity(0.5),
                    fontSize: 14,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                 
                  ),
                ),
              ),
            ),

            SizedBox(height: 80),
            SizedBox(
              height: 56,
              width: 330,
              child: ElevatedButton(
                onPressed: is_filled ? () {           Navigator.pushNamed(context, '/securitypin');} : null,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>((
                    states,
                  ) {
                    if (states.contains(MaterialState.disabled)) {
                      return const Color(0xFF3859C5).withOpacity(0.5);
                    }
                    return const Color(0xFF3859C5);
                  }),
                  foregroundColor: MaterialStateProperty.resolveWith<Color>((
                    states,
                  ) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.white.withOpacity(0.5);
                    }
                    return Colors.white;
                  }),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Gilroy',
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Color(0XFF3859C5),
                    fontSize: 16,
                    fontFamily: 'Gilroy',
                  ),
                  children: [
                    TextSpan(
                      text: 'Don\'t have an account ?',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    TextSpan(
                      text: 'Sign Up',
                      style: const TextStyle(fontWeight: FontWeight.w700),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/signup');
                        },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Color(0XFF3859C5),
                    endIndent: 10,
                    thickness: 2,
                  ),
                ),
                Text(
                  'or',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w800,
                    color: Color(0XFF3859C5),
                  ),
                ),

                Expanded(
                  child: Divider(
                    color: Color(0XFF3859C5),
                    indent: 10,
                    thickness: 2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 56,
              width: 330,

              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/securitypin');
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFF3859C5),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(15),
                  ),
                ),
                icon: SvgPicture.asset('assets/icons/Icon_awesome-apple.svg'),
                label: Text(
                  'Sign In With Apple',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Gilroy',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 56,
              width: 330,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/securitypin');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFFEFEFEF),
                  foregroundColor: Color(0xFF3859C5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(15),
                  ),
                ),
                icon: Image.asset(
                  'assets/icons/google-logo-png-google-icon-logo-png-transparent-svg-vector-bie-supply-14.png',
                ),
                label: Text(
                  'Sign In With Google',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Gilroy',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
