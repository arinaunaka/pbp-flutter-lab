import 'package:flutter/material.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/page/drawer.dart';

class MyWatchListDetail extends StatelessWidget {
  const MyWatchListDetail({super.key, required this.mwl});

  final MyWatchList mwl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      drawer: const MyDrawer(),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(mwl.fields.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold)),
                ),
                Row(
                  children: [
                    const Text('Release Date: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(mwl.fields.releaseDate),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text('Rating: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${mwl.fields.rating}/5'),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text('Status: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(mwl.fields.watched ? 'watched' : 'not watched'),
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Review: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(mwl.fields.review),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Back",
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
