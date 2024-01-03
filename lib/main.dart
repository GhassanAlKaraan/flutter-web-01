// ignore_for_file: avoid_print

import 'package:daily_quote/constants.dart';
import 'package:daily_quote/service_class.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Map<String, dynamic>? map;
  bool loading = false;

  getData() async {
    loading = true;
    map = await ApiService.getMapData();
    print(map.toString()); //* working
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(kAppBarTitle),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                (loading)
                    ? const SizedBox(
                        height: 300,
                        width: 300,
                        child: CircularProgressIndicator(),
                      )
                    : Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Container(
                                width: 200,
                                height: 150,
                                alignment: Alignment.center,
                                child: Image.network(kLogoPath),
                                //Image.asset(kLogoPath),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(
                                // "${map!["email"]}",
                                "${map!["body"]}",
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        getData();
                      });
                    },
                    child: const Text(
                      "Roll",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
