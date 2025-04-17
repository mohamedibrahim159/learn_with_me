import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_with_me/app/l10n/app_localizations.dart';
import 'package:learn_with_me/domain/entities/color.dart';
import 'package:learn_with_me/core/constants/app_constants.dart';
import 'package:learn_with_me/presentation/blocs/color_bloc.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorBloc()..add(GetColorsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Colors Screen'),
        title: Text(AppLocalizations.of(context)!.colorsScreen),
        body: ResponsiveWidget(
          mobileWidget: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BlocBuilder<ColorBloc, ColorState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.errorMessage.isNotEmpty) {
                  return Center(child: Text(state.errorMessage));
                }
                if (state.colors.isNotEmpty) {
                  return ListView.builder(
                    itemCount: state.colors.length,
                    itemBuilder: (context, index) {
                      final Color color = state.colors[index];
                      return ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(int.parse(color.hex.substring(1), radix: 16) + 0xFF000000),
                            shape: BoxShape.circle,
                          ),
                        ),
                        title: Text(color.name),
                      );
                    },
                  );
                }
                return const Center(
                  child: Text('No Colors Found'),
                );
              },
            ),
          ),
          tabletWidget: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocBuilder<ColorBloc, ColorState>(
              builder: (context, state) {
                 if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.errorMessage.isNotEmpty) {
                  return Center(child: Text(state.errorMessage));
                }
                if (state.colors.isNotEmpty) {
                  return GridView.builder(
                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                   itemCount: state.colors.length,
                   itemBuilder: (context, index) {
                      final Color color = state.colors[index];
                      return Center(child: Text(color.name));
                  },
                );
                }
                 return const Center(child: Text('No Colors Found'),);
              },
            ),
          ),
          desktopWidget: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocBuilder<ColorBloc, ColorState>(
              builder: (context, state) {
                 if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.errorMessage.isNotEmpty) {
                  return Center(child: Text(state.errorMessage));
                }
                if (state.colors.isNotEmpty) {
                  return GridView.builder(
                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                   itemCount: state.colors.length,
                   itemBuilder: (context, index) {
                      final Color color = state.colors[index];
                      return Center(child: Text(color.name));
                  },
                );
                }
                 return const Center(child: Text('No Colors Found'),);
              },
            ),
          ),
        ),
      ),
    );
  }
}

                  );
                },
              );
            }
            return const Center(
              child: Text('No Colors Found'),
            );
          },
        ),
      ),
    );
  }
}