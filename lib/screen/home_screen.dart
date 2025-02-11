import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/recipe_controller.dart';
import 'add_recipe_screen.dart';
import 'edit_recipe_screen.dart';
import 'like_screen.dart';

class HomePage extends StatelessWidget {
  final RecipeController recipeController = Get.put(RecipeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.red),
            onPressed: () => Get.to(LikedRecipePage()),
          ),
        ],
      ),
      body: Obx(() {
        if (recipeController.recipes.isEmpty) {
          return Center(
            child: Text("No recipes found!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: recipeController.recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipeController.recipes[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  contentPadding: EdgeInsets.all(15),
                  title: Text(recipe.name,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  subtitle: Text(recipe.description,
                      style: TextStyle(color: Colors.grey[700])),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == "Edit") {
                        Get.to(EditRecipeScreen(recipe: recipe));
                      } else if (value == "Delete") {
                        recipeController.deleteRecipe(recipe.id!);
                      } else if (value == "Favorite") {
                        recipeController.addToFavorites(recipe);
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(value: "Edit", child: Text("Edit")),
                      PopupMenuItem(value: "Delete", child: Text("Delete")),
                      PopupMenuItem(value: "Favorite", child: Text("Favorite")),
                    ],
                    icon: Icon(Icons.more_vert, color: Colors.black54),
                  ),
                ),
              );
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.to(AddRecipeScreen()),
        label: Text("Add Recipe",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        icon: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
