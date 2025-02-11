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
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text("Add Recipe", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.teal,
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
              mainAxisSize: MainAxisSize.min,
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
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (nameController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
                        recipeController.addRecipe(nameController.text, descriptionController.text);
                        Get.back();
                      } else {
                        Get.snackbar("Error", "Please fill in all fields",
                            backgroundColor: Colors.redAccent,
                            colorText: Colors.white);
                      }
                    },
                    icon: Icon(Icons.add),
                    label: Text("Add Recipe", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
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
