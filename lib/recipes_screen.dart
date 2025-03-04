import 'package:flutter/material.dart';
import 'package:new03/detail_screen.dart';
import 'package:new03/recipesmodel.dart';
import 'package:new03/service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List <Recipe> recipesmodel=[];
  bool isLoading = false;
myRecipes(){
  isLoading = true;
  RecipesItems().then((value){
    setState(() {
      recipesmodel=value;
      isLoading = false;
    });
  });
}
@override
  void initState() {
    // TODO: implement initState
  myRecipes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Recipes App From API"),
        centerTitle:true,
      actions: [IconButton(onPressed:(){},icon:Icon(Icons.restaurant_menu))],
      ),
      body: isLoading
       ? Center(
        child:CircularProgressIndicator(),
      )
      : ListView.builder(
        shrinkWrap: true,
          itemCount: recipesmodel.length,
          itemBuilder: (context,index){
          final recipes = recipesmodel [index];
              return Padding(padding:EdgeInsets.all(12),
             child:GestureDetector(onTap:(){
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder:(context)=>DetailScreen(recipe:recipes),
                 ),
               );
               },
            child:Stack(children: [
              Container(height:250,
                decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(30),
                  image: DecorationImage(
                    image:NetworkImage(recipes.image),
                    fit:BoxFit.fill,
                  ),
                  boxShadow:[
                    BoxShadow(
                    color:Colors.black,

                    offset:Offset(-5, 7),),]
              ),
              ),
              Positioned(
                bottom:0,
                right:0,left:0,
                child: Container(
                height:45,
                decoration:BoxDecoration(
                  color:Colors.black26,
                  borderRadius:BorderRadius.only(
                      bottomLeft:Radius.circular(20),
                      bottomRight:Radius.circular(30)
                  ),
                ),
                  child: Row(
                    children:[
                      Expanded(
                        child:Padding(
                          padding:EdgeInsets.only(left:10),
                          child:Text(recipes.name,
                            style:TextStyle(
                                fontWeight:FontWeight.w800,
                                fontSize:18,color:Colors.white,
                            ),
                          ),
                        ),
                       ),
                      Icon(Icons.star,color:Colors.orange),
                      Text(
                        recipes.rating.toString(),
                        style:TextStyle(
                          fontWeight:FontWeight.w800,
                          fontSize:18,color:Colors.white,
                        ),
                      ),
                      SizedBox(width:15),
                      Text(
                        recipes.cookTimeMinutes.toString(),
                        style:TextStyle(
                          fontWeight:FontWeight.w800,
                          fontSize:18,color:Colors.white,
                        ),
                      ),
                      Text(
                        " Min",
                        style:TextStyle(
                          fontWeight:FontWeight.w800,
                          fontSize:18,color:Colors.white,
                        ),
                      ),
                      SizedBox(width:15),
                  ],
                  ),
                 ),
                ),
              ],
             ),
            ),
            );
          }
      ),
    );
  }
}
