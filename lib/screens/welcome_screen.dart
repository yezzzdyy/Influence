import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'business_dashboard.dart';
import 'influencer_dashboard.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isIOS = Platform.isIOS;
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Influence',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: mediaQuery.size.height * 0.05),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BusinessDashboard()),
                  );
                },
                child:
                    Text(isIOS ? 'Business Dashboard' : 'BUSINESS DASHBOARD'),
              ),
              SizedBox(height: mediaQuery.size.height * 0.02),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InfluencerDashboard()),
                  );
                },
                child: Text(
                    isIOS ? 'Influencer Dashboard' : 'INFLUENCER DASHBOARD'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
