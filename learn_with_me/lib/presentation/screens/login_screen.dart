import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_with_me/app/l10n/app_localizations.dart';
import 'package:learn_with_me/presentation/blocs/auth_bloc.dart';
import 'package:learn_with_me/presentation/routes/app_routes.dart';
import 'package:learn_with_me/presentation/widgets/responsive_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final AuthBloc authBloc = GetIt.I.get<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (context, state) {
          if (state.user != null) {
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          }
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
              ),
            );
          }
        },
        child: ResponsiveWidget(
          mobileWidget: _buildLoginButton(context),
          tabletWidget: SizedBox(
            width: 400,
            child: _buildLoginButton(context),
          ),
          desktopWidget: SizedBox(
            width: 400,
            child: _buildLoginButton(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(localizations.loginAsGuest),
          ElevatedButton(
            onPressed: () {
              authBloc.add(const AnonymousLoginEvent());
            },
            child: Text(localizations.login),
          ),
        ),
      ),
    );
  }
}