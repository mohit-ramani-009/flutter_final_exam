import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/recipe_controller.dart';

class AddRecipeScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final RecipeController recipeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Recipe")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: descriptionController, decoration: InputDecoration(labelText: 'Description')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                recipeController.addRecipe(nameController.text, descriptionController.text);
                Get.back();
              },
              child: Text('Add Recipe'),
            ),
          ],
        ),
      ),
    );
  }
}
