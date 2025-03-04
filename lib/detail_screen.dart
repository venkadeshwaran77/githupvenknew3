import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:new03/recipesmodel.dart';

class DetailScreen extends StatelessWidget {
  final Recipe recipe;
  const DetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
    body:SingleChildScrollView(
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior:Clip.none,
            children:[
              //for detail Screen image
              Image.network(
                  recipe.image,
                  fit:BoxFit.cover,
                  height:400,
                  width:size.width,
              ),
              //for back button
              Padding(
                padding:MediaQuery.of(context).padding,
                child: Positioned(
                  child: GestureDetector(
                    onTap:(){
                   Navigator.pop(context);
                    },
                      child: Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
              Positioned(
                bottom:-50,
                right:30,
                left:30,
                child: Container(
                  height:140,
                  width:size.width,
                  decoration:BoxDecoration(
                    boxShadow:[BoxShadow(
                      color:Colors.black12,
                      spreadRadius:2,
                      blurRadius:2,
                    ),
                    ],
                      borderRadius:BorderRadius.circular(20),
                      color:Colors.lime,
                  ),
                  child:Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                    Padding(
                      padding:EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children:[
                        Text(
                          recipe.name,
                          style:TextStyle(
                              fontSize:18,
                              fontWeight:FontWeight.bold,
                              color:Colors.white,
                          ),
                        ),
                          Row(children:[
                            Text(
                              recipe.mealType[0],
                              style:TextStyle(
                                fontSize:18,
                                fontWeight:FontWeight.bold,
                                color:Colors.white,
                              ),
                            ),
                            Text(
                              " & ",
                              style:TextStyle(
                                fontSize:18,
                                fontWeight:FontWeight.bold,
                                color:Colors.white,
                              ),
                            ),
                            Text(
                              recipe.cuisine,
                              style:TextStyle(
                                fontSize:18,
                                fontWeight:FontWeight.bold,
                                color:Colors.white,
                              ),
                            ),
                          ],
                          ),
                      ],
                      ),
                    ),
                    Container(
                      height:50,
                      width:size.width,
                      decoration:BoxDecoration(
                        color:Colors.white,
                        borderRadius:BorderRadius.only(
                          bottomLeft:Radius.circular(20),
                          bottomRight:Radius.circular(20),
                        ),
                      ),
                      child:Row(
                        children:[
                          SizedBox(width:35),
                        Icon(Icons.star,color:Colors.orange),
                          Text(recipe.rating.toString()),
                          SizedBox(width:50),
                          Icon(Icons.timer, color:Colors.blue),
                          Text(recipe.cookTimeMinutes.toString()),
                          SizedBox(width:50),
                          Icon(Icons.accessibility,color:Colors.black),
                          Text("${recipe.caloriesPerServing.toString()} kcl"),
                        ],
                      ),
                    ),
                  ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:EdgeInsets.all(15),
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
              SizedBox(height:60),
              Text("Ingredients",
            style:TextStyle(
            fontWeight:FontWeight.bold,
            fontSize:22,
          ),
          ),
            Padding(
              padding:EdgeInsets.only(left:15,top:10),
              child:Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:List.generate(recipe.ingredients.length,(index){
                  return Text(
                    "-${recipe.ingredients[index]}",
                    style:TextStyle(
                      fontSize:18,
                    ),
                  );
                 }),
                ),
               ),
                SizedBox(height:10,),
                Text(
                  "Instructions",
                  style:TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize:22,
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(left:15,top:10),
                  child:Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children:List.generate(recipe.instructions.length,(index){
                      return Text(
                        "-${recipe.instructions[index]}",
                        style:TextStyle(
                          fontSize:18,
                        ),
                      );
                    }),
                  ),
                ),
             ],
          ),
          ),
          SizedBox(height:40),
        ],
      ),
    ) ,
    );
  }
}
