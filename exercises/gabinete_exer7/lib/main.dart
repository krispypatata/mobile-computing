import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterContactsExample(),
    );
  }
}

class FlutterContactsExample extends StatefulWidget {
  const FlutterContactsExample({super.key});

  @override
  State<FlutterContactsExample> createState() => _FlutterContactsExampleState();
}

class _FlutterContactsExampleState extends State<FlutterContactsExample> {
  List<Contact>? _contacts;
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  void initialize() {
    FlutterContacts.addListener(() => _fetchContacts());
    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      var contacts = await FlutterContacts.getContacts();
      setState(() => _contacts = contacts);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Own Contacts Book')),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FormPage()), // Navigate to the form page
          ).then((_) =>
              _fetchContacts()); // Refresh contacts after form page is popped;
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _body() {
    if (_permissionDenied) {
      return const Center(child: Text('Permission denied'));
    }
    if (_contacts == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
        itemCount: _contacts!.length,
        itemBuilder: (context, i) => ListTile(
            title: Text(_contacts![i].displayName),
            onTap: () async {
              final fullContact =
                  await FlutterContacts.getContact(_contacts![i].id);
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ContactPage(fullContact!),
                  ),
                ).then((_) =>
                    _fetchContacts()); // Refresh contacts after form page is popped;
              }
            }));
  }
}

// Page for viewing contact info
// delete info is also implemented here
class ContactPage extends StatelessWidget {
  final Contact contact;
  const ContactPage(this.contact, {super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(contact.displayName)),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('First name: ${contact.name.first}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Last name: ${contact.name.last}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Phone number: ${contact.phones.isNotEmpty ? contact.phones.first.number : '(none)'}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Email address: ${contact.emails.isNotEmpty ? contact.emails.first.address : '(none)'}'),
            ),
            Center(
              // Center the button horizontally
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    // Implement delete functionality here
                    await contact.delete();
                    Navigator.pop(context); // Navigate back after deletion
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => FlutterContactsExample()),
                    // );
                  },
                  child: Text('Delete'),
                ),
              ),
            ),
          ]),
        ),
      );
}

// Page for adding a contact
class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailAddressController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _emailAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter first name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter last name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailAddressController,
                decoration: InputDecoration(labelText: 'Email Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email address (optional)';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, proceed to save the contact

                      // Insert new contact
                      final newContact = Contact()
                        ..name.first = _firstNameController.text
                        ..name.last = _lastNameController.text
                        ..phones = [Phone(_phoneNumberController.text)];
                      await newContact.insert();

                      // Navigate back to the previous screen
                      // _fetchContacts();
                      Navigator.pop(context);
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => FlutterContactsExample()),
                      // );
                    }
                  },
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
