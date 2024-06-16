import 'package:flutter/material.dart';
import 'package:flutter_bank_app/transaction.dart';

class BankingHomeScreen extends StatelessWidget {
  const BankingHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions = [
      Transaction(
        title: 'Groceries',
        icon: Icons.shopping_cart,
        amount: 54.23,
        date: '2023-06-01',
      ),
      Transaction(
        title: 'Electricity Bill',
        icon: Icons.lightbulb,
        amount: 30.75,
        date: '2023-06-02',
      ),
      Transaction(
        title: 'Internet',
        icon: Icons.wifi,
        amount: 45.00,
        date: '2023-06-03',
      ),
      Transaction(
        title: 'Dinner',
        icon: Icons.restaurant,
        amount: 25.50,
        date: '2023-06-04',
      ),
      Transaction(
        title: 'Groceries',
        icon: Icons.shopping_cart,
        amount: 54.23,
        date: '2023-06-01',
      ),
      Transaction(
        title: 'Electricity Bill',
        icon: Icons.lightbulb,
        amount: 30.75,
        date: '2023-06-02',
      ),
      Transaction(
        title: 'Internet',
        icon: Icons.wifi,
        amount: 45.00,
        date: '2023-06-03',
      ),
      Transaction(
        title: 'Market',
        icon: Icons.restaurant,
        amount: 25.50,
        date: '2023-06-04',
      ),
      // Add more transactions here
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customAppBar(),
                  Center(child: masterCard()),
                  const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Transaction History',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TransactionList(transactions: transactions),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Center masterCard() {
    return Center(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        width: 400,
        height: 350,
        child: Stack(
          children: [
            // To ensure the stack itself is visible
            Center(
              child: Image.asset(
                'assets/visa.jpg',
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 100,
                  ),
                  child: Text(
                    'Balance: \$ 32,000.00',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 100,
                  ),
                  child: Text(
                    'Tech Bank',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const Center(
              child: Text(
                '\n1234 5678 3211 1231',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(top: 205, left: 110, child: monthYear())
          ],
        ),
      ),
    );
  }

  Row monthYear() {
    return const Row(
      children: [
        Text(
          'VALID \n THRU',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(
          Icons.arrow_right,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'MONTH/YEAR',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
            Text('12/2028',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                )),
          ],
        )
      ],
    );
  }

  Padding customAppBar() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Hello Ordained!',
            style: TextStyle(
                color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 70,
            width: 70,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color(0xFFFF8B66)),
            child: const Text(
              '😀',
              style: TextStyle(
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
