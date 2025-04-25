import 'package:flutter/material.dart';
import '../widgets/responsive_widget.dart';
class NumbersScreen extends StatefulWidget {
  const NumbersScreen({
    super.key,
  });

  @override
  State<NumbersScreen> createState() => _NumbersScreenState();
}

class _NumbersScreenState extends State<NumbersScreen> {
  @override
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ResponsiveWidget(
          mobileWidget: Padding(
            padding: const EdgeInsets.all(10),
            child: _buildGrid(context, 2),
          ),
          tabletWidget: Padding(
            padding: const EdgeInsets.all(20),
            child: _buildGrid(context, 3),
          ),
          desktopWidget: Padding(
            padding: const EdgeInsets.all(20),
            child: _buildGrid(context, 4),
          ),
        ),
      ),
    );
  }
  Widget _buildGrid(BuildContext context, int crossAxisCount) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/placeholder_image.png',
                height: 50,
                width: 50,
              ),
              const SizedBox(height: 10),
              const Icon(Icons.volume_up, size: 30),
            ],
          ),
        );
      },
    );
  }
}
                  child: Builder(builder: (context) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state.errorMessage.isNotEmpty) {
                      return Center(child: Text(state.errorMessage));
                    }
                    final numbers = state.numbers;
                    return ListView.builder(
                      itemCount: numbers.length,
                      itemBuilder: (context, index) {
                        final Number number = numbers[index];
                        return ListTile(
                          title: Text(number.number.toString()),
                          trailing: IconButton(
                            icon: const Icon(Icons.volume_up),
                            onPressed: () {
                              widget.audioService
                                  .playAudio(number.audioPath);
                            },
                          ),
                        );
                      },
                    );
                  }),
                ),
                tabletWidget: Padding(
                  padding: const EdgeInsets.all(20),
                  child: GridView.builder(
                      itemCount: state.numbers.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        final Number number = state.numbers[index];
                        return ListTile(
                          title: Center(
                            child: Text(
                              number.number.toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                        ),
                         trailing: IconButton(
                          icon: const Icon(Icons.volume_up),
                          onPressed: () {
                            widget.audioService.playAudio(number.audioPath);
                          },
                        ),
                        );
                      }),
                ),
                desktopWidget: Padding(
                  padding: const EdgeInsets.all(20),
                  child: GridView.builder(
                      itemCount: state.numbers.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        final Number number = state.numbers[index];
                        return ListTile(
                          title: Center(
                            child: Text(
                              number.number.toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                        ),
                         trailing: IconButton(
                          icon: const Icon(Icons.volume_up),
                          onPressed: () {
                            widget.audioService.playAudio(number.audioPath);
                          },
                        ),
                        );
                      }),
                ),
              );
              },
            );
          }),
        );
      },
    );
  }
}