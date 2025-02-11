import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/recipe_controller.dart';

class LikedRecipePage extends StatelessWidget {
  final RecipeController recipeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liked Recipes')),
      body: Obx(() {
        if (recipeController.favoriteRecipes.isEmpty) {
          return Center(child: Text("No favorite recipes!"));
        }
        return ListView.builder(
          itemCount: recipeController.favoriteRecipes.length,
          itemBuilder: (context, index) {
            final recipe = recipeController.favoriteRecipes[index];
            return ListTile(
              title: Text(recipe.name),
              subtitle: Text(recipe.description),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => recipeController.removeFromFavorites(recipe.id!),
              ),
            );
          },
        );
      }),
    );
  }
}
