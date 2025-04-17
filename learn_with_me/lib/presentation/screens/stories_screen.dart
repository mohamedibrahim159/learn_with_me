import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_with_me/core/services/audio_service.dart';
import 'package:learn_with_me/app/l10n/app_localizations.dart';
import 'package:learn_with_me/presentation/blocs/story_bloc.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';

class StoriesScreen extends StatelessWidget {
  final AudioService audioService;
  const StoriesScreen({super.key, required this.audioService});


  @override
  Widget build(BuildContext context) {
    final storyBloc = BlocProvider.of<StoryBloc>(context)..add(const GetStoriesEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.stories),
      ),
      body: BlocBuilder<StoryBloc, StoryState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.errorMessage != null) {
            return Center(
              child: Text(state.errorMessage!),
            );
          } else if (state.stories != null) {
            return ResponsiveWidget(
              mobileWidget: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: state.stories!.length,
                  itemBuilder: (context, index) {
                    final story = state.stories![index];
                    return ListTile(
                      title: Text(story.name),
                      trailing: IconButton(
                        icon: const Icon(Icons.volume_up),
                        onPressed: () => audioService.playAudio(story.audioPath),
                      ),
                    );
                  },
                ),
              ),
              tabletWidget: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: state.stories!.length,
                  itemBuilder: (context, index) {
                    final story = state.stories![index];
                    return ListTile(
                      title: Text(story.name),
                      trailing: IconButton(
                        icon: const Icon(Icons.volume_up),
                        onPressed: () => audioService.playAudio(story.audioPath),
                      ),
                    );
                  },
                ),
              ),
              desktopWidget: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: state.stories!.length,
                  itemBuilder: (context, index) {
                    final story = state.stories![index];
                    return ListTile(
                      title: Text(story.name),
                      trailing: IconButton(
                        icon: const Icon(Icons.volume_up),
                        onPressed: () => audioService.playAudio(story.audioPath),
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}