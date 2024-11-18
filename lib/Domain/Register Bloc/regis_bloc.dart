import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core.dart';

class RegisBloc extends Bloc<RegisEvent, RegisState> {
  final RegisRepository regisRepository;

  RegisBloc(this.regisRepository) : super(RegisInitial()) {
    on<RegisButtonPressed>((event, emit) async {
      emit(RegisLoading());
      try {
        final res = await regisRepository.regis(
            event.email, event.username, event.password);
        if (res.statusCode == 201) {
          emit(RegisSuccess('Regis success!'));
        } else {
          emit(RegisFailure('Failed Regis. Please try again.'));
        }
      } catch (error) {
        emit(RegisFailure(error.toString()));
      }
    });
  }
}
