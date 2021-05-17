import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _surname;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Container(
          height: size.height * 0.4,
          width: size.width * 0.75,
          child: Card(
            elevation: 15,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Name',
                      ),
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please fill in this field with your name';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        _name = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        hintText: 'Last Name',
                      ),
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please fill in this field with your last name';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _surname = value;
                      },
                      onFieldSubmitted: (value) {
                        final isValid = _formKey.currentState
                            .validate(); // Valida os campos do formulário
                        if (isValid) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Welcome $_name $_surname'),
                              );
                            },
                          );
                        }
                      },
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        final isValid = _formKey.currentState
                            .validate(); // Valida os campos do formulário
                        if (isValid) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Welcome $_name $_surname'),
                              );
                            },
                          );
                        }
                      },
                      icon: Icon(Icons.check),
                      label: Text('Check'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
