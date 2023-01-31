import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../cubit/car_cubit.dart';
import 'card_car.dart';
import '../../../user/presentation/user_router.dart';

class CarBodyCustom extends StatefulWidget {
  const CarBodyCustom({super.key});

  @override
  State<CarBodyCustom> createState() => _CarBodyCustomState();
}

class _CarBodyCustomState extends State<CarBodyCustom> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocConsumer<CarCubit, CarState>(listener: (context, state) {
      if (state.status == CarStatus.saveCar) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Salvo em favoritos',
              style: GoogleFonts.jua(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.blue,
          ),
        );
      }
      if (state.status == CarStatus.saveCarBad) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Erro ao salvar carro ou ja existe na lista de favoritos!!',
              style: GoogleFonts.jua(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.amber,
          ),
        );
      }
      if (state.status == CarStatus.logout) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Saindo',
                  style: GoogleFonts.jua(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const CircularProgressIndicator(),
              ],
            ),
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.amber,
          ),
        );
        Future.delayed(const Duration(seconds: 4)).then(
          (_) => context.pushReplacement(UserRouter.route),
        );
      }
    }, builder: (context, state) {
      if (state.status == CarStatus.loading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state.status == CarStatus.error) {
        return const Center(
          child: Text(
            'Falha ao carregar os dados',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0XFF595959),
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          itemCount: state.listCar!.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            mainAxisSpacing: 5,
            crossAxisSpacing: 20,
            mainAxisExtent: 400,
          ),
          itemBuilder: (context, index) {
            return CardCar(
              size: size,
              carEntity: state.listCar![index],
            );
          },
        ),
      );
    });
  }
}
