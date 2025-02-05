import 'package:flutter/material.dart';
import 'package:hw_28/widgets/contact_item.dart';

import '../models/contact.dart';

class ContactsScreen extends StatelessWidget {
  final List<Contact> contacts;
  final void Function(int index) onToggle;
  final void Function(int index) onDelete;

  const ContactsScreen(
      {super.key,
      required this.contacts,
      required this.onToggle,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: contacts
            .map((contact) => ContactItem(
                  contact: contact,
                  onToggle: () => onToggle(contacts.indexOf(contact)),
                  onDelete: () => onDelete(contacts.indexOf(contact)),
                ))
            .toList(),
      ),
    );
  }
}
