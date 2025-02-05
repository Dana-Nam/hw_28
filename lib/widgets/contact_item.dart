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
    final backgroundColor = theme.colorScheme.surface;
    final borderRadius = BorderRadius.circular(10);

    return Dismissible(
      key: ValueKey(contact.id),
      onDismissed: (direction) {
        onDelete();
      },
      background: Container(
        color: theme.colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      child: InkWell(
        onTap: onToggle,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(2, 4),
                blurRadius: 6,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('${contact.id}', style: bodyLargeStyle),
                  const SizedBox(width: 8),
                  Text(contact.name, style: bodyLargeStyle),
                  const SizedBox(width: 8),
                  if (contact.surname != null && contact.surname!.isNotEmpty)
                    Text('${contact.surname}', style: bodyLargeStyle),
                  const SizedBox(width: 4),
                  if (contact.isBirthday)
                    const Icon(
                      Icons.cake,
                      color: Colors.yellowAccent,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
