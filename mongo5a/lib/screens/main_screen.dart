import 'package:flutter/material.dart';
import 'package:mongo5a/screens/groups_screens.dart';
import 'package:mongo5a/screens/songs_screens.dart';
import 'package:mongo5a/widgets/theme.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias de Musica'),
      ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async{
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const GroupsScreen(),
                ),
              );
            },
            child: const Text('Grupo'),
          ),
            ElevatedButton(
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SongsScreens(),
                  ),
                );
              },
              child: const Text('Canciones'),
            ),
         ],
        ),
      ),
    );
  }
}