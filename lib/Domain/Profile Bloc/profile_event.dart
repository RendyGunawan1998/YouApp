import '../../core.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetProfile extends ProfileEvent {}

class UpdatePressed extends ProfileEvent {
  final String name;
  final String birthday;
  final int height;
  final int weight;
  final List<String> interest;

  UpdatePressed({
    required this.name,
    required this.birthday,
    required this.height,
    required this.weight,
    required this.interest,
  });

  @override
  List<Object> get props => [name, birthday, height, weight, interest];
}

class CreatePressed extends ProfileEvent {
  final String name;
  final String birthday;
  final int height;
  final int weight;

  CreatePressed({
    required this.name,
    required this.birthday,
    required this.height,
    required this.weight,
  });

  @override
  List<Object> get props => [name, birthday, height, weight];
}
