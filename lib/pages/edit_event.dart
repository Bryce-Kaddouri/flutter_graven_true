import 'package:flutter/material.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({
    super.key,
    required this.nameEvent,
    required this.author,
    required this.type,
    required this.date,
    required this.index,
    required this.callback,
  });

  @override
  State<EditEvent> createState() => _EditEventState();

  final String nameEvent;
  final String author;
  final String type;
  final String date;
  final int index;
  final Function callback;
}

class _EditEventState extends State<EditEvent> {
  final _formKey = GlobalKey<FormState>();
  late String _nameEvent;
  late String _author;
  late String _type;
  late String _date;

  @override
  void initState() {
    super.initState();
    _nameEvent = widget.nameEvent;
    _author = widget.author;
    _type = widget.type;
    _date = widget.date;
  }

  // controller for each text field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Event'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    initialValue: _nameEvent,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _nameEvent = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    initialValue: _author,
                    decoration: const InputDecoration(
                      hintText: 'Author',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _author = value;
                      });
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
                      DropdownMenuItem(
                          value: 'demo', child: Text('demo of code'))
                    ],
                    value: _type,
                    onChanged: (value) {
                      setState(() {
                        _type = value.toString();
                      });
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    initialValue: _date,
                    decoration: const InputDecoration(
                      hintText: 'Date',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _date = value;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.blue,

                          elevation: 5, // <-- Button size
                          side: const BorderSide(color: Colors.blue, width: 1),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState?.save();

                            // widget.callback(
                            //  _nameEvent,
                            // _author,
                            // _type,
                            // _date,
                            // widget.index,
                            //);

                            print(
                                '$_nameEvent, $_author, $_type, $_date, ${widget.index}');
                          }
                        },
                        child: const Text('Edit',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    // cancel button
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          shadowColor: Colors.red,
                          elevation: 5, // <-- Button size
                          side: const BorderSide(color: Colors.red, width: 1),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
