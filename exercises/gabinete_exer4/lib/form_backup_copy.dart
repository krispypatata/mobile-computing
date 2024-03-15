import 'package:flutter/material.dart';
import 'main.dart';

class FormSample extends StatefulWidget {
  FormSample({super.key});

  @override
  _FormSampleState createState() => _FormSampleState();
}

class _FormSampleState extends State<FormSample> {
  final _formKey = GlobalKey<FormState>();

  // super power options
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

  // favorite motto options
  static final Map<String, bool> _motto = {
    "Haters gonna hate": true,
    "Bakers gonna Bake": false,
    "If cannot be, borrow one from three": false,
    "Less is more, more or less": false,
    "Better late than sorry": false,
    "Don't talk to strangers when your mouth is full": false,
    "Let's burn the bridge when we get there": false
  };

  // for form validation
  Map<String, dynamic> formValues = {
    'nameOnChanged': "",
    'nicknameOnChanged': "",
    'ageOnChanged': "",
    'isSwitchOn': false,
    'sliderValue': 1.0,
    'dropdownValue': _dropdownOptions.first,
    'radioValue': _motto.keys.first,
  };

  // text editing controllers (for resetting textfield values in the UI)
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  // dispose text editing controllers to avoid memory leaks
  @override
  void dispose() {
    _nameController.dispose();
    _nicknameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  // for visibility of the summary section
  bool _isSummaryVisible = false;

  // for summary section (so that the current form values will only be displayed when the done button is clicked and not every time the state of the app changes)
  Map<String, dynamic> doneValues = {
    'nameOnChanged': "",
    'nicknameOnChanged': "",
    'ageOnChanged': "",
    'isSwitchOn': false,
    'sliderValue': 1.0,
    'dropdownValue': _dropdownOptions.first,
    'radioValue': _motto.keys.first,
  };

  // method to update summary section display
  void updateSummary() {
    setState(() {
      _isSummaryVisible = true;
    });

    doneValues = {
      'nameOnChanged': formValues['nameOnChanged'],
      'nicknameOnChanged': formValues['nicknameOnChanged'],
      'ageOnChanged': formValues['ageOnChanged'],
      'isSwitchOn': formValues['isSwitchOn'],
      'sliderValue': formValues['sliderValue'],
      'dropdownValue': formValues['dropdownValue'],
      'radioValue': formValues['radioValue'],
    };
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 1st child: Normal Text (for title)
          Container(
            alignment: Alignment.topCenter,
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
          // 2nd child: Textfield (Name)
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: _nameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name",
                labelText: "Name",
                hintStyle: TextStyle(color: Colors.grey),
                labelStyle: TextStyle(color: Colors.grey),
              ),
              onChanged: (String value) {
                formValues["nameOnChanged"] = value;
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
          // 3rd child: Textfield (Nickname)
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: _nicknameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nickname",
                labelText: "Nickname",
                hintStyle: TextStyle(color: Colors.grey),
                labelStyle: TextStyle(color: Colors.grey),
              ),
              onChanged: (String value) {
                formValues["nicknameOnChanged"] = value;
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
          // 4th child: Row (Age & Relationship)
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 4a. Age
              Flexible(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 10, bottom: 10, right: 10),
                  child: TextFormField(
                    controller: _ageController,
                    keyboardType: TextInputType
                        .number, // (optional) - only shows numbers on on-touch keyboard
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Age",
                      labelText: "Age",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (String value) {
                      formValues["ageOnChanged"] = value;
                      // print(formValues["onChanged"]);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an integer';
                      } else {
                        // try to parse the value as integer
                        int? valueAsInt = int.tryParse(value);

                        // check if valid integer
                        if (valueAsInt == null) {
                          // parsing fails
                          return 'Only accepting integers';
                        }
                      }
                      return null;
                    },
                  ),
                ),
              ),
              // 4b. Relationship
              const Flexible(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 25),
                  child: Text(
                    "In a Relationship?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 0),
                  child: Switch(
                    value: formValues["isSwitchOn"],
                    onChanged: (bool value) {
                      setState(() {
                        formValues["isSwitchOn"] = value;
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
              value: formValues['sliderValue'].toDouble(),
              min: 1,
              max: 10,
              divisions: 9,
              onChanged: (newValue) {
                setState(() {
                  formValues['sliderValue'] = newValue;
                });
              },
              label: formValues['sliderValue'].round().toString(),
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
                  // update selected motto in the UI
                  value: true,
                  groupValue: formValues['radioValue'] == entry.key,
                  onChanged: (bool? value) {
                    setState(() {
                      // update the form value with the selected motto
                      formValues['radioValue'] = entry.key;
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
                updateSummary();
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
          // 14th child: Texts (Summary)
          Visibility(
            visible: _isSummaryVisible,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
              child: Column(children: [
                const Padding(
                  padding:
                      EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
                  child: Text(
                    "Summary",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Column(
                        children: [
                          Align(
                            alignment:
                                Alignment.centerLeft, // Set alignment to left
                            child: Text(
                              "Name \nNickname \nAge \nIs in a Relationship \nHappiness \nSuper Power \nMotto in Life",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Align(
                            alignment:
                                Alignment.centerLeft, // Set alignment to left
                            child: Text(
                              "${doneValues["nameOnChanged"]} \n${doneValues["nicknameOnChanged"]} \n${doneValues["ageOnChanged"]} \n${doneValues["isSwitchOn"]} \n${doneValues["sliderValue"]} \n${doneValues["dropdownValue"]} \n${doneValues["radioValue"]}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
          // 15th child: ElevatedButton (Reset)
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  // reset form values
                  formValues = {
                    'nameOnChanged': "",
                    'nicknameOnChanged': "",
                    'ageOnChanged': "",
                    'isSwitchOn': false,
                    'sliderValue': 1.0,
                    'dropdownValue': _dropdownOptions.first,
                    'radioValue': _motto.keys.first,
                  };

                  // reset motto options
                  for (String key in _motto.keys) {
                    _motto[key] = false;
                  }

                  // reset textfield contents in the UI
                  _nameController.text = "";
                  _nicknameController.text = "";
                  _ageController.text = "";

                  // hide the summary section
                  _isSummaryVisible = false;
                });
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
