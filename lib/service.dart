import 'package:http/http.dart' as http;
import 'package:new03/recipesmodel.dart';

RecipesItems () async {
  Uri url = Uri.parse("https://dummyjson.com/recipes");
  var res = await http.get (url);
  try {
    if (res.statusCode == 200){
      var data = recipesmodelFromJson(res.body);
      return data.recipes;
    }else{
      print("Error Occured");
    }
  } catch (e) {
     print(e.toString());
  }
}