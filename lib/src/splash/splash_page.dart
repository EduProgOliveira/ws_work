import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../features/car/presentation/car_router.dart';
import '../features/user/presentation/user_router.dart';
import 'cubit/splash_cubit.dart';
import 'cubit/splash_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    context.read<SplashCubit>().checkAuth();
    return BlocConsumer<SplashCubit, SplashState>(listener: (context, state) {
      if (state.status == SplashStatus.authenticated) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Bem vindo de volta',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.blue,
          ),
        );
        Future.delayed(const Duration(seconds: 2)).then((_) {
          context.pushReplacement(CarRouter.route);
        });
      } else if (state.status == SplashStatus.unauthenticated) {
        context.pushReplacement(UserRouter.route);
      }
    }, builder: (context, state) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
