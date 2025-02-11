import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/recipe_controller.dart';
import '../model/recipe_model.dart';

class EditRecipeScreen extends StatelessWidget {
  final Recipe recipe;
  EditRecipeScreen({required this.recipe});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final RecipeController recipeController = Get.find();

  @override
  Widget build(BuildContext context) {
    nameController.text = recipe.name;
    descriptionController.text = recipe.description;

    return Scaffold(
      appBar: AppBar(title: Text("Edit Recipe")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: descriptionController, decoration: InputDecoration(labelText: 'Description')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                recipeController.updateRecipe(recipe.id!, nameController.text, descriptionController.text);
                Get.back();
              },
              child: Text('Update Recipe'),
            ),
          ],
        ),
      ),
    );
  }
}
