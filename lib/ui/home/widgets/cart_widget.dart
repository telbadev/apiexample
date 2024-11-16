import 'package:apiexample/models/product_model.dart';
import 'package:apiexample/ui/product_data/product_data_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  final ProductModel model;
  const CartWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => ProductDataScreen(model: model),)),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.23),
                  blurRadius: 5,
                  spreadRadius: 2.5
              ),
            ]
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: model.id!,
              child: Image.network(model.image!,fit: BoxFit.cover,width: double.infinity,),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.name!,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 15),maxLines: 1,),
                    Text("${model.price!}\$",style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                    Text(model.description!,overflow: TextOverflow.ellipsis,maxLines: 2,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
