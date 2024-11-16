import 'package:apiexample/models/product_model.dart';
import 'package:apiexample/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductDataScreen extends StatefulWidget {
  final ProductModel model;
  const ProductDataScreen({super.key, required this.model});

  @override
  State<ProductDataScreen> createState() => _ProductDataScreenState();
}

class _ProductDataScreenState extends State<ProductDataScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  ProductModel model = ProductModel();

  @override
  void initState() {
    initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mahsulot haqida"),
        actions: [
          IconButton(
            onPressed: () => deleteProduct(),
            icon: Icon(CupertinoIcons.delete,color: Colors.red,),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: model.id!,
              child: Image.network(model.image!,height: 300,width: double.infinity,),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: title,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Nomi")
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: description,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Haqida")
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: price,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Narxi")
                    ),
                  ),
                  const SizedBox(height: 50,),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 44,
                    onPressed: () => editProduct(),
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: const Text("Tahrirlash",style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }





  void initial() {
    model = widget.model;
    description.text = model.description!;
    title.text = model.name!;
    price.text = model.price!;
  }

  void editProduct() async {
    ProductModel editedData = model;
    editedData.name = title.text.trim();
    editedData.price = price.text.trim();
    editedData.description = description.text.trim();

    Response? response =  await ApiService().PUT(ApiService.PRODUCT+model.id!, editedData.toJson());
    if(response!=null) print("Malumotlar tahrirlandi");
  }

  void deleteProduct() async {
    Response? response =  await ApiService().DEL(ApiService.PRODUCT+model.id!);
    if(response!=null) {
      print("Mahsulot o'chdi");
      Navigator.pop(context);
    }
  }


}

