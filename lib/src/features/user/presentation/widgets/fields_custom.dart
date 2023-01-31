import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../cubit/user_cubit.dart';
import '../cubit/user_state.dart';

class FieldsCustom extends StatelessWidget {
  const FieldsCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      return Container(
        margin: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            TextFieldCustom(
              text: 'Insira seu email',
              onChanged: (value) =>
                  context.read<UserCubit>().emailChanged(value),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldCustom(
              text: 'Insira seu nome',
              onChanged: (value) =>
                  context.read<UserCubit>().nameChanged(value),
            ),
          ],
        ),
      );
    });
  }
}

class TextFieldCustom extends StatelessWidget {
  final String text;
  final Function(String)? onChanged;

  const TextFieldCustom({super.key, required this.text, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: GoogleFonts.jua(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: GoogleFonts.jua(
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        fillColor: const Color(0XFFD9D9D9),
        filled: true,
      ),
    );
  }
}
