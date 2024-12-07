import 'package:flutter/material.dart';

class Destination {
  const Destination(this.icon, this.label);
  final IconData icon;
  final String label;
}

const List<Destination> destinations = <Destination>[
  Destination(Icons.person, 'Account'),
  Destination(Icons.pets, 'Adopt'),
  Destination(Icons.home, 'Home'),
  Destination(Icons.library_books_outlined, 'Our story'),
];