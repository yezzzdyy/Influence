class Review {
  final String id;
  final String reviewerId;
  final String revieweeId;
  final String offerId;
  final double rating;
  final String comment;
  final DateTime createdAt;

  Review({
    required this.id,
    required this.reviewerId,
    required this.revieweeId,
    required this.offerId,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });
}