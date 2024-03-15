import 'package:flutter/material.dart';

class FormSample extends StatefulWidget {
  FormSample({super.key});

  @override
  _FormSampleState createState() => _FormSampleState();
}

class _FormSampleState extends State<FormSample> {
  static final List<String> _dropdownOptions = [
    "One",
    "Two",
    "Three",
    "Four",
    "Five"
  ];

  Map<String, dynamic> formValues = {
    'onChanged': "",
    'controller': "",
    'isChecked': false,
    'dropdownValue': _dropdownOptions.first,
  };

  final TextEditingController _textFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      print("Latest Value: ${_textFieldController.text}");
    });
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 30),
              child: Text(
                "The Tita Slambook",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          // 2nd child: Name Textfield
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name",
                labelText: "Name",
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
              ),
              onChanged: (String value) {
                formValues["onChanged"] = value;
                print(formValues["onChanged"]);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),

          // 3rd child: Nickname Textfield
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nickname",
                labelText: "Nickname",
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
              ),
              controller: _textFieldController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),

          // checkbox
          FormField(
            builder: (FormFieldState<bool> state) {
              return Checkbox(
                value: formValues["isChecked"],
                onChanged: (bool? value) {
                  setState(() {
                    formValues["isChecked"] = value!;
                  });
                },
              );
            },
            onSaved: ((bool? value) {
              print("Checkbox onSaved method triggered");
            }),
          ),

          // Dropdown
          DropdownButtonFormField<String>(
            value: formValues["dropdownValue"],
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                formValues["dropdownValue"] = value!;
              });
            },
            items: _dropdownOptions.map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
            onSaved: (newValue) {
              print("Dropdown onSaved method triggered");
            },
          ),

          ElevatedButton(
            // onPressed: () {
            //   showDialog(
            //     context: context,
            //     builder: (context) {
            //       return AlertDialog(
            //         content: Text(
            //             "onChanged: ${formValues["onChanged"]} \nController: ${_textFieldController.text} \nCheckbox value: ${formValues["isChecked"]} \nDropdown value: ${formValues["dropdownValue"]}"),
            //       );
            //     },
            //   );
            // },
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState?.save();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(
                          "onChanged: ${formValues["onChanged"]} \nController: ${_textFieldController.text} \nCheckbox value: ${formValues["isChecked"]} \nDropdown value: ${formValues["dropdownValue"]}"),
                    );
                  },
                );
              }
            },

            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
