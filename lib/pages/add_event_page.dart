import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  // global key for the form state (to validate the form)
  final _formKey = GlobalKey<FormState>();

// controller for the text fields (to get the values)
  final confNameEventCtrl = TextEditingController();
  final confNameAuthorCtrl = TextEditingController();

  String selectedEventType = "talk";
  DateTime selectedConfDate = DateTime.now();

  @override
  void dispose() {
    super.dispose();

    confNameAuthorCtrl.dispose();
    confNameEventCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                controller: confNameEventCtrl,
                decoration: const InputDecoration(
                  labelText: "Name of the event",
                  hintText: "Enter the name of the event",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "* Please enter a name of the event";
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                controller: confNameAuthorCtrl,
                decoration: const InputDecoration(
                  labelText: "Name of the author",
                  hintText: "Enter the name of the author",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "* Please enter a name for the author";
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'talk', child: Text('talk shaw')),
                  DropdownMenuItem(
                      value: 'code session', child: Text('code session')),
                  DropdownMenuItem(value: 'demo', child: Text('demo of code'))
                ],
                value: selectedEventType,
                onChanged: (value) {
                  setState(() {
                    selectedEventType = value.toString();
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: DateTimeFormField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.event_note),
                  labelText: 'choose a date',
                ),
                mode: DateTimeFieldPickerMode.dateAndTime,
                autovalidateMode: AutovalidateMode.always,
                validator: (e) =>
                    (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                onDateSelected: (DateTime value) {
                  setState(() {
                    selectedConfDate = value;
                  });
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final confNameEvent = confNameEventCtrl.text;
                    final confNameAuthor = confNameAuthorCtrl.text;

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Send in progress..."),
                      ),
                    );

                    print(
                        "confNameEvent: $confNameEvent et confNameAuthor: $confNameAuthor");
                    print("selectedEventType: $selectedEventType");
                    print("selectedConfDate: $selectedConfDate");
                  }
                },
                label: const Text("Save event"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
