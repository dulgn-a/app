import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _count = 0;
  final List<int> _savedCounts = [];

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _resetCount() {
    setState(() {
      _count = 0;
    });
  }

  void _saveCount() {
    setState(() {
      _savedCounts.add(_count); // Add the current count to _savedCounts
      historyCounts.add(_count);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset('assets/images/counter.png'),
                Positioned(
                  top: 48,
                  left: 50,
                  width: 150,
                  child: Text(
                    '$_count',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 50,
                  right: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _incrementCount();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(40),
                    ),
                    child: const Text(''),
                  ),
                ),
                Positioned(
                  bottom: 148,
                  left: 160,
                  right: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _resetCount();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                      minimumSize: const Size(25, 25),
                    ),
                    child: const Text(''),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Positioned(
              bottom: 50, // Adjust the position as needed
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _saveCount();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/history');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      'History',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<int> historyCounts = [];

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count History'),
      ),
      body: ListView.builder(
        itemCount: historyCounts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Count: ${historyCounts[index]}'),
          );
        },
      ),
    );
  }
}
