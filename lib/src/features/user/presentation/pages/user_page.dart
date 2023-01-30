import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ws_work/src/features/car/presentation/car_router.dart';
import 'package:ws_work/src/features/user/presentation/cubit/user_cubit.dart';
import 'package:ws_work/src/features/user/presentation/cubit/user_state.dart';
import 'package:ws_work/src/features/user/presentation/widgets/user_body_custom.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<UserCubit, UserState>(listener: (context, state) {
          if (state.status == UserStatus.error ||
              state.status == UserStatus.initial) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Por favor preencha os campos!!',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                duration: Duration(seconds: 2),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (state.status == UserStatus.success) {
            context.pushReplacement(CarRouter.route);
          }
        }, builder: (context, state) {
          return const UserBodyCustom();
        }),
      ),
    );
  }
}
