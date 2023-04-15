//
//  CategoryView.swift
//  MyRecipeHub
//  Group #12
//  Nirav Goswami (301252385)
//  Samir Patel (301286671)
//  Esha Naik (301297804)
//  Chetankumar Patel(301294334)
//
import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var recipeVM : RecipeViewModel
    var category : Category
    var recipes : [Recipe]  {
        return recipeVM.recipes.filter{$0.category == category.rawValue}
    }
    var body: some View {
        ScrollView{
            RecipeList(recipes:recipes)
        }
        .navigationTitle(LocalizedStringKey(category.rawValue))
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category.main)
            .environmentObject(RecipeViewModel())
    }
}
