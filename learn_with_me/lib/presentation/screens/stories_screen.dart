import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_with_me/domain/entities/story.dart';
import 'package:learn_with_me/presentation/blocs/story_bloc.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StoryBloc>(
      create: (context) =>
          GetIt.I.get<StoryBloc>()..add(const GetStoriesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Stories'),
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
                      );
                    },
                  ),
                ),
                tabletWidget: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: state.stories!.length,
                    itemBuilder: (context, index) => Text(state.stories![index].name),
                  ),
                ),
                desktopWidget: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: state.stories!.length,
                    itemBuilder: (context, index) => Text(state.stories![index].name),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}