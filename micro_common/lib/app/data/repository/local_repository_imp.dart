import 'package:micro_common/app/data/models/apod_model.dart';
import 'package:micro_common/app/domain/entity/apod_entity.dart';
import 'package:micro_dependency/micro_dependency.dart';

class LocalDatasource {
  LocalDatasource();

  Future<bool> start(List<ApodEntity> quizzes) async {
    return _database.startDatabase(quizzes);
  }

  Future<ApodEntity?> getApodLocal() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    final result = instance.getString('apod');
    if (result == null) {
      return null;
    }
    return ApodModel.fromJson(result);
  }

  Future<bool> saveApodLocal(ApodEntity apod) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    return instance.setString('apod', (apod as ApodModel).toJson());
  }

  Future<bool?> saveScoreLocal(List<QuizEntity> quizzes) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    int responsesQuizzes = 0;
    for (final quiz in quizzes) {
      if (quiz.questionsAnswered == quiz.questions.length) {
        responsesQuizzes++;
      }
    }

    final double percent = (responsesQuizzes / quizzes.length) * 100;

    return _database.saveScore(percent.floor());
  }
}
