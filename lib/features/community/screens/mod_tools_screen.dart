import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class ModToolsScreen extends StatelessWidget {
  const ModToolsScreen({
    super.key,
    required this.name,
  });

  final String name;

  void navigateToEditCommunity(BuildContext context) {
    Routemaster.of(context).push("/edit-community/$name");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mod Tools"),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.add_moderator),
            title: const Text("Add Moderators"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Edit Community"),
            onTap: () => navigateToEditCommunity(context),
          ),
        ],
      ),
    );
  }
}
