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
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "OK",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        );
      });
}

waitAllert(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Center(
      child: SizedBox(
        height: 60,
        width: 60,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(
            Theme.of(context).primaryColor,
          ),
        ),
      ),
    ),
  );
}
