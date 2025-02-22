import 'package:flutter/material.dart';
import 'verify2.dart';

class Verify1Screen extends StatelessWidget {
  const Verify1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background image
              Positioned.fill(
                child: Image.asset(
                  'assets/images/background.jpg',  // Update with your actual asset path
                  fit: BoxFit.cover,
                ),
              ),

              // Main content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.043),
                child: Column(
                  children: [
                    // Back button
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                        padding: EdgeInsets.only(top: size.height * 0.02),
                      ),
                    ),

                    // Title and description
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Connect to your companys plan',
                            style: TextStyle(
                              color: const Color(0xFF0F1728),
                              fontSize: size.width * 0.08,
                              fontFamily: 'Public Sans',
                              fontWeight: FontWeight.w700,
                              height: 1.27,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Text(
                            'Enter your work email to link your account and access your company'
                            's exclusive benefits. We will send you a verification code to this email.',
                            style: TextStyle(
                              color: const Color(0xFF667084),
                              fontSize: size.width * 0.037,
                              fontFamily: 'Public Sans',
                              fontWeight: FontWeight.w600,
                              height: 1.43,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Email input field
                    Container(
                      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.032,
                        vertical: size.height * 0.015,
                      ),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF2F3F6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Work Email address',
                          hintStyle: TextStyle(
                            color: const Color(0xFF667084),
                            fontSize: size.width * 0.035,
                            fontFamily: 'Public Sans',
                            fontWeight: FontWeight.w400,
                            height: 1.38,
                            letterSpacing: -0.08,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    const Spacer(),

                    // Continue button
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: padding.bottom + size.height * 0.02),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Verify2Screen(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.015,
                            horizontal: size.width * 0.032,
                          ),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF4BBDD8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: Text(
                            'Continue',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.043,
                              fontFamily: 'Public Sans',
                              fontWeight: FontWeight.w500,
                              height: 1.50,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}