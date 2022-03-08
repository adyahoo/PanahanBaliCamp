part of 'models.dart';

class ScoreModel extends Equatable {
  final int? id;
  final int? detailId;
  final int? score;
  final int? length;
  final int? session;

  ScoreModel({this.id, this.detailId, this.score, this.length, this.session});

  factory ScoreModel.fromJson(Map<String, dynamic> data) => ScoreModel(
      id: data['id'],
      detailId: data['user_detail_activity_id'],
      score: data['score'],
      length: data['length'],
      session: data['session']);

  @override
  List<Object?> get props => [id, detailId, score, length, session];
}

List<ScoreModel> mockScore = [
  ScoreModel(detailId: 12, score: 50, length: 150),
  ScoreModel(detailId: 13, score: 80, length: 150),
];
