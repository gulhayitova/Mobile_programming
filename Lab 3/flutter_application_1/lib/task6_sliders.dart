import 'package:flutter/material.dart';

class SliderPickerScreen extends StatefulWidget {
  const SliderPickerScreen({Key? key}) : super(key: key);

  @override
  State<SliderPickerScreen> createState() => _SliderPickerScreenState();
}

class _SliderPickerScreenState extends State<SliderPickerScreen> {
  double volume = 50;
  String dateText = 'No date selected';

  // Exercise 6.2: open the date picker and show the chosen date
  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    // picked is null if the user pressed Cancel
    if (picked != null) {
      String day = picked.day.toString().padLeft(2, '0');
      String month = picked.month.toString().padLeft(2, '0');
      String year = picked.year.toString();
      setState(() {
        dateText = '$day/$month/$year';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 6: Sliders & Pickers')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Exercise 6.1: Volume slider
            const Icon(Icons.volume_up, size: 48),
            Text(
              'Volume: ${volume.round()}%',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: volume,
              min: 0,
              max: 100,
              divisions: 100,
              label: '${volume.round()}',
              onChanged: (value) {
                setState(() {
                  volume = value;
                });
              },
            ),
            const SizedBox(height: 32.0),

            // Exercise 6.2: Date picker button
            ElevatedButton(
              onPressed: pickDate,
              child: const Text('Pick a Date'),
            ),
            const SizedBox(height: 12.0),
            Text(dateText, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}