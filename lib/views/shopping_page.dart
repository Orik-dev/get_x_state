import 'package:flutter/material.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    child: Text("data"),
                  );
                }),
          ),
          Text('Total amount: 0'),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
