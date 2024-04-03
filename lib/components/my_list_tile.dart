import 'package:flutter/material.dart';

class MylistTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;

  const MylistTile({super.key,
    required this.text,
    required this.icon,
    this.onTap
  }
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.grey,
        ),
        title: Text(text),
        onTap: onTap,
      ),
    );
  }
}
