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
      appBar: AppBar(title: Text('Recipes')),
      body: Obx(() {
        if (recipeController.recipes.isEmpty) {
          return Center(child: Text("No recipes found!"));
        }
        return ListView.builder(
          itemCount: recipeController.recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipeController.recipes[index];
            return ListTile(
              title: Text(recipe.name),
              subtitle: Text(recipe.description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite, color: Colors.red),
                    onPressed: () => recipeController.addToFavorites(recipe),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => Get.to(EditRecipeScreen(recipe: recipe)),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => recipeController.deleteRecipe(recipe.id!),
                  ),
                ],
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(AddRecipeScreen()),
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () => Get.to(LikedRecipePage()),
        ),
      ),
    );
  }
}
