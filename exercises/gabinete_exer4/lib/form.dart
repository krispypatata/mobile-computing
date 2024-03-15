import 'package:flutter/material.dart';
import 'main.dart';

class FormSample extends StatefulWidget {
  FormSample({super.key});

  @override
  _FormSampleState createState() => _FormSampleState();
}

class _FormSampleState extends State<FormSample> {
  // for slider
  double _sliderValue = 1;

  static final List<String> _dropdownOptions = [
    "Makalipad",
    "Maging Invisible",
    "Mapaibig siya",
    "Mapabago ang isip niya",
    "Mapalimot siya",
    "Mabalik ang nakaraan",
    "Mapaghiwalay sila",
    "Makarma siya",
    "Mapasagasaan siya sa pison",
    "Mapaitim ang tuhod ng iniibig niya"
  ];

  static final Map<String, bool> _motto = {
    "Haters gonna hate": true,
    "Bakers gonna Bake": false,
    "If cannot be, borrow one from three": false,
    "Less is more, more or less": false,
    "Better late than sorry": false,
    "Don't talk to strangers when your mouth is full": false,
    "Let's burn the bridge when we get there": false
  };

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
      // print("Latest Value: ${_textFieldController.text}");
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topCenter,
            // 1st child: Normal Text (for title)
            child: const Padding(
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
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name",
                labelText: "Name",
                hintStyle: TextStyle(color: Colors.grey),
                labelStyle: TextStyle(color: Colors.grey),
              ),
              onChanged: (String value) {
                formValues["onChanged"] = value;
                // print(formValues["onChanged"]);
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
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nickname",
                labelText: "Nickname",
                hintStyle: TextStyle(color: Colors.grey),
                labelStyle: TextStyle(color: Colors.grey),
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
          // 4th child: Row (Age & Relationship)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 4a. Age
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Age",
                      labelText: "Age",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.grey),
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
              ),
              // 4b. Relationship
              const Flexible(
                flex: 3,
                child: Text(
                  "In a Relationship?",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Switch(
                    value: formValues["isChecked"],
                    onChanged: (bool value) {
                      setState(() {
                        formValues["isChecked"] = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          // 5th child: Text (Happiness Level)
          const Padding(
            padding: EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
            child: Text(
              "Happiness Level",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          // 6th child: Text (simple question)
          const Padding(
            padding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
            child: Text(
              "On a scale of 1-10, gaano kasaya ang adulting?",
              style: TextStyle(
                color: Colors.white,
                // fontWeight: FontWeight.bold,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          // 7th child: Slider
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Slider(
              value: _sliderValue,
              min: 1,
              max: 10,
              divisions: 9,
              onChanged: (newValue) {
                setState(() {
                  _sliderValue = newValue;
                });
              },
              label: _sliderValue.round().toString(),
            ),
          ),
          // 8th child: Text (Superpower)
          const Padding(
            padding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
            child: Text(
              "Superpower",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          // 8th child: Text (simple question)
          const Padding(
            padding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
            child: Text(
              "If you were to have a superpower, what would you choose?",
              style: TextStyle(
                color: Colors.white,
                // fontWeight: FontWeight.bold,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          // 9th child: Dropdown (options for superpower)
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: DropdownButtonFormField<String>(
              value: formValues["dropdownValue"],
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  formValues["dropdownValue"] = value!;
                });
              },
              dropdownColor: darkerBlue,
              items: _dropdownOptions.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  );
                },
              ).toList(),
              onSaved: (newValue) {
                // print("Dropdown onSaved method triggered");
              },
            ),
          ),
          // 10th child: Text (Favorite Motto)
          const Padding(
            padding: EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
            child: Text(
              "Motto",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          // 11th child: Radio (options for favorite motto)
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              children: _motto.entries.map<Widget>((entry) {
                // map each entry of the motto list into a RadioListTile
                // elements of the list will be the children of the Column widget
                return RadioListTile<bool>(
                  title: Text(
                    entry.key,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  value: entry.value,
                  groupValue: _motto.values.firstWhere((value) => value),
                  onChanged: (bool? value) {
                    setState(() {
                      // reset the values of all motto options to false
                      for (String key in _motto.keys) {
                        _motto[key] = false;
                      }

                      // set the value of the selected motto option to true
                      _motto[entry.key] = true;
                    });
                  },
                );
              }).toList(),
            ),
          ),
          // 12th child: ElevatedButton (Done)
          ElevatedButton(
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
            style: ElevatedButton.styleFrom(
              backgroundColor: customPurple,
            ),
            child: const Text(
              'Done',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          // 13th child: Divider
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
            child: Theme(
              data: ThemeData(
                dividerTheme: DividerThemeData(
                  thickness: 1,
                  color: Colors.grey.withOpacity(0.5), // change opacity
                ),
              ),
              child: const Divider(height: 0.1),
            ),
          ),
          // 14th child: ElevatedButton (Reset)
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            child: ElevatedButton(
              onPressed: () {
                // reset sliderValue
                _sliderValue = 1;

                // clear textfield controller
                _textFieldController.clear();

                // reset form values
                formValues = {
                  'onChanged': "",
                  'controller': "",
                  'isChecked': false,
                  'dropdownValue': _dropdownOptions.first,
                };

                // reset motto options
                for (String key in _motto.keys) {
                  _motto[key] = false;
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD46A6A),
              ),
              child: const Text(
                'Reset',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
