import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rezepte/config.dart';
import 'package:http/http.dart' as http;

String titleInput = "-";
String ingredientsInput = "-";
String instructionsInput = "-";
String starsInput = "-";
String timeInput = "-";

List<Map> recipes = [
  {
    "name": "Kaiserschmarrn",
    "time": "1.5h",
    "stars": "5.0",
    "ingredients": "Zucker",
    "instructions": "einfach machen",
    "imageUrl": "https://media.istockphoto.com/id/1398775611/de/foto/kaiserschmarrn-frisch-und-hausgemacht.jpg?s=1024x1024&w=is&k=20&c=yvZTLabFv-09-Dzwl8mhq1rjaalXSMCGWhHH4iB4-ZM=",
  }
];

Future<String> fetchImage(String query) async {
  final response = await http.get(Uri.parse('https://api.pexels.com/v1/search?query=$query&per_page=1'),
    headers: {'Authorization': 'BWgFbPpPn5IZfTglCRWZNGy1uzfVraOHgruRHUiVF1RxH72YcZ4EJkec'});
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);
      if (result['photos'] != null && result['photos'].isNotEmpty) {
        return result['photos'][0]['src']['large'];
    }
  }
  return "https://media.istockphoto.com/id/1398775611/de/foto/kaiserschmarrn-frisch-und-hausgemacht.jpg?s=1024x1024&w=is&k=20&c=yvZTLabFv-09-Dzwl8mhq1rjaalXSMCGWhHH4iB4-ZM=";
}
    
/*     
    .then(
      (value) {
        Map result = jsonDecode(value.body);
      }
    );
}
 */
class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              //Title
              SizedBox(
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    onChanged: (newText) {titleInput = newText;},
                    style: normalStyle,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                    ),
                  ),
                ),
              ),
              //Stars
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(2.5),
                      child: TextField(
                        onChanged: (newText) {timeInput = newText;},
                        style: normalStyle,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Time',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(2.5),
                      child: TextField(
                        onChanged: (newText) {starsInput = newText;},
                        style: normalStyle,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Stars',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //Ingredients
              SizedBox(
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    onChanged: (newText) {ingredientsInput = newText;},
                    keyboardType: TextInputType.multiline,
                    minLines: 5,
                    maxLines: 5,
                    style: normalStyle,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Ingredients',
                    ),
                  ),
                ),
              ),
              //Instructions
              SizedBox(
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    onChanged: (newText) {instructionsInput = newText;},
                    keyboardType: TextInputType.multiline,
                    minLines: 5,
                    maxLines: 5,
                    style: normalStyle,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Instructions',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String imageUrl = await fetchImage(titleInput);
          print(imageUrl);

          setState(() {
            imageUrl = imageUrl;
            // ignore_for_file: avoid_print
            print(titleInput);
            print("-----");
            print(timeInput);
            print(starsInput);
            print("-----");
            print(ingredientsInput);
            print("-----");
            print(instructionsInput);

            
            recipes.add(
              {
                "name": titleInput,
                "time": timeInput,
                "stars": starsInput,
                "ingredients": ingredientsInput,
                "instructions": instructionsInput,
                "imageUrl": imageUrl,
              }
            );

            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Recipe $titleInput Saved!'),
              action: SnackBarAction(
                label: 'Dismiss',
                onPressed: () {
                  //goes away automatically
                },
              ),
            ),
            );
          });
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.save, color: Colors.white),
      ),
    );
  }
}