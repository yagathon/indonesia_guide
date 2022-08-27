import 'package:flutter/material.dart';

showComingSoonSnackBar(BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Stay tuned, coming soon!')),
  );
}
