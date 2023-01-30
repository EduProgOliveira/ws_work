import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ws_work/src/features/car/domain/entities/car_entity.dart';
import 'package:ws_work/src/features/car/presentation/cubit/car_cubit.dart';
import 'package:ws_work/src/features/user/presentation/user_router.dart';

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
                fontWeight: FontWeight.normal,
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
                fontWeight: FontWeight.normal,
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
                    fontWeight: FontWeight.normal,
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

class CardCar extends StatelessWidget {
  const CardCar({
    super.key,
    required this.size,
    required this.carEntity,
  });

  final Size size;
  final CarEntity carEntity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: size.width * 0.45,
          height: size.width * 0.90,
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.asset(
                    'assets/images/corolla-xei.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "${carEntity.modelName}\n".toUpperCase(),
                                  style: GoogleFonts.jua(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                TextSpan(
                                  text: carEntity.brandName.toUpperCase(),
                                  style: GoogleFonts.jua(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/car.svg',
                                width: 20,
                              ),
                              Text(
                                '${carEntity.doorNumber}',
                                style: GoogleFonts.jua(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/calendar.svg',
                                width: 20,
                              ),
                              Text(
                                '${carEntity.year}',
                                style: GoogleFonts.jua(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/gas-station.svg',
                                width: 20,
                              ),
                              Text(
                                carEntity.fuel,
                                style: GoogleFonts.jua(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/pingo-dagua.svg',
                                width: 20,
                                color: carEntity.colorCar(),
                              ),
                              Text(
                                carEntity.color,
                                style: GoogleFonts.jua(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            carEntity.typeFuel(),
                            style: GoogleFonts.jua(
                              color: Colors.amber,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async => await context
                                .read<CarCubit>()
                                .saveCar(carEntity),
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Colors.amber,
                              ),
                              elevation: MaterialStatePropertyAll(2),
                            ),
                            child: Text(
                              'Eu quero',
                              style: GoogleFonts.jua(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: size.height * 0.24,
          left: 4,
          child: Container(
            width: size.width * 0.25,
            height: size.height * 0.06,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'R\$ ${carEntity.fipePrice}',
              style: GoogleFonts.jua(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
