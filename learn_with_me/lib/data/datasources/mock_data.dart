// lib/data/datasources/mock_data.dart

import 'package:learn_with_me/data/models/animal_model.dart';
import 'package:learn_with_me/data/models/color_model.dart';
import 'package:learn_with_me/data/models/letter_model.dart';
import 'package:learn_with_me/data/models/number_model.dart';
import 'package:learn_with_me/data/models/story_model.dart';

List<LetterModel> mockLetters = [
  LetterModel(letter: 'A', audioPath: 'assets/audios/a.mp3'),
  LetterModel(letter: 'B', audioPath: 'assets/audios/b.mp3'),
  LetterModel(letter: 'C', audioPath: 'assets/audios/c.mp3'),
  LetterModel(letter: 'D', audioPath: 'assets/audios/d.mp3'),
  LetterModel(letter: 'E', audioPath: 'assets/audios/e.mp3'),
  LetterModel(letter: 'F', audioPath: 'assets/audios/f.mp3'),
  LetterModel(letter: 'G', audioPath: 'assets/audios/g.mp3'),
  LetterModel(letter: 'H', audioPath: 'assets/audios/h.mp3'),
  LetterModel(letter: 'I', audioPath: 'assets/audios/i.mp3'),
  LetterModel(letter: 'J', audioPath: 'assets/audios/j.mp3'),
];

List<NumberModel> mockNumbers = [
  NumberModel(number: 1, audioPath: 'assets/audios/1.mp3'),
  NumberModel(number: 2, audioPath: 'assets/audios/2.mp3'),
  NumberModel(number: 3, audioPath: 'assets/audios/3.mp3'),
  NumberModel(number: 4, audioPath: 'assets/audios/4.mp3'),
  NumberModel(number: 5, audioPath: 'assets/audios/5.mp3'),
  NumberModel(number: 6, audioPath: 'assets/audios/6.mp3'),
  NumberModel(number: 7, audioPath: 'assets/audios/7.mp3'),
  NumberModel(number: 8, audioPath: 'assets/audios/8.mp3'),
  NumberModel(number: 9, audioPath: 'assets/audios/9.mp3'),
  NumberModel(number: 10, audioPath: 'assets/audios/10.mp3'),
];

List<AnimalModel> mockAnimals = [
  AnimalModel(name: 'Cat', image: 'assets/images/cat.png', audioPath: 'assets/audios/cat.mp3'),
  AnimalModel(name: 'Dog', image: 'assets/images/dog.png', audioPath: 'assets/audios/dog.mp3'),
  AnimalModel(name: 'Elephant', image: 'assets/images/elephant.png', audioPath: 'assets/audios/elephant.mp3'),
  AnimalModel(name: 'Lion', image: 'assets/images/lion.png', audioPath: 'assets/audios/lion.mp3'),
  AnimalModel(name: 'Monkey', image: 'assets/images/monkey.png', audioPath: 'assets/audios/monkey.mp3'),
  AnimalModel(name: 'Tiger', image: 'assets/images/tiger.png', audioPath: 'assets/audios/tiger.mp3'),
  AnimalModel(name: 'Zebra', image: 'assets/images/zebra.png', audioPath: 'assets/audios/zebra.mp3'),
  AnimalModel(name: 'Bear', image: 'assets/images/bear.png', audioPath: 'assets/audios/bear.mp3'),
  AnimalModel(name: 'Fox', image: 'assets/images/fox.png', audioPath: 'assets/audios/fox.mp3'),
  AnimalModel(name: 'Wolf', image: 'assets/images/wolf.png', audioPath: 'assets/audios/wolf.mp3'),
];

List<ColorModel> mockColors = [
  ColorModel(name: 'Red', hex: '#FF0000', audioPath: 'assets/audios/red.mp3'),
  ColorModel(name: 'Green', hex: '#00FF00', audioPath: 'assets/audios/green.mp3'),
  ColorModel(name: 'Blue', hex: '#0000FF', audioPath: 'assets/audios/blue.mp3'),
  ColorModel(name: 'Yellow', hex: '#FFFF00', audioPath: 'assets/audios/yellow.mp3'),
  ColorModel(name: 'Orange', hex: '#FFA500', audioPath: 'assets/audios/orange.mp3'),
  ColorModel(name: 'Purple', hex: '#800080', audioPath: 'assets/audios/purple.mp3'),
  ColorModel(name: 'Pink', hex: '#FFC0CB', audioPath: 'assets/audios/pink.mp3'),
  ColorModel(name: 'Brown', hex: '#A52A2A', audioPath: 'assets/audios/brown.mp3'),
  ColorModel(name: 'Gray', hex: '#808080', audioPath: 'assets/audios/gray.mp3'),
  ColorModel(name: 'Black', hex: '#000000', audioPath: 'assets/audios/black.mp3'),

];

List<StoryModel> mockStories = [
  StoryModel(name: 'The Lion and the Mouse', audioPath: 'assets/audios/lion_and_mouse.mp3'),
  StoryModel(name: 'The Tortoise and the Hare', audioPath: 'assets/audios/tortoise_and_hare.mp3'),
  StoryModel(name: 'The Boy Who Cried Wolf', audioPath: 'assets/audios/boy_who_cried_wolf.mp3'),
  StoryModel(name: 'Goldilocks and the Three Bears', audioPath: 'assets/audios/goldilocks_and_three_bears.mp3'),
  StoryModel(name: 'Cinderella', audioPath: 'assets/audios/cinderella.mp3'),
];