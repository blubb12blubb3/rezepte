import 'package:flutter/material.dart';
import 'create.dart';
import 'package:rezepte/config.dart';
import 'package:rezepte/recipecard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return RecipeCard(
              title: recipes[index]["name"], 
              cookTime: recipes[index]["time"], 
              rating: recipes[index]["stars"], 
              thumbnailUrl: recipes[index]["imageUrl"]
              );
            }
          )
    );
  }
}

/* 
return Scaffold(
      body: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return RecipeCard(
              title: recipes[index][0], 
              cookTime: recipes[index][1], 
              rating: recipes[index][2], 
              thumbnailUrl: "https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg"
              );
            }
          )
    );
  }
}
 */

/* _isLoading
        ? Center(child: CircularProgressIndicator{})
        : 
 */
/* 
    return Scaffold(
      body: Column(
        children: [
          RecipeCard(
            title: titleInput, 
            cookTime: timeInput, 
            rating: starsInput, 
            thumbnailUrl: "https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg",
          ),
        ],
      )
    );
  }
}
 */