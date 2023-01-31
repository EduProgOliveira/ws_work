import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../cubit/user_cubit.dart';

class ButtonTextCustom extends StatelessWidget {
  const ButtonTextCustom({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<UserCubit>();
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 70),
      width: 100,
      child: TextButton(
        onPressed: () async {
          await cubit.checkCredential();
        },
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical: 15),
          ),
          backgroundColor: MaterialStatePropertyAll(Colors.amber),
        ),
        child: Text(
          'Entrar',
          style: GoogleFonts.jua(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
