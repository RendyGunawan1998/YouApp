import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  LoginBloc(this.userRepository) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        final res = await userRepository.login(event.username, event.password);
        if (res.statusCode == 201) {
          var data = json.decode(res.body);
          final SharedPreferences prefs = await _prefs;
          await prefs.setString('token', data['access_token']);
          emit(LoginSuccess('Login success!'));
        } else {
          emit(LoginFailure('Failed login. Please try again.'));
        }
      } catch (error) {
        emit(LoginFailure(error.toString()));
      }
    });
  }
}
