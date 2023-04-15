//
//  CategoriesView.swift
//  MyRecipeHub
//  Group #12
//  Nirav Goswami (301252385)
//  Samir Patel (301286671)
//  Esha Naik (301297804)
//  Chetankumar Patel(301294334)
//
import SwiftUI

struct CategoriesView: View {
    @EnvironmentObject var recipeVM : RecipeViewModel
    var body: some View {
        NavigationView{
            List(content: {
                ForEach(Category.allCases,id: \.self) { category in
                    NavigationLink {
                        CategoryView(category: category)
                    } label: {
                        Text(Category.getTitleFor(title: category))
                    }
                }
            })
                .navigationTitle("Categories")
        }.navigationViewStyle(.stack)
            .onAppear {
            self.recipeVM.isFavView = false
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
            .environmentObject(RecipeViewModel())
    }
}
