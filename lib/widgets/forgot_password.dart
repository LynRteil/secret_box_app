import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _SignUpState();
}

class _SignUpState extends State<ForgotPassword> {
  final emailController = TextEditingController();

  bool is_filled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_checkFilled);
  }

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  void _checkFilled() {
    setState(() {
      is_filled = emailController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, top: 60, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Color(0xFF3859C5),
                    size: 10,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),

                const Expanded(
                  child: Text(
                    "Forgot Password",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF3859C5),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "We will send you the reset instructions by Email",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                  color: Color(0XFF3859C5),
                  height: 1.4,
                ),
              ),
            ),
            SizedBox(height: 40),
            TextField(
              controller: emailController,

              decoration: InputDecoration(
                hintText: 'Email address',
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

            SizedBox(height: 150),
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
                  'Reset Password',
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
