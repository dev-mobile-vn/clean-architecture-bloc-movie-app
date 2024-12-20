import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/common/contants/routers.dart';
import '../../core/common/widgets/button_widget.dart';
import 'bloc/well_come_bloc.dart';

class WellComeScreen extends StatelessWidget {
  static String routeName = '/';
  const WellComeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: BlocConsumer<WellComeBloc, WellComeState>(
          listener: (context, state) {
            if (state is WellComeActionButton) {
              Navigator.pushNamedAndRemoveUntil(context, loginRoute, (route) => false);
            }
          },
          buildWhen: (previous, current) {
            return current.runtimeType == WellComeInitial;
          },
          builder: (context, state) {
            int changeIndex = 0;
            if (state is WellComeInitial) {
              changeIndex = state.changeIndex;
            }
            return Stack(
              fit: StackFit.expand,
              children: [
                PageView(
                  onPageChanged: (index) => context.read<WellComeBloc>().add(ViewChangeEvent(index: index)),
                  children: [
                    Image.asset(
                      'assets/images/bg_welcome.png',
                      fit: BoxFit.fitWidth,
                    ),
                    Image.asset(
                      'assets/images/bg_welcome.png',
                      fit: BoxFit.fitWidth,
                    ),
                    Image.asset(
                      'assets/images/bg_welcome.png',
                      fit: BoxFit.fitWidth,
                    )
                  ],
                ),
                Positioned(
                  bottom: 24,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        'Welcome to Mova',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'The best movie streaming app of the century to make your days great!',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(3, (index) {
                            bool selected = changeIndex == index;
                            if (selected) {
                              return Container(
                                width: 32,
                                height: 8,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.red),
                              );
                            }
                            return Container(
                              margin: const EdgeInsets.only(left: 8, right: 8),
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white),
                            );
                          })),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ButtonWidget(
                            btnText: 'Get Started',
                            action: () => context.read<WellComeBloc>().add(ActionButtonEvent())),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
