import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslim_counter_app/action_button.dart';
import 'package:muslim_counter_app/gesture_detector.dart';
import 'package:muslim_counter_app/history_dialog.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<String> _history = [];

  int _selectedIndex = 0;

  void _addToHistory() {
    final now = DateTime.now();
    final timeString = "${now.hour}:${now.minute.toString().padLeft(2, '0')}";
    _history.add("Completed 33 adhkaar at $timeString");
  }

  void _incrementCounter() {
    setState(() {
      _counter++;

      HapticFeedback.lightImpact(); // Add light haptic for every count

      if (_counter % 33 == 0) {
        HapticFeedback.heavyImpact(); // Add heavy haptic for cycle completion
        _addToHistory();
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Congratulations!"),
              content: const Text("You have completed 33 adhkaar!"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }
      if (_counter == 100 && _counter > 0) {
        _counter = 0;
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      // Ensure specific dark background from screenshot
      backgroundColor: const Color.fromARGB(255, 20, 24, 27),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 2,
        leading: Icon(Icons.menu, color: colors.primary),
        title: Text(
          "Digital Tasbih",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
            color: Colors.white.withOpacity(0.9),
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined, color: colors.primary),
            onPressed: () {
              ;
            },
          ),
        ],
      ),

      body: Column(
        children: [
          const Spacer(),

          // MAIN CIRCULAR COUNTER
          CounterGestureDetector(counter: _counter, onTap: _incrementCounter),

          const Spacer(),

          // CONTROL BUTTONS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(label: "Reset", onTap: _resetCounter),
                const SizedBox(width: 20),
                ActionButton(
                  label: "History",
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => HistoryDialog(
                        records: _history,
                        onClear: () {
                          setState(() {
                            _history.clear();
                          });
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          const Spacer(),
        ],
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 10, 30, 20),
        selectedItemColor: colors.primary,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.nightlight_round),
            label: 'Mode',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
