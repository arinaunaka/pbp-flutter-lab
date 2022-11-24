import 'package:flutter/material.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/model/budget.dart';

class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key});

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data Budget'),
        ),
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    children: ListBudget.budgetList.isNotEmpty
                        ? ListBudget.budgetList
                            .map((budget) => Card(
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.blue,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(budget.judul,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                "${budget.date.day}-${budget.date.month}-${budget.date.year}"),
                                          ],
                                        ),
                                        const SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(budget.nominal.toString()),
                                            Text(
                                              budget.jenis,
                                              style: TextStyle(
                                                  color: budget.jenis ==
                                                          "Pemasukan"
                                                      ? Colors.green
                                                      : Colors.red),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ))
                            .toList()
                        : [
                            Center(
                                child: Column(children: const [
                              Text(
                                "Belum ada data budget yang ditambahkan",
                                style: TextStyle(fontSize: 16),
                              ),
                            ]))
                          ]))));
  }
}
