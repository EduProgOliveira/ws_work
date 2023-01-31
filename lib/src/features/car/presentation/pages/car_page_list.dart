import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../cubit/car_cubit.dart';
import '../widgets/car_body_custom.dart';

class CarPageList extends StatefulWidget {
  const CarPageList({super.key});

  @override
  State<CarPageList> createState() => _CarPageListState();
}

class _CarPageListState extends State<CarPageList> {
  @override
  Widget build(BuildContext context) {
    context.read<CarCubit>().getListCars();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WS WORK',
          style: GoogleFonts.jua(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async => context.read<CarCubit>().logOut(),
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: const CarBodyCustom(),
    );
  }
}
