import 'package:flutter/material.dart';

import '../models/contact.dart';

class ContactModal extends StatelessWidget {
  final Contact contact;
  const ContactModal({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bodyLargeStyle = theme.textTheme.bodyLarge!.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
    final bodyMediumStyle = theme.textTheme.bodyMedium!;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop()),
            ],
          ),
          const SizedBox(height: 10),
          if (contact.phone != null)
            Text(
              'Phone: ${contact.phone}',
              style: bodyMediumStyle,
            ),
          if (contact.email != null)
            Text(
              'Email: ${contact.email}',
              style: bodyMediumStyle,
            ),
          if (contact.birthDate != null)
            Text(
              'Birthday: ${contact.birthDate!.day}.${contact.birthDate!.month}.${contact.birthDate!.year}',
              style: bodyMediumStyle,
            ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
