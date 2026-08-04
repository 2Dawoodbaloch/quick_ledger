import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GProfileInfoTile extends StatelessWidget {

  const GProfileInfoTile({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {

    return Card(

      child: ListTile(

        title: Text(title),

        subtitle: Text(value),

      ),
    );
  }
}