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
     body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10, 24, 22, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded,
                        size: 16, color:  Color(0XFF3859C5)),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w800,
                      fontSize: 28,
                      color:  Color(0XFF3859C5),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.only(left:50),
                child: Text(
                  'We will send you the reset instructions by Email',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Color(0XFF3859C5),
                  ),
                ),
              ),
              const SizedBox(height: 90),
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
                onPressed: is_filled ? () {
                  Navigator.pushNamed(context, '/checkemail');
                } : null,
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
        )
     )
    );
    
  }
}
