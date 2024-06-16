import 'package:flutter/material.dart';
import 'package:flutter_bank_app/receipt.dart';

class Transaction {
  final String title;
  final IconData icon;
  final double amount;
  final String date;

  Transaction({
    required this.title,
    required this.icon,
    required this.amount,
    required this.date,
  });
}

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Receipt(transaction: transaction),
                ),
              );
            },
            leading: Icon(transaction.icon),
            title: Text(transaction.title),
            subtitle: Text(transaction.date),
            trailing: Text('\$${transaction.amount.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
