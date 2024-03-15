import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactListProvider extends ChangeNotifier {
  List<mainContact> contacts = [];

  void loadContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final contactsData = prefs.getStringList('contacts');

    if (contactsData != null) {
      contacts = contactsData.map((data) {
        final parts = data.split(',');
        return mainContact(parts[0], parts[1], parts[2]);
      }).toList();
      notifyListeners();
    }
  }

  void addContact(mainContact newContact) {
    contacts.add(newContact);
    saveContacts();
    notifyListeners();
  }

  void updateContact(int index, mainContact updatedContact) {
    contacts[index] = updatedContact;
    saveContacts();
    notifyListeners();
  }

  void deleteContact(int index) {
    contacts.removeAt(index);
    saveContacts();
    notifyListeners();
  }

  void saveContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final contactsData = contacts.map((contact) {
      return '${contact.name},${contact.phoneNumber},${contact.lastname}';
    }).toList();
    prefs.setStringList('contacts', contactsData);
  }
}

class mainContact {
  String name;
  String phoneNumber;
  String lastname;

  mainContact(this.name, this.phoneNumber, this.lastname);
}
