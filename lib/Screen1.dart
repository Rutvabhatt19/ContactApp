

import 'package:contactapp/Contactmodal.dart';
import 'package:contactapp/Screen3.dart';
import 'package:contactapp/Screen4.dart';
import 'package:contactapp/Stepmodal.dart';
import 'package:contactapp/Thememodal.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';


class ContactListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContactListScreenState();
  }

}
class ContactListScreenState extends State<ContactListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ContactListProvider>(context, listen: false).loadContacts();
    Provider.of<step>(context,listen: false).savedata();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeNotifiter, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff68907A),
          title: Text(
            'Contcts',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder:(context) => Settings(), ));
            }, icon: Icon(Icons.settings,color: Colors.white,)),
          ],
        ),
        body: Consumer<ContactListProvider>(
          builder: (context, provider, child) {
            final contacts = provider.contacts;
            return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile(
                  title: Text(
                      "${contact.name}  ${contact.lastname}"
                  ),
                  subtitle: Text(
                    contact.phoneNumber,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Color(0xff68907A),
                    child: Icon(Icons.person,color: Colors.grey,size: 20,),
                  ),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: TextButton.icon(
                          label: Text(
                            'Edit',
                            style: TextStyle(
                              color: Colors.black,
                            ),),
                          icon: Icon(Icons.edit,color: Colors.black,),
                          onPressed: () async {
                            final editedContact = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditContactScreen(index: index),
                                settings: RouteSettings(
                                  arguments: contact,
                                ),
                              ),
                            );
                            if (editedContact != null) {
                              provider.updateContact(index, editedContact as mainContact);
                            }
                          },
                        ),
                      ),
                      PopupMenuItem(
                        child: TextButton.icon(
                          label: Text(
                            'Delete',
                            style: TextStyle(
                              color: Colors.black,
                            ),),
                          icon: Icon(Icons.delete,color: Colors.black,),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                      'Delete Contact'
                                  ),
                                  content: Text(
                                      'Are you sure you want to delete this contact?'
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () async{
                                         provider.deleteContact(index);
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Delete'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff68907A),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: () {
            Navigator.pushNamed(context, '/addContact').then((newContact) {
              if (newContact != null) {
                Provider.of<ContactListProvider>(context, listen: false).addContact(newContact as mainContact);
              }
            });
          },
          child: Icon(Icons.add),
        ),
      );
    },);
  }
}

