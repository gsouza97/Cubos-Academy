import 'package:flutter/material.dart';
import 'package:pokemon/poke-controller.dart';
import 'package:pokemon/pokemon.dart';

class PokeView extends StatefulWidget {
  @override
  _PokeViewState createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {
  final controller = PokeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            FutureBuilder<Pokemon>(
              future: controller.pokemon,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.black,
                    ),
                  );
                }
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Image.network(
                        snapshot.data.imageUrl,
                        fit: BoxFit.cover,
                        height: 200,
                        width: 200,
                      ),
                      Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Name: '),
                                Text(snapshot.data.name.toUpperCase()),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Weight: '),
                                Text('${snapshot.data.weight} kg'),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error);
                }
                return Container();
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  controller.loadPokemon();
                });
              },
              child: Text('Clique aqui'),
            )
          ],
        ),
      ),
    );
  }
}
