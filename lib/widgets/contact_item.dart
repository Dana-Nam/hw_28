import 'package:flutter/material.dart';
import 'package:hw_28/models/contact.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const ContactItem({
    super.key,
    required this.contact,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bodyLargeStyle = theme.textTheme.bodyLarge!;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(contact.name, style: bodyLargeStyle),
              SizedBox(width: 8),
              if (contact.surname != null && contact.surname!.isNotEmpty)
                Text('${contact.surname}', style: bodyLargeStyle),
            ],
          ),
          Row(
            children: [
              if (contact.isBirthday)
                Icon(
                  Icons.cake,
                  color: Colors.yellowAccent,
                ),
              IconButton(
                icon: Icon(Icons.delete, color: theme.colorScheme.error),
                onPressed: onDelete,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
