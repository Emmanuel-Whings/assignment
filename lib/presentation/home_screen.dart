import "package:assignment/business_logic/data/data_bloc.dart";
import "package:assignment/models/data/user_model.dart";
import "package:assignment/presentation/components/center_component.dart";
import "package:assignment/presentation/components/custom_refresh_indicator_component.dart";
import "package:assignment/presentation/components/status_indicator_component.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DataBloc>().add(LoadEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Users",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          BlocBuilder<DataBloc, DataState>(builder: (context, state) {
            return IconButton(
              onPressed: state is! AvailableState ? null : () {},
              style: IconButton.styleFrom(
                  foregroundColor: Colors.white,
                  disabledForegroundColor: Colors.white.withOpacity(0.5)),
              icon: const Icon(
                Icons.filter_alt_outlined,
              ),
            );
          }),
        ],
      ),
      body:
          BlocBuilder<DataBloc, DataState>(builder: (context, DataState state) {
        switch (state.runtimeType) {
          case LoadingState:
            return Center(
              child: CenterComponent(
                children: [
                  const SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                  Text((state as LoadingState).message),
                ],
              ),
            );
          case ErrorState:
            return CustomRefreshIndicatorComponent(
              callback: () async {
                context.read<DataBloc>().add(LoadEvent());
              },
              child: StatusIndicatorComponent(
                message: (state as ErrorState).message,
                icon: Icons.error,
              ),
            );
          case EmptyState:
            return CustomRefreshIndicatorComponent(
              callback: () async {
                context.read<DataBloc>().add(LoadEvent());
              },
              child: StatusIndicatorComponent(
                message: (state as EmptyState).message,
                icon: Icons.inbox,
              ),
            );
          case AvailableState:
            List<User> users = (state as AvailableState).data;
            return RefreshIndicator(
              onRefresh: () async {
                context.read<DataBloc>().add(LoadEvent());
              },
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) => Card(
                  elevation: 2,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    onTap: () => context.go("/details", extra: users[index]),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: CircleAvatar(
                      radius: 24,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Text(
                        users[index].name[0].toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    title: Text(
                      users[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      users[index].email,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 1),
                itemCount: users.length,
              ),
            );
          default:
            return Container();
        }
      }),
    );
  }
}
