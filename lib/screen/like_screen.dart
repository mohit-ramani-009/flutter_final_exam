import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/recipe_controller.dart';

class LikedRecipePage extends StatelessWidget {
  final RecipeController recipeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text('Liked Recipes', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Obx(() {
        if (recipeController.favoriteRecipes.isEmpty) {
          return Center(
            child: Text(
              "No favorite recipes!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: recipeController.favoriteRecipes.length,
            itemBuilder: (context, index) {
              final recipe = recipeController.favoriteRecipes[index];
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
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      Get.defaultDialog(
                        title: "Remove from Favorites?",
                        middleText: "Are you sure you want to remove this recipe?",
                        textConfirm: "Yes",
                        textCancel: "No",
                        confirmTextColor: Colors.white,
                        buttonColor: Colors.redAccent,
                        onConfirm: () {
                          recipeController.removeFromFavorites(recipe.id!);
                          Get.back();
                        },
                      );
                    },
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
