import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_with_me/app/l10n/app_localizations.dart';
import 'package:learn_with_me/core/constants/app_assets.dart';
import 'package:learn_with_me/presentation/blocs/auth_bloc.dart';
import 'package:learn_with_me/core/constants/app_colors.dart';
import 'package:learn_with_me/core/constants/app_constants.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final List<Map<String, dynamic>> _sections = [
    {'title': 'Letters', 'image': AppAssets.logoPath, 'route': '/letters'},
    {'title': 'number', 'image': AppAssets.logoPath, 'route': '/numbers'},
    {'title': 'Animals', 'image': AppAssets.logoPath, 'route': '/animals'},
    {
      'title': 'story',
      'image': AppAssets.storyImagePath,
      'route': '/stories'
    },
  ];

  void _navigateToSection(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return BlocProvider<AuthBloc>(
      create: (context) => GetIt.I.get<AuthBloc>(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(AppConstants.appName),
          ),
          body: Column(
            children: [
              Expanded(
                child: _buildSection(
                    context,
                    localizations.translate('For Learners'),
                    _buildLearnersSection),
              ),
              Expanded(
                child: _buildSection(
                    context,
                    localizations.translate('For Parents'),
                    _buildParentsSection),
              ),
            ],
          )),
    );
  }

  Widget _buildSection(BuildContext context, String title,
      Widget Function(BuildContext) builder) {

      final List<String> titleParts = title.split(' ');
    if(titleParts.length > 1){
       title = titleParts[1];
    }
    else{
       title = titleParts[0];
    }
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.translate(title),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Expanded(child: builder(context)),
      ],
    );
  }

  Widget _buildLearnersSection(BuildContext context) {
    return ResponsiveWidget(
      mobileWidget: ListView.builder(
        itemCount: _sections.length,
        itemBuilder: (context, index) {
          if (_sections[index]['title'] == "Colors") return const SizedBox();
          return ListTile(
              leading: Image(image: AssetImage(_sections[index]['image'])),
              title: Text(AppLocalizations.of(context)!
                  .translate(_sections[index]['title'])),
              onTap: () => _navigateToSection(context,
                    _sections[index]['route'],
                  )
                  );
        },
      ),
      tabletWidget: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
        ),
        itemCount: _sections.length,
        itemBuilder: (context, index) {
           if (_sections[index]['title'] == "Colors") return const SizedBox();
          final String sectionTitle = AppLocalizations.of(context)!
              .translate(_sections[index]['title']);
          return ElevatedButton(
            onPressed: () => _navigateToSection(
                context, _sections[index]['route']
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryColor,
                foregroundColor: AppColors.primaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(_sections[index]['image']),
                  width: 50,
                  height: 50,
                ),Text(
                    .translate(_sections[index]['title'])),
              ]),
          );
        },
      ),
      desktopWidget: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.5,
        ),
        itemCount: _sections.length,
        itemBuilder: (context, index) {
             if (_sections[index]['title'] == "Colors") return const SizedBox();
          final String sectionTitle = AppLocalizations.of(context)!
              .translate(_sections[index]['title']);
          return ElevatedButton(
            onPressed: () => _navigateToSection(
                context, _sections[index]['route']
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryColor,
                foregroundColor: AppColors.primaryColor),
            child: Column(children: [
              Image(image: AssetImage(_sections[index]['image'])),
              Text(
                sectionTitle,
              ),
            ]),
          );
        },
      ),
    );
  }

  Widget _buildParentsSection(BuildContext context) {
    return Center(
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {},
        child: ElevatedButton(
            onPressed: () {
              GetIt.I.get<AuthBloc>().add(const LogoutEvent());
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryColor,
                foregroundColor: AppColors.primaryColor),
            child: Text(AppLocalizations.of(context)!.translate('logout')),
          ),
      ),
    );
  }
}