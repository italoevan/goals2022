import 'package:goals_2022/domain/entities/goal.dart';

abstract class GoalDao {
  Future<List<Goal>?> read();
  Future<void> create(Goal goal);
  Future<void> update(Goal goal);
  Future<void> delete(int id);
}
