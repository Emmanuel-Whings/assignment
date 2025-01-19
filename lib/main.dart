import "package:assignment/business_logic/data/data_bloc.dart";
import "package:assignment/models/data/user_model.dart";
import "package:assignment/presentation/details_screen.dart";
import "package:assignment/presentation/home_screen.dart";
import "package:assignment/services/repositories/data_repository.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DataBloc(dataRepository: DataRepository()),
        ),
      ],
      child: MaterialApp.router(
        title: "Assignment App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: GoRouter(
          routes: [
            GoRoute(
                path: "/",
                builder: (context, state) => const HomeScreen(),
                routes: [
                  GoRoute(
                    path: "details",
                    builder: (context, state) =>
                        DetailsScreen(userData: (state.extra as User)),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
