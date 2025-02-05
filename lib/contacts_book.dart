import 'package:flutter/material.dart';
import 'package:hw_28/screens/contacts_screen.dart';

import 'models/contact.dart';

class ContactsBook extends StatefulWidget {
  const ContactsBook({super.key});

  @override
  State<ContactsBook> createState() => _ContactsBookState();
}

class _ContactsBookState extends State<ContactsBook> {
  List<Contact> contacts = [
    Contact(name: 'Bill'),
    Contact(name: 'John', surname: 'Brown'),
  ];

  void toggleContact(int index) {}

  void deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact book'),
      ),
      body: ContactsScreen(
        contacts: contacts,
        onToggle: toggleContact,
        onDelete: deleteContact,
      ),
    );
  }
}
