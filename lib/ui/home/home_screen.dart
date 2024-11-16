import 'package:apiexample/models/product_model.dart';
import 'package:apiexample/services/api_service.dart';
import 'package:apiexample/ui/home/widgets/cart_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<ProductModel> products = [];


  @override
  void initState() {
    fetchData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: RefreshIndicator(
        onRefresh: () => fetchData(),
        child: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisExtent: 250,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10
          ),
          itemCount: products.length,
          itemBuilder: (context, index) => CartWidget(model: products[index]),
        ),
      ),
    );
  }


  Future fetchData() async {
    Response? response = await ApiService().GET(ApiService.PRODUCTS);
    List list = response!.data;
    products = list.map((e) => ProductModel.fromJson(e),).toList();
    setState(() {});
  }

}
