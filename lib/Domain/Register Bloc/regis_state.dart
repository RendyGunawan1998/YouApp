import '../../core.dart';

abstract class RegisState extends Equatable {
  const RegisState();

  @override
  List<Object> get props => [];
}

class RegisInitial extends RegisState {}

class RegisLoading extends RegisState {}

class RegisSuccess extends RegisState {
  final String message;

  const RegisSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class RegisFailure extends RegisState {
  final String error;

  const RegisFailure(this.error);

  @override
  List<Object> get props => [error];
}
