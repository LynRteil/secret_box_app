import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscureText = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  bool is_filled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_checkFilled);
    passwordController.addListener(_checkFilled);
    confirmpasswordController.addListener(_checkFilled);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }

  void _checkFilled() {
    setState(() {
      is_filled =
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          confirmpasswordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 25, top: 60, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Color(0XFF3859C5),
                    size: 15,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

               
                Text(
                  'Let\'s Sign You Up',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 28,
                    fontFamily: 'Gilroy',
                    color: Color(0XFF3859C5),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
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
            SizedBox(height: 15),
            TextField(
              obscureText: _obscureText,
              obscuringCharacter: '*',
              controller: confirmpasswordController,
              decoration: InputDecoration(
                hintText: ' Confirm Password',
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
            SizedBox(height: 90),
            SizedBox(
              height: 56,
              width: 330,
              child: ElevatedButton(
                onPressed: is_filled ? () {} : null,
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
                  'Sign Up',
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
