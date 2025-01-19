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
              onPressed: state.runtimeType != AvailableState ? null : () {},
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
          case const (LoadingState):
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
          case const (ErrorState):
            return CustomRefreshIndicatorComponent(
                callback: () async {
                  context.read<DataBloc>().add(LoadEvent());
                },
                child: StatusIndicatorComponent(
                  message: (state as ErrorState).message,
                  icon: Icons.error,
                ));
          case const (EmptyState):
            return CustomRefreshIndicatorComponent(
                callback: () async {
                  context.read<DataBloc>().add(LoadEvent());
                },
                child: StatusIndicatorComponent(
                  message: (state as EmptyState).message,
                  icon: Icons.inbox,
                ));
          case const (AvailableState):
            List<User> users = (state as AvailableState).data;
            return RefreshIndicator(
              onRefresh: () async {
                context.read<DataBloc>().add(LoadEvent());
              },
              child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ListTile(
                        onTap: () =>
                            context.go("/details", extra: users[index]),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                        leading: Icon(
                          Icons.account_circle,
                          size: 48,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        title: Text(users[index].name),
                        subtitle: Text(users[index].email),
                      ),
                  separatorBuilder: (context, index) => const Divider(
                        height: 1,
                      ),
                  itemCount: users.length),
            );
          default:
            return Container();
        }
      }),
    );
  }
}
