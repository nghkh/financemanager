import 'package:flutter/material.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.wallet),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.task),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.people),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
