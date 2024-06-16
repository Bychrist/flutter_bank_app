import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bank_app/transaction.dart';
import 'package:intl/intl.dart';

class Receipt extends StatelessWidget {
  final Transaction transaction;
  const Receipt({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();

    String formattedTime = DateFormat('HH:mm').format(now);
    return Scaffold(
      backgroundColor: const Color.fromARGB(251, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 220, 219, 218),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            logoDot(),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                '${transaction.date}  $formattedTime',
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            receipt(),
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                '\n Details',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18),
              ),
            ),
            titleData(),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SimilarData(
                      text: '077811509',
                      title: 'Account Debited',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SimilarData(
                      text: transaction.title,
                      title: 'Beneficiary',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SimilarData(
                      text: '\$${transaction.amount.toString()}',
                      title: 'Amount',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const SimilarData(
                      text: 'Lorem ipsum dolor sit amet, malorum ',
                      title: 'Remark',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding titleData() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(13, 0, 0, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            '${transaction.title} \n Lorem ipsum dolor sit amet, malorum utroque cu ius, invenire hendrerit',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Padding receipt() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(13, 13, 0, 0),
      child: Container(
        width: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(91, 255, 193, 7)),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.file_copy),
              color: const Color.fromARGB(255, 213, 163, 14),
            ),
            const Text(
              'Receipt',
              style: TextStyle(
                  color: Color.fromARGB(255, 213, 163, 14),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

Row logoDot() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Icon(
        Icons.more_horiz_rounded,
        size: 66,
        color: Colors.black,
      ),
      Container(
        width: 80,
        height: 80,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: const Center(
          child: Icon(
            Icons.contact_emergency_rounded,
            size: 40,
            color: Colors.amber,
          ),
        ),
      )
    ],
  );
}

class SimilarData extends StatelessWidget {
  final String title;
  final String text;
  const SimilarData({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    final String getTitle = title;
    final String getText = text;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          overflow: TextOverflow.ellipsis,
          getTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
          child: Text(
            overflow: TextOverflow.ellipsis,
            getText,
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}
