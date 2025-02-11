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
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text("Edit Recipe", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              recipeController.updateRecipe(recipe.id!, nameController.text, descriptionController.text);
              Get.back();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Recipe Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                SizedBox(height: 5),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    hintText: "Enter recipe name",
                  ),
                ),
                SizedBox(height: 15),
                Text("Description", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                SizedBox(height: 5),
                TextField(
                  controller: descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    hintText: "Enter description",
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      recipeController.updateRecipe(recipe.id!, nameController.text, descriptionController.text);
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text("Update Recipe", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
