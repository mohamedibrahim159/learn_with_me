import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_with_me/core/services/audio_service.dart';
import 'package:learn_with_me/domain/entities/story.dart';
import 'package:learn_with_me/presentation/blocs/story_bloc.dart';
import 'package:learn_with_me/presentation/blocs/story_event.dart';
import 'package:learn_with_me/presentation/blocs/story_state.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';

class StoriesScreen extends StatefulWidget {
  final StoryBloc storyBloc;
  final AudioService audioService;
  const StoriesScreen({Key? key, required this.storyBloc, required this.audioService}) : super(key: key);

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  @override
  void initState() {
    super.initState();
    widget.storyBloc.add(const GetStoriesEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<StoryBloc, StoryState>(
        bloc: widget.storyBloc,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.errorMessage.isNotEmpty) {
            return  Center(child: Text(state.errorMessage));
          }else {

          
          return ResponsiveWidget(
            mobileWidget: const Padding(
              padding: EdgeInsets.all(10.0),
                child: _buildGrid(stories: state.stories, crossAxisCount: 1),
              ),
              tabletWidget: const Padding(
                padding: EdgeInsets.all(20.0),
                child: _buildGrid(stories: state.stories, crossAxisCount: 2),
              ),
              desktopWidget: const Padding(
                padding: EdgeInsets.all(20.0),
                child: _buildGrid(stories: state.stories, crossAxisCount: 3),
              ),
            );
          }
        ),

    );
  }

  Widget _buildGrid({required List<Story> stories, required int crossAxisCount}) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
      ),
      itemCount: stories.length,
      itemBuilder: (context, index) {
        final story = stories[index];
        return _buildStoryItem(story, context);
      },
    );
  }Widget _buildStoryItem(Story story, BuildContext context) {    return  const Padding(
    padding:  EdgeInsets.all(8.0),
    child:  Card(
       color: Color.fromARGB(204, 255, 255, 255),
      child:  Column(
         mainAxisAlignment: MainAxisAlignment.center,

        children: [
          IconButton(
            icon: const Icon(Icons.volume_up),
            onPressed: () {
              widget.audioService.playAudio(story.sound);
            },
          ),

        ],

    );
   }
}