import 'package:flutter/material.dart';
import 'package:pokemon/circular-container-widget.dart';
import 'package:pokemon/poke-viewModel.dart';
import 'package:pokemon/pokemon.dart';

class PokeNewView extends StatefulWidget {
  @override
  _PokeNewViewState createState() => _PokeNewViewState();
}

class _PokeNewViewState extends State<PokeNewView> {
  final viewModel = PokeViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.loadPokemon();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Theme.of(context).accentColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Container(
              height: size.height * 0.7,
              child: StreamBuilder(
                stream: viewModel.pokemonStream.stream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.active) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    return Stack(
                      children: [
                        Align(
                          alignment: Alignment(0.0, 1.2),
                          child: Container(
                            height: size.height * 0.6,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 60),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                      '#${snapshot.data.id} ${snapshot.data.name.toString()[0].toUpperCase() + snapshot.data.name.toString().substring(1)}',
                                      style: Theme.of(context).textTheme.title),
                                  Text('Height: ${snapshot.data.height} m',
                                      style:
                                          Theme.of(context).textTheme.subtitle),
                                  Text('Weight: ${snapshot.data.weight} kg',
                                      style:
                                          Theme.of(context).textTheme.subtitle),
                                  Text('Type',
                                      style:
                                          Theme.of(context).textTheme.subtitle),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircularContainer(
                                          text:
                                              '${snapshot.data.type.toString()[0].toUpperCase() + snapshot.data.type.toString().substring(1)}'),
                                    ],
                                  ),
                                  Text('Abilities',
                                      style:
                                          Theme.of(context).textTheme.subtitle),
                                  Container(
                                    height: 95,
                                    width: 130,
                                    child: ListView.builder(
                                      padding: EdgeInsets.all(0),
                                      itemCount: snapshot.data.abilities.length,
                                      itemBuilder: (context, index) =>
                                          CircularContainer(
                                        text:
                                            '${snapshot.data.abilities[index].name.toString()[0].toUpperCase() + snapshot.data.abilities[index].name.toString().substring(1)}',
                                      ),
                                    ),
                                  ),
                                  //Row(
                                  //  mainAxisAlignment:
                                  //      MainAxisAlignment.spaceEvenly,
                                  //  children: snapshot.data.abilities
                                  //      .map(
                                  //        (index) => CircularContainer(
                                  //            text: '${index.name}'),
                                  //      )
                                  //      .toList(),
                                  //),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Theme.of(context).accentColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        viewModel.loadPokemon();
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      child: Text(
                                        'Next',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: size.height * 0.20,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                snapshot.data.imageUrl,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            snapshot.error,
                            style: TextStyle(color: Colors.white),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).accentColor,
                              ),
                            ),
                            onPressed: () {
                              viewModel.loadPokemon();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: Text(
                                'Next',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return TextButton(
                    onPressed: () {
                      viewModel.loadPokemon();
                    },
                    child: Text(
                      'Load Pokemon',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
