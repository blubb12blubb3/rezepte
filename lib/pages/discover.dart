import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rezepte/config.dart';
import 'package:http/http.dart' as http;
import 'package:rezepte/recipecard.dart';
import 'create.dart';

var strMeal;
var strMealThumb;
/* 
List<Recipe> _recipes;
bool _isLoading = true;
 */
fetchRandomMeal() async {
  final response = await http
      .get(Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));

  if (response.statusCode == 200) {
    // API request successful
    final json = jsonDecode(response.body);
    final meal = json['meals'][0];

    // Access the meal details
    strMeal = meal['strMeal'];
    final strCategory = meal['strCategory'];
    final strArea = meal['strArea'];
    final strInstructions = meal['strInstructions'];
    strMealThumb = meal['strMealThumb'];
    final strTags = meal['strTags'];
    final strYoutube = meal['strYoutube'];
    final strIngredient1 = meal['strIngredient1'];
    final strIngredient2 = meal['strIngredient2'];
    // ... and so on
    // ignore_for_file: avoid_print
    // Print the meal details
    print('Meal Name: $strMeal');
    print('Category: $strCategory');
    print('Area: $strArea');
    print('Instructions: $strInstructions');
    print('Meal Thumbnail: $strMealThumb');
    print('Tags: $strTags');
    print('YouTube Link: $strYoutube');
    print('Ingredient 1: $strIngredient1');
    print('Ingredient 2: $strIngredient2');
    // ... and so on
  } else {
    print('Failed to fetch random meal. Error code: ${response.statusCode}');
  }
}

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  late Future<void> _future;
  
  @override
  void initState() {
    super.initState();
    _future = fetchRandomMeal();
  }
  /* 
  Future<void> getRecipes() async {
      _recipes = await fetchRandomMeal();
      setState(() {
        _isLoading = false;
      });
    }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Failed to fetch random meal'));
            } else {
              return RecipeCard(
                title: strMeal,
                cookTime: "N.A.",
                rating: "N.A.",
                thumbnailUrl: strMealThumb,
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
    
    
    
    
    
/*     _isLoading
    ? Center(child: CircularProgressIndicator())
    : ListView.builder(
        itemCount: _recipes.length,
        itemBuilder: (context, index) {
          return RecipeCard(
            title: strMeal, 
            cookTime: "N.A.", 
            rating: "N.A.",
            thumbnailUrl: strMealThumb,
          );
        }
      )
  );
}
}

 */


/* 
_isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipes[index].name,
                      cookTime: _recipes[index].totalTime,
                      rating: _recipes[index].rating.toString(),
                      thumbnailUrl: _recipes[index].images);
                },
              ));
       */
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
/*       
      FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Failed to fetch random meal'));
            } else {
              return RecipeCard(
                title: strMeal,
                cookTime: "N.A.",
                rating: "N.A.",
                thumbnailUrl: strMealThumb,
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
 */















/* 
ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          fetchRandomMeal();
          print(strMeal);
          //print(strMealThumb);
          try{
            return RecipeCard(
              title: strMeal, 
              cookTime: "N.A.", 
              rating: "N.A.",
              thumbnailUrl: "https://media.istockphoto.com/id/1398775611/de/foto/kaiserschmarrn-frisch-und-hausgemacht.jpg?s=1024x1024&w=is&k=20&c=yvZTLabFv-09-Dzwl8mhq1rjaalXSMCGWhHH4iB4-ZM=", 
              //thumbnailUrl: strMealThumb,
              );
          }
          catch (e) {
            // No specified type, handles all
            print('Something really unknown: $e');
          }
          }
        )
    );
  }
}
 */