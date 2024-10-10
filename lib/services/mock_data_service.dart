import 'package:flutter/foundation.dart';
import '../models/review.dart';

class Offer {
  final String id;
  final String title;
  final String description;
  final String businessId;
  bool isCompleted;

  Offer({
    required this.id,
    required this.title,
    required this.description,
    required this.businessId,
    this.isCompleted = false,
  });
}

class MockDataService extends ChangeNotifier {
  List<Offer> _offers = [
    Offer(
      id: '1',
      title: 'Coffee Shop Promotion',
      description: 'Looking for food bloggers to promote our new summer menu',
      businessId: 'business1',
    ),
    Offer(
      id: '2',
      title: 'Fashion Brand Collaboration',
      description: 'Seeking fashion influencers for our upcoming collection launch',
      businessId: 'business2',
    ),
    Offer(
      id: '3',
      title: 'Tech Product Review',
      description: 'Need tech enthusiasts to review our latest smartphone',
      businessId: 'business3',
    ),
  ];

  List<Review> _reviews = [];

  List<Offer> get offers => _offers;
  List<Review> get reviews => _reviews;

  void addOffer(Offer offer) {
    _offers.add(offer);
    notifyListeners();
  }

  void updateOffer(Offer offer) {
    final index = _offers.indexWhere((o) => o.id == offer.id);
    if (index != -1) {
      _offers[index] = offer;
      notifyListeners();
    }
  }

  void deleteOffer(String offerId) {
    _offers.removeWhere((offer) => offer.id == offerId);
    notifyListeners();
  }

  void completeOffer(String offerId) {
    final offer = _offers.firstWhere((o) => o.id == offerId);
    offer.isCompleted = true;
    notifyListeners();
  }

  void addReview(Review review) {
    _reviews.add(review);
    notifyListeners();
  }

  List<Review> getReviewsForOffer(String offerId) {
    return _reviews.where((review) => review.offerId == offerId).toList();
  }
}