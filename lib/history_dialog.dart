import 'package:flutter/material.dart';

class HistoryDialog extends StatelessWidget {
  final List<String> records;
  final VoidCallback? onClear;

  const HistoryDialog({super.key, required this.records, this.onClear});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Dhikr History"),
      content: SizedBox(
        width: double.maxFinite,
        child: records.isEmpty
            ? const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "No history yet.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: records.length,
                itemBuilder: (context, index) {
                  // Show newest first
                  final record = records[records.length - 1 - index];
                  return ListTile(
                    leading: const Icon(Icons.history, size: 20),
                    title: Text(record, style: const TextStyle(fontSize: 14)),
                    dense: true,
                  );
                },
              ),
      ),
      actions: [
        if (records.isNotEmpty && onClear != null)
          TextButton(
            onPressed: onClear,
            child: const Text("Clear", style: TextStyle(color: Colors.red)),
          ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Close"),
        ),
      ],
    );
  }
}
