import 'package:flutter/material.dart';
import 'package:hw_28/screens/contacts_screen.dart';
import 'package:hw_28/widgets/new_contact.dart';

import 'models/contact.dart';

class ContactsBook extends StatefulWidget {
  const ContactsBook({super.key});

  @override
  State<ContactsBook> createState() => _ContactsBookState();
}

class _ContactsBookState extends State<ContactsBook> {
  List<Contact> contacts = [
    Contact(
        id: 1, name: 'John', surname: 'Brown', birthDate: DateTime(2025, 2, 5)),
    Contact(id: 2, name: 'Dana')
  ];

  void toggleContact(int index) {}

  void deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  void addContact(Contact newContact) {
    setState(() {
      contacts.add(newContact);
    });
  }

  void openAddContact() {
    int nextId;
    if (contacts.isEmpty) {
      nextId = 1;
    } else {
      int maxId = contacts.first.id;
      for (var contact in contacts) {
        if (contact.id > maxId) {
          maxId = contact.id;
        }
      }
      nextId = maxId + 1;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
        child: Wrap(
          children: [
            NewContact(
              onContactCreated: addContact,
              id: nextId,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Book'),
        actions: [
          IconButton(
            onPressed: openAddContact,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ContactsScreen(
        contacts: contacts,
        onToggle: toggleContact,
        onDelete: deleteContact,
      ),
    );
  }
}
