import 'package:flutter/material.dart';

class InputFieldsSample extends StatefulWidget {
  InputFieldsSample({super.key});

  @override
  _InputFieldsSampleState createState() => _InputFieldsSampleState();
}

class _InputFieldsSampleState extends State<InputFieldsSample> {
  String _searchTerm = "";

  // controller
  final TextEditingController _searchController = TextEditingController();

  // for checkbox
  bool _isChecked = false;

  // for dropdown menu
  static final List<String> _dropdownOptions = [
    "One",
    "Two",
    "Three",
    "Four",
    "Five"
  ];
  String dropdownValue = _dropdownOptions.first;

  // for form
  final _formKey = GlobalKey<FormState>();
  // ===========================================================================================
  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      print("Latest Value: ${_searchController.text}");
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            // using onChanged
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter string",
                  labelText: "Using onChanged",
                ),
                onChanged: (String value) {
                  _searchTerm = value;
                  print(_searchTerm);
                },
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     showDialog(
            //       context: context,
            //       builder: (context) {
            //         return AlertDialog(
            //           content: Text(_searchTerm),
            //         );
            //       },
            //     );
            //   },
            //   child: const Text('Show text'),
            // ),
            // =======================================================================
            // using controller
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter string",
                    labelText: "Using Controller"),
                controller: _searchController,
              ),
            ),
            // checkbox (page 8)
            Checkbox(
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
            // dropdown menu
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
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
            ),

            // text widget
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(
                          "onChanged: $_searchTerm \nController: ${_searchController.text} \nCheckbox value: $_isChecked \nDropdown: ${dropdownValue}"),
                    );
                  },
                );
              },
              child: const Text('Show text'),
            ),
          ],
        ));
  }
}
