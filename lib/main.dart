import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:postest2_flutter_tazkia/controller/student_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Post Test 2 - Flutter - Tazkia',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF6F6F6),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    StudentController controller = Get.put(StudentController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF6F6F6),
        title: Text("Data Mahasiswa"),
      ),
      body: Obx(() => Container(
        margin: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index){
            return Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent.withOpacity(.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(controller.data[index]['nama'], style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                                  Row(
                                    children: [
                                      Text(controller.data[index]['jurusan'], style: TextStyle(
                                        fontSize: 16,
                                      )),
                                      Text(" - ", style: TextStyle(
                                        fontSize: 16,
                                      )),
                                      Text(controller.data[index]['angkatan'], style: TextStyle(
                                        fontSize: 16,
                                      )),
                                    ],
                                  ),

                                ],
                              ),
                            )
                        ),
                        Container(
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: (){
                                  print('Edit Data');

                                  controller.nameController.text = controller.data[index]['nama'];
                                  controller.angkatanController.text = controller.data[index]['angkatan'];
                                  controller.jurusanController.text = controller.data[index]['jurusan'];

                                  Get.defaultDialog(
                                      title: 'Add New Student',
                                      content: Column(
                                          children: [
                                            TextField(
                                                controller: controller.nameController,
                                                keyboardType: TextInputType.text,
                                                decoration: InputDecoration(
                                                    labelText: 'Name',
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(16)
                                                    )
                                                )
                                            ),
                                            SizedBox(height: 15.0),
                                            TextField(
                                                controller: controller.jurusanController,
                                                keyboardType: TextInputType.text,
                                                decoration: InputDecoration(
                                                    labelText: 'Jurusan',
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(16)
                                                    )
                                                )
                                            ),
                                            SizedBox(height: 15.0),
                                            TextField(
                                                controller: controller.angkatanController,
                                                keyboardType: TextInputType.number,
                                                decoration: InputDecoration(
                                                    labelText: 'Angkatan',
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(16)
                                                    )
                                                )
                                            ),
                                            SizedBox(height: 8.0),
                                          ]
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: (){
                                              print('cek');
                                              print(controller.nameController.text);
                                              controller.editData(index);
                                              Get.back();
                                            },
                                            child: Text("Edit Data")
                                        )
                                      ]
                                  );
                                },
                                icon: Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: (){
                                  print("hapus");
                                  controller.removeData(index);
                                },
                                icon: Icon(Icons.delete, color: Colors.red),
                              ),
                            ],
                          ),),
                      ],
                    ),
              );
            },
        ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print('Add New Data');

          controller.nameController.clear();
          controller.angkatanController.clear();
          controller.jurusanController.clear();

          Get.defaultDialog(
            title: 'Add New Student',
            content: Column(
              children: [
                TextField(
                  controller: controller.nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)
                    )
                  )
                ),
                SizedBox(height: 15.0),
                TextField(
                    controller: controller.jurusanController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Jurusan',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)
                        )
                    )
                ),
                SizedBox(height: 15.0),
                TextField(
                    controller: controller.angkatanController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Angkatan',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)
                        )
                    )
                ),
                SizedBox(height: 8.0),
              ]
            ),
              actions: [
                ElevatedButton(
                  onPressed: (){
                      print('cek');
                      print(controller.nameController.text);
                      controller.addData();
                      Get.back();
                  },
                    child: Text("Save Data")
                )
            ]
          );
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
