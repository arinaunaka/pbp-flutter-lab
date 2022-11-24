import 'package:flutter/material.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/model/budget.dart';
import 'package:flutter/services.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _judulController = TextEditingController();
  final _nominalController = TextEditingController();

  String judulBudget = "";
  int nominalBudget = 0;
  String jenisBudget = "Pilih Jenis";
  List<String> listJenisBudget = ['Pemasukan', 'Pengeluaran'];
  DateTime? dateBudget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ),
      drawer: const MyDrawer(),
      body: Form(
          key: _formKey,
          child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: _judulController,
                              decoration: InputDecoration(
                                labelText: "Judul",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  judulBudget = value!;
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  judulBudget = value!;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Judul budget tidak boleh kosong!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: _nominalController,
                              decoration: InputDecoration(
                                labelText: "Nominal",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (String? value) {
                                setState(() {
                                  nominalBudget = int.parse(value!);
                                });
                              },
                              onSaved: (String? value) {
                                setState(() {
                                  nominalBudget = int.parse(value!);
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nominal budget tidak boleh kosong!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            DropdownButtonFormField(
                              hint: Text(jenisBudget),
                              isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              elevation: 16,
                              items: listJenisBudget.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  jenisBudget = value!;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Jenis budget harus dipilih!';
                                }
                                return null;
                              },
                            ),
                          ])),
                  const SizedBox(height: 10),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2025),
                        ).then((value) {
                          setState(() {
                            dateBudget = value;
                          });
                        });
                      },
                      child: Text(dateBudget == null
                          ? "Pilih Tanggal"
                          : "${dateBudget!.day}-${dateBudget!.month}-${dateBudget!.year}"),
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            dateBudget != null) {
                          ListBudget.budgetList.add(Budget(judulBudget,
                              nominalBudget, jenisBudget, dateBudget!));
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 15,
                                child: ListView(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    const Center(
                                        child: Text(
                                      'Budget baru berhasil ditambahkan!',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                    const SizedBox(height: 20),
                                    Center(
                                      child: Column(children: [
                                        Text('Judul:  $judulBudget'),
                                        Text('Nominal:  $nominalBudget'),
                                        Text(
                                            'Tanggal: ${dateBudget!.day}-${dateBudget!.month}-${dateBudget!.year}'),
                                        Text(
                                          'Jenis: $jenisBudget',
                                          style: TextStyle(
                                              color: jenisBudget == "Pemasukan"
                                                  ? Colors.green
                                                  : Colors.red),
                                        ),
                                      ]),
                                    ),
                                    const SizedBox(height: 10),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          _judulController.clear();
                                          _nominalController.clear();
                                          jenisBudget = "Pilih Jenis";
                                          dateBudget = null;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Kembali'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                      child: const Text(
                        "Simpan",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}
