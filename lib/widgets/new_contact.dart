import 'package:flutter/material.dart';
import '../helpers/format_datetime.dart';
import '../models/contact.dart';

class NewContact extends StatefulWidget {
  final void Function(Contact newContact) onContactCreated;
  final int id;

  const NewContact(
      {super.key, required this.onContactCreated, required this.id});

  @override
  State<NewContact> createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  var name = '';
  var surname = '';
  var phone = '';
  var email = '';
  DateTime _birthDate = DateTime(1);

  void _pickBirthDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _birthDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _birthDate =
            DateTime(pickedDate.year, pickedDate.month, pickedDate.day);
      });
    }
  }

  void onCanceled() {
    Navigator.pop(context);
  }

  void onSaved() {
    if (name.trim().isEmpty) return;
    final newContact = Contact(
      id: widget.id,
      name: name.trim(),
      surname: surname.trim(),
      phone: phone.trim(),
      email: email.trim(),
      birthDate: _birthDate,
    );
    widget.onContactCreated(newContact);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) => setState(() => name = value),
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  onChanged: (value) => setState(() => surname = value),
                  decoration: const InputDecoration(labelText: 'Surname'),
                ),
              ),
            ],
          ),
          TextField(
            onChanged: (value) => setState(() => phone = value),
            decoration: const InputDecoration(labelText: 'Phone'),
            keyboardType: TextInputType.phone,
          ),
          TextField(
            onChanged: (value) => setState(() => email = value),
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: _pickBirthDate,
              ),
              SizedBox(width: 8),
              Text('Birthday: ${formatDateTime(_birthDate)}'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: onCanceled,
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: name.trim().isEmpty ? null : onSaved,
                  child: const Text('Add'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
