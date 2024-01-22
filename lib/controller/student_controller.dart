import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class StudentController extends GetxController{
  TextEditingController nameController = TextEditingController();
  TextEditingController jurusanController = TextEditingController();
  TextEditingController angkatanController = TextEditingController();

  RxInt angka = 0.obs;
  RxList<dynamic> data = <dynamic>[
    {
      "nama": "Tazkia",
      "jurusan": "Biologi",
      "angkatan" : "2018"
    },
    {
      "nama": "Nave",
      "jurusan": "Informatika",
      "angkatan" : "2015"
    },
  ].obs;

  void addData() {
    data.add({
      "nama":nameController.text,
      "angkatan":angkatanController.text,
      "jurusan": jurusanController.text,
    });
  }

  void removeData(index){
    data.removeAt(index);
  }

  void editData(index){
    data[index] ={
      "nama": nameController.text,
      "angkatan": angkatanController.text,
      "jurusan": jurusanController.text,
    };
  }
}