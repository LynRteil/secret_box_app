import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secret_box/widgets/plan_row.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({super.key});

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  bool isON = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/mask_group_5.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/xbutton.svg',
                      color: Colors.white,
                      height: 15,
                      width: 15,
                    ),
                    Text(
                      'Restore',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gilroy',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 54),
                Text(
                  'Unlimited Access  To All Features',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 90),
                PlanRow(text: 'Folder/Album Creation'),
                PlanRow(text: 'Fake Pin'),
                PlanRow(text: 'Wrong Password Alert'),
                PlanRow(text: 'Shake Action'),
                PlanRow(text: 'App Icon Changer'),
                PlanRow(text: 'Cloud Backup/Restore'),
                SizedBox(height: 35),
                Container(
                  padding: EdgeInsets.fromLTRB(27, 5, 12, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isON
                          ? Expanded(
                              child: Text(
                                'Free Trial Enabled',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          : Expanded(
                              child: Text(
                                'Not Sure Yet ? Enable Free Trial',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                      Switch(
                        value: isON,
                        onChanged: (value) {
                          setState(() {
                            isON = value;
                          });
                        },
                        //COLOR OF THE SWITCH IT SELF
                        trackColor: MaterialStateProperty.resolveWith<Color>(
                          (states) => states.contains(MaterialState.selected)
                              ? const Color(0xFF4FC3F7)
                              : Color(0XFFA8A8AB),
                        ),
                        //THE COLOR OF THE BORDER OF THE SWITCH
                        trackOutlineColor:
                            MaterialStateProperty.resolveWith<Color>(
                              (states) =>
                                  states.contains(MaterialState.selected)
                                  ? const Color(0xFF4FC3F7)
                                  : Color(0XFFA8A8AB),
                            ),
                        //THE BULLET COLOR
                        thumbColor: MaterialStateProperty.all(Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 70,
                  width: 332,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/authScreen');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isON
                            ? Text(
                                'Start Free Trial',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Gilbroy',
                                  fontWeight: FontWeight.w800,
                                  color: Color(0XFF3859C5),
                                ),
                              )
                            : Text(
                                'Continue',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Gilbroy',
                                  fontWeight: FontWeight.w800,
                                  color: Color(0XFF3859C5),
                                ),
                              ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 20,
                          color: Color(0XFF3859C5),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: "Gilroy",
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        children: const [
                          TextSpan(text: "Just "),
                          TextSpan(
                            text: "US\$39.99",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          TextSpan(text: " per year"),
                        ],
                      ),
                    ),

                   RichText(text: 
                   TextSpan(
                    style: TextStyle(
                       fontSize: 14,
                          fontFamily: "Gilroy",
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                    ),
                    children: const [
                      TextSpan(text: 'Only'),
                      TextSpan(text: "US\$3.33", style: TextStyle(fontWeight: FontWeight.w700),),
                      TextSpan(text: 'per month')

                    ]
                   ),
                   ),
                  ],
                ),
                SizedBox(height: 2),
                Text(
                  'Auto Renewable. Cancel anytime',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 14,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Terms Of Use",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 14,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 14,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
