import 'package:goals_2022/domain/entities/goal.dart';

abstract class GoalDao {
  Future<List<Goal>?> read();
  Future insert(Goal goal);
  Future update(Goal goal);
}
