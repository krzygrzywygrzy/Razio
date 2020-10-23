import 'package:flutter/material.dart';
import 'package:mental_health/const.dart';
import 'package:mental_health/redux/actions.dart';
import 'package:mental_health/services/private_notes_services.dart';

import '../main.dart';

class EditNote extends StatefulWidget {
  EditNote({this.index});
  final int index;
  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  String message;
  @override
  void initState() {
    message = store.state.privateNotes[widget.index].message;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kGradientBg,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffc9c9c9),
                          blurRadius: 5,
                          spreadRadius: 0.2,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, left: 16, right: 16, bottom: 30),
                          child: TextFormField(
                            initialValue:
                                store.state.privateNotes[widget.index].message,
                            cursorColor: Theme.of(context).primaryColor,
                            maxLines: null,
                            onChanged: (value) {
                              message = value;
                            },
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              hintText: "Twoja notatka",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 24,
                          right: 24,
                          child: GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  store.dispatch(
                                    EditPrivateNote(
                                        message: message, index: widget.index),
                                  );
                                },
                              );
                              PNotesServices.add(message, context);
                              Navigator.pop(context);
                            },
                            child: Text("Zapisz"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
