import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({
    super.key,
  });

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController user = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController repass = TextEditingController();

  @override
  void initState() {
    super.initState();
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
            buttonBack(() {
              navigateMe(context, () => LoginScreen());
            }),
            BlocBuilder<RegisBloc, RegisState>(builder: (context, state) {
              if (state is RegisLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is RegisSuccess) {
                showTopSnackBar(
                    context, 'Success', 'Registration Successfull!');

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushNamed(context, '/');
                });
              }
              return Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleLoginRegis('Register'),
                    hbox(30),
                    boxUser('Enter Email', email),
                    hbox(15),
                    boxUser('Create Username', user),
                    hbox(15),
                    boxPass('Create Password', pass, (String text) {}),
                    hbox(15),
                    boxPass('Confirm Password', repass, (String text) {
                      if (mounted) {
                        setState(() {});
                      }
                    }),
                    hbox(20),
                    buttonLoginRegis('Register', user, repass, () {
                      if (pass.text != repass.text) {
                        alerts(context,
                            'Password and confirm password not match. Please check your input value again.');
                      } else {
                        context.read<RegisBloc>().add(RegisButtonPressed(
                            email: email.text,
                            username: user.text,
                            password: pass.text));
                      }
                    }),
                    hbox(50),
                    textLoginRegisAcc('Have an account? ', 'Login Here', () {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.pushNamed(context, '/');
                      });
                    }),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
