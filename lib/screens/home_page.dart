import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color blue = Color(0xFF3859C5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            const double designMaxWidth = 430;
            final double contentWidth = constraints.maxWidth > designMaxWidth
                ? designMaxWidth
                : constraints.maxWidth;

            return Center(
              child: SizedBox(
                width: contentWidth,
                height: constraints.maxHeight,
                child: Stack(
                  children: [
                    Positioned(
                      top: 50,
                      left: -50,
                      right: 0,
                      bottom: 220,
                      child: SizedBox(
                        width: contentWidth * 1.3,
                        height: contentWidth * 1.3,
                        child: Lottie.asset(
                          'assets/lottie/Cloud_security.json',
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          repeat: true,
                        ),
                      ),
                    ),

                    Positioned(
                      left: 20,
                      right: 20,
                      bottom: 35,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome To Secret Box',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Gilroy',
                              fontSize: 40,
                              color: Colors.white,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 64,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: 0,
                              ),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/plan',
                                );
                              },
                              child: Row(
                                children: const [
                                  Expanded(
                                    child: Text(
                                      'Continue',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 22,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 25,
                                    color: blue,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
