import 'package:flutter/material.dart';
class SetNewPassword extends StatefulWidget {
  const SetNewPassword({super.key});

  @override
  State<SetNewPassword> createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {
  bool _obscureText = true;
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  bool is_filled = false;

  @override
  void initState() {
    super.initState();
    passwordController.addListener(_checkFilled);
    confirmpasswordController.addListener(_checkFilled);
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }

  void _checkFilled() {
    setState(() {
      is_filled =
          passwordController.text.isNotEmpty &&
          confirmpasswordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: Colors.white,
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
                        size: 16, color: Color(0XFF3859C5)),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Set New Password',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w800,
                      fontSize: 28,
                      color: Color(0XFF3859C5),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.only(left:50),
                child: Text(
                  'Enter Your New Password',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Color(0XFF3859C5).withOpacity(0.7),
                  ),
                ),
              ),
            SizedBox(height: 40),
           
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
                onPressed: is_filled ? () {
                  Navigator.pushNamed(context, '/securitypin');
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
                  'Continue',
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
    ),
  );
  }
}
