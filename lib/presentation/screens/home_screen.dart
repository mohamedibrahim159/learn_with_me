import 'package:flutter/material.dart';
import 'package:learn_with_me/core/services/audio_service.dart';
import 'package:learn_with_me/presentation/blocs/animal_bloc.dart';
import 'package:learn_with_me/presentation/blocs/letter_bloc.dart';
import 'package:learn_with_me/presentation/blocs/number_bloc.dart';
import 'package:learn_with_me/presentation/blocs/story_bloc.dart';
import 'package:learn_with_me/presentation/screens/animals_screen.dart';
import 'package:learn_with_me/presentation/screens/letters_screen.dart';
import 'package:learn_with_me/presentation/screens/stories_screen.dart';
import 'package:learn_with_me/presentation/screens/numbers_screen.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';


class HomeScreen extends StatefulWidget {
  final LetterBloc letterBloc;
  final NumberBloc numberBloc;
  final AnimalBloc animalBloc;
  final StoryBloc storyBloc;
  final AudioService audioService;
  const HomeScreen({Key? key, required this.letterBloc, required this.numberBloc, required this.animalBloc, required this.storyBloc, required this.audioService}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
   late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      LettersScreen(letterBloc: widget.letterBloc, audioService: widget.audioService),
      NumbersScreen(numberBloc: widget.numberBloc, audioService: widget.audioService),
      AnimalsScreen(animalBloc: widget.animalBloc, audioService: widget.audioService),
      StoriesScreen(storyBloc: widget.storyBloc, audioService: widget.audioService),
    ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (context, size) {
      return Scaffold(
        body: 
            child: _screens[_selectedIndex]),
         bottomNavigationBar: BottomNavigationBar(
         backgroundColor: Colors.transparent,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.text_fields,
            ),
            label: 'Letters',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.format_list_numbered,
            ),
            label: 'Numbers',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pets,
            ),
            label: 'Animals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Stories',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      ); 
    });
  }
}