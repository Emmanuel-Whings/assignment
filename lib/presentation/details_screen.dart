import "package:assignment/models/data/user_model.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class DetailsScreen extends StatelessWidget {
  final User userData;
  const DetailsScreen({super.key, required this.userData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Details",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userData.name),
            Text(userData.email),
            Text(userData.bio),
          ],
        ),
      ),
    );
  }
}
