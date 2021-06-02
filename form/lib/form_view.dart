import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form/form_model.dart';
import 'package:form/form_controller.dart';

class FormView extends StatefulWidget {
  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _formKey = GlobalKey<FormState>();
  final controller = FormController();

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
                child: FutureBuilder(
                  future: controller.user,
                  builder: (context, snapshot) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        snapshot.data != null
                            ? Text(
                                'Welcome back #${snapshot.data.rowid} ${snapshot.data.name} ${snapshot.data.surname}')
                            : Container(),
                        TextFormField(
                          //initialValue: controller.user.name,
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
                            controller.updateName(value);
                          },
                        ),
                        TextFormField(
                          //initialValue: controller.user.surname,
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
                            controller.updateSurname(value);
                          },
                          onFieldSubmitted: (value) {
                            final isValid = _formKey.currentState
                                .validate(); // Valida os campos do formulário
                            if (isValid) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Welcome ${controller.name} ${controller.surname}',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            controller.saveUser();
                                            Navigator.of(context).pop();
                                          });
                                        },
                                        child: Text('Salvar'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        ),
                        SizedBox(height: size.height * 0.02),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  setState(() {
                                    controller.deleteUser(snapshot.data);
                                  });
                                },
                                icon: Icon(Icons.delete),
                                label: Text('Delete'),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  final isValid = _formKey.currentState
                                      .validate(); // Valida os campos do formulário
                                  if (isValid) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                            'Welcome ${controller.name} ${controller.surname}',
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  controller.saveUser();
                                                  Navigator.of(context).pop();
                                                });
                                              },
                                              child: Text('Salvar'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                                icon: Icon(Icons.check),
                                label: Text('Check'),
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
