part of 'models.dart';

class ScoreModel {
  final String practiceDate;
  final int distance;
  final VenueModel venue;
  final int score;

  ScoreModel(this.practiceDate, this.distance, this.venue, this.score);
}

List<ScoreModel> mockScore = [
  ScoreModel("12/12/2021", 50, mockVenue[0], 150),
  ScoreModel("12/12/2021", 30, mockVenue[0], 200),
];