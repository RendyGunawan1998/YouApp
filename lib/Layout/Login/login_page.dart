import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  void initState() {
    super.initState();
    // user.text = 'jhondoe';
    // pass.text = 'jhondoe123';
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: bodyBG(
        Stack(
          children: [
            buttonBack(() {}),
            BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
              if (state is LoginLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LoginSuccess) {
                // Navigator.pushNamed(context, '/profile');
                showTopSnackBar(context, 'Success', 'Login Successfull!');

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushNamed(context, '/profile');
                });
              } else if (state is LoginFailure) {
                showTopSnackBar(context, 'Failed', state.error.toString());
              }
              return Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleLoginRegis('Login'),
                    hbox(30),
                    boxUser('Enter Username/Email', user),
                    hbox(15),
                    boxPass('Enter Password', pass, (text) {
                      if (mounted) {
                        setState(() {
                          print('user :: ${user.text}');
                          print('pass :: ${user.text}');
                        });
                      }
                    }),
                    hbox(20),
                    buttonLoginRegis('Login', user, pass, () {
                      context.read<LoginBloc>().add(LoginButtonPressed(
                          username: user.text, password: pass.text));
                    }),
                    hbox(50),
                    textLoginRegisAcc('No account? ', 'Register Here', () {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.pushNamed(context, '/registration');
                      });
                    }),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
