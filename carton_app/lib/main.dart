import 'package:flutter/material.dart';
import 'model/characters_data.dart';
import 'widgets/character_widget.dart';
import 'model/character.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 58, 183, 58)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Character> charactersList = List.from(characters);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carton App'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 3, 255, 238),
        toolbarHeight: 80.0,
      ),
      body: ListView(
        children: charactersList.map((character) {
          return Dismissible(
            key: Key(character.name),
            onDismissed: (direction) {
              setState(() {
                charactersList.remove(character);
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${character.name} eliminado')),
              );
            },
            background: Container(color: const Color.fromARGB(255, 2, 163, 243)),
            child: CharacterWidget(character: character),
          );
        }).toList(),
      ),
    );
  }
}
