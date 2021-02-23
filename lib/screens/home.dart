import 'package:flutter/material.dart';
import '../widgets/theme_toggle.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  goToNew(context, destination) {
    print("Going to new entry page");
    if (destination == 'newJournalEntry') {
      Navigator.pushNamed(context, 'newJournalEntry');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dia Uno'),
        actions: [
          Builder(builder: (context) => IconButton(
              icon: Icon(Icons.settings), 
              onPressed: () => Scaffold.of(context).openEndDrawer()
            ),
          )
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Settings',
                style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                ),
              ),
            ),
            ThemeToggle()
          ],
        ),
      ),
      body: Center(child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome'),
            Icon(
              Icons.book,
              color: Colors.blue,
              size: 72.0
            )
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => goToNew(context, 'newJournalEntry'),
        tooltip: 'New Journal Entry',
        child: const Icon(Icons.add),
      ),
    );
  }
}