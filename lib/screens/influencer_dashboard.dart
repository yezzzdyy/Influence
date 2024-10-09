import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'edit_influencer_profile_screen.dart';
import 'offer_details_screen.dart';

class InfluencerDashboard extends StatelessWidget {
  const InfluencerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isIOS = Platform.isIOS;
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Influencer Dashboard'),
        actions: [
          IconButton(
            icon: Icon(isIOS ? Icons.exit_to_app : Icons.logout),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Collaboration Offers',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: mediaQuery.size.height * 0.02),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Replace with actual data length
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Offer ${index + 1}'),
                      subtitle: Text('Details about offer ${index + 1}'),
                      trailing: Icon(isIOS
                          ? CupertinoIcons.right_chevron
                          : Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OfferDetailsScreen(
                              offerId: 'offer_${index + 1}',
                              offerTitle: 'Offer ${index + 1}',
                              offerDescription:
                                  'Details about offer ${index + 1}',
                              isBusinessView: false,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const EditInfluencerProfileScreen()),
          );
        },
        child: Icon(isIOS ? CupertinoIcons.person : Icons.person),
        tooltip: 'Edit Profile',
      ),
    );
  }
}
