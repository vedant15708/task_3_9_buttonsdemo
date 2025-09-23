import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Button Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ButtonDemo(),
    );
  }
}

class ButtonDemo extends StatefulWidget {
  const ButtonDemo({super.key});

  @override
  _ButtonDemoState createState() => _ButtonDemoState();
}

class _ButtonDemoState extends State<ButtonDemo> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Buttons Demo"),
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Flat / Text Button
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    foregroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    print("Flat/Text Button Pressed");
                  },
                  child: const Text("Flat (Text) Button"),
                ),
              ),
              const SizedBox(height: 12),

              // Raised / Elevated Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  print("Raised/Elevated Button Pressed");
                },
                child: const Text("Raised (Elevated) Button"),
              ),
              const SizedBox(height: 12),

              // Outlined Button
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  side: const BorderSide(color: Colors.deepPurple, width: 2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  print("Outline Button Pressed");
                },
                child: const Text("Outline Button"),
              ),
              const SizedBox(height: 12),

              Center(
                child: IconButton(
                  icon: const Icon(Icons.star, color: Colors.amber, size: 40),
                  onPressed: () {
                    print("Icon Button Pressed");
                  },
                ),
              ),
              const SizedBox(height: 12),

              InkWell(
                borderRadius: BorderRadius.circular(12),
                splashColor: Colors.orange.withOpacity(0.3),
                onTap: () {
                  print("InkWell Tapped");
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "InkWell Button",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  isExpanded: true,
                  underline: const SizedBox(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                    print("Selected: $newValue");
                  },
                  items: <String>['One', 'Two', 'Three']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 12),

              // Popup Menu Button
              PopupMenuButton<String>(
                color: Colors.white,
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                onSelected: (value) {
                  print("Selected: $value");
                },
                itemBuilder: (BuildContext context) {
                  return ['Option 1', 'Option 2', 'Option 3']
                      .map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "Popup Menu Button",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          print("Floating Action Button Pressed");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
