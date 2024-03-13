import 'package:flutter/material.dart';

class SavingsPage extends StatefulWidget {
  const SavingsPage({Key? key}) : super(key: key);

  @override
  _SavingsPageState createState() => _SavingsPageState();
}

class _SavingsPageState extends State<SavingsPage> {
  DateTime? _startDate;
  DateTime? _endDate;

  // Dummy data for saving history, replace with actual data
  List<Map<String, dynamic>> history = [
    {'date': '2022-03-01', 'amount': 100},
    {'date': '2022-03-05', 'amount': 150},
    {'date': '2022-03-10', 'amount': 200},
  ];

  List<Map<String, dynamic>> getFilteredHistory() {
    if (_startDate != null && _endDate != null) {
      return history.where((item) {
        final itemDate = DateTime.parse(item['date']);
        return itemDate.isAfter(_startDate!) && itemDate.isBefore(_endDate!);
      }).toList();
    }
    return history;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Savings History',
          textAlign: TextAlign.center,
        ),
        centerTitle: true, // Center the title in the AppBar
        backgroundColor: Colors.amberAccent, // AmberAccent color for the AppBar
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300], // Gray background color
                    borderRadius: BorderRadius.circular(10), // Rounded edges
                  ),
                  child: InkWell(
                    onTap: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: _startDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _startDate = pickedDate;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Start Date: ${_startDate?.toLocal() ?? 'Select start date'}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300], // Gray background color
                    borderRadius: BorderRadius.circular(10), // Rounded edges
                  ),
                  child: InkWell(
                    onTap: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: _endDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _endDate = pickedDate;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'End Date: ${_endDate?.toLocal() ?? 'Select end date'}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(), // Divider to separate date range from history
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) =>
                  const Divider(), // Divider between history items
              itemCount: getFilteredHistory().length,
              itemBuilder: (context, index) {
                final item = getFilteredHistory()[index];
                return ListTile(
                  title: Text('Date: ${item['date']}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Amount: \$${item['amount']}'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
