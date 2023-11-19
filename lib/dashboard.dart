import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pratik Food App'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Today\'s Orders',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.orange,
                ),
              ),
              const SizedBox(height: 16.0),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Order #${index + 1}'),
                      subtitle: const Text('Customer Name'),
                      trailing: const Text('Delivered'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Recent Feedback',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.orange,
                ),
              ),
              const SizedBox(height: 16.0),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const Card(
                    child: ListTile(
                      title: Text('Customer Name'),
                      subtitle: Text('Great food and service!'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
