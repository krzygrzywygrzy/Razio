import 'package:flutter/material.dart';

allert(String message, BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Align(alignment: Alignment.center, child: Text("$message")),
          actions: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16, right: 16),
              child: Text(
                "OK",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        );
      });
}
