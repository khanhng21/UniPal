import 'package:flutter/material.dart';

// This page is a file for managing a list of dropdown menus for 50 states.
// In the file that creates the dropdown menu it is used like this:
// child: StateDropdown(
// 　　onChanged: (state) {
// 　　　　setState(() {
// 　　　　　　selectedState = state;
// 　　　　});
// 　},
// ),

class StateDropdown extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const StateDropdown({Key? key, required this.onChanged}) : super(key: key);

  @override
  _StateDropdownState createState() => _StateDropdownState();
}

class _StateDropdownState extends State<StateDropdown> {
  //Todo: Change the State when connect with database. It is depend on the each user's location.
  String selectedState = 'Alabama';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedState,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      // make box border. not underline.
      borderRadius: BorderRadius.circular(5),
      onChanged: (String? newValue) {
        setState(() {
          selectedState = newValue!;
          widget.onChanged(selectedState);
        });
      },
      items: <String>[
        'Alabama',
        'Alaska',
        'Arizona',
        'Arkansas',
        'California',
        'Colorado',
        'Connecticut',
        'Delaware',
        'Florida',
        'Georgia',
        'Hawaii',
        'Idaho',
        'Illinois',
        'Indiana',
        'Iowa',
        'Kansas',
        'Kentucky',
        'Louisiana',
        'Maine',
        'Maryland',
        'Massachusetts',
        'Michigan',
        'Minnesota',
        'Mississippi',
        'Missouri',
        'Montana',
        'Nebraska',
        'Nevada',
        'New Hampshire',
        'New Jersey',
        'New Mexico',
        'New York',
        'North Carolina',
        'North Dakota',
        'Ohio',
        'Oklahoma',
        'Oregon',
        'Pennsylvania',
        'Rhode Island',
        'South Carolina',
        'South Dakota',
        'Tennessee',
        'Texas',
        'Utah',
        'Vermont',
        'Virginia',
        'Washington',
        'West Virginia',
        'Wisconsin',
        'Wyoming'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}