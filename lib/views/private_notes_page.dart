import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mental_health/components/interaction_components/ovalButton.dart';
import 'package:mental_health/const.dart';
import 'package:mental_health/main.dart';
import 'package:mental_health/models/date.dart';
import 'package:mental_health/models/primaryData.dart';
import 'package:mental_health/models/privateNote.dart';
import 'package:mental_health/redux/actions.dart';
import 'package:mental_health/views/edit_note.dart';

class PrivateNotesPage extends StatefulWidget {
  PrivateNotesPage({Key key}) : super(key: key);

  @override
  _PrivateNotesPageState createState() => _PrivateNotesPageState();
}

class _PrivateNotesPageState extends State<PrivateNotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: kGradientBg,
        child: SafeArea(
          child: StoreConnector<PrimaryData, PrimaryData>(
            converter: (store) => store.state,
            builder: (context, state) {
              if (state.privateNotes.length == 0) {
                return Container(
                  child: Center(
                    child: Text("Nie masz jeszcze notatek"),
                  ),
                );
              } else {
                return Container(
                  child: GridView.builder(
                    itemCount: state.privateNotes.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditNote(
                                        index: index,
                                      )));
                        },
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffc9c9c9),
                                    blurRadius: 5,
                                    spreadRadius: 0.2,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  state.privateNotes[index].message,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 8,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
      /////// floating action button
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffc9c9c9),
                        blurRadius: 5,
                        spreadRadius: 0.2,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            OvalButton(
              onTap: () {
                setState(() {
                  DateTime date = DateTime.now();
                  store.dispatch(
                    AddPrivateNote(
                      PrivateNote(
                        message: "",
                        creationDate: Date(
                          year: date.year,
                          month: date.month,
                          day: date.month,
                          hour: date.hour,
                          minute: date.minute,
                        ),
                      ),
                    ),
                  );
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditNote(
                            index: store.state.privateNotes.length - 1,
                          )),
                );
              },
              color: kFamButtonsColors[0],
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
