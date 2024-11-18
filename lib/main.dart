import 'package:flutter_bloc/flutter_bloc.dart';
import 'core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(UserRepository())),
        BlocProvider<RegisBloc>(
            create: (BuildContext context) => RegisBloc(RegisRepository())),
        BlocProvider<ProfileBloc>(
            create: (BuildContext context) => ProfileBloc(ProfileRepository())),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'YouApp',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/registration': (context) => RegistrationScreen(),
          '/profile': (context) => ProfileScreen(),
        },
      ),
    );
  }
}
