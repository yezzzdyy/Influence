import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'messaging_screen.dart';

class OfferDetailsScreen extends StatelessWidget {
  final String offerId;
  final String offerTitle;
  final String offerDescription;
  final bool isBusinessView;

  const OfferDetailsScreen({
    Key? key,
    required this.offerId,
    required this.offerTitle,
    required this.offerDescription,
    required this.isBusinessView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isIOS = Platform.isIOS;

    return Scaffold(
      appBar: AppBar(
        title: Text(offerTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Offer Details',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text(offerDescription),
            const SizedBox(height: 24),
            if (!isBusinessView)
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement apply for offer functionality
                  print('Applied for offer: $offerId');
                },
                child: Text(isIOS ? 'Apply for Offer' : 'APPLY FOR OFFER'),
              ),
            if (isBusinessView)
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement edit offer functionality
                  print('Edit offer: $offerId');
                },
                child: Text(isIOS ? 'Edit Offer' : 'EDIT OFFER'),
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessagingScreen(
                      chatId: 'chat_$offerId',
                      recipientName: isBusinessView ? 'Influencer' : 'Business',
                    ),
                  ),
                );
              },
              child: Text(isIOS ? 'Start Conversation' : 'START CONVERSATION'),
            ),
          ],
        ),
      ),
    );
  }
}
