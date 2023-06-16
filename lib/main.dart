import 'package:flutter/material.dart';
import 'package:test_task_api/model.dart';
import 'package:test_task_api/network_manager.dart';


void main() {
  runApp(
    const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final networkManager = const NetworkManager();
  List<Info> ? data ;

  @override
  void initState() {
    super.initState();
    networkManager.getData().then(
          (value) { setState(() => data = value);
            
            }
        );
     
  }

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        body: Center(
         child: ListView.builder( itemCount: 10, 
        
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  
                  color: Colors.grey.shade200,
                  child: Column(children: [Row(
                    children: [Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(" Имя : ${data![index].name}"),
                            Text(" Город : ${data![index].city}"),
                            Text(" № заказа : ${data![index].offerID}"),
                            Text(" Статус платежа : ${data![index].paymentStatus}"),
                            Text(" Имя статуса : ${data![index].statusName}"),
                          ],
                        )),
                    )],
                  )],),
                ),
              ),
            ],
          );
        } ),
        ),
      ),
    );
  }
}
