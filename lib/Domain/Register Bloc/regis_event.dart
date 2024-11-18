import '../../core.dart';

abstract class RegisEvent extends Equatable {
  const RegisEvent();

  @override
  List<Object> get props => [];
}

class RegisButtonPressed extends RegisEvent {
  final String username;
  final String password;
  final String email;

  const RegisButtonPressed(
      {required this.email, required this.username, required this.password});

  @override
  List<Object> get props => [email, username, password];
}
