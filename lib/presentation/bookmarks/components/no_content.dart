import 'package:flutter/material.dart';

class NoContent extends StatelessWidget {
  const NoContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No Content',
        style: TextStyle(
          fontSize: 26.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
