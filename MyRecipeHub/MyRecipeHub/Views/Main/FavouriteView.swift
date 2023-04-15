//
//  FavouriteView.swift
//  MyRecipeHub
//  Group #12
//  Nirav Goswami (301252385)
//  Samir Patel (301286671)
//  Esha Naik (301297804)
//  Chetankumar Patel(301294334)
//
import SwiftUI

struct FavouriteView: View {
    @EnvironmentObject var recipeVM : RecipeViewModel
    @State var stateview : Bool = false
    var body: some View {
        NavigationView{
            if recipeVM.recipes.count <= 0 {
                Text("NoRecipesSaved")
                    .navigationTitle("Favourites")
            }else{
                ScrollView{
                    if stateview || !stateview {
                        RecipeList(recipes:recipeVM.favrecipes)
                    }
                }.navigationTitle("Favourites")
            }
        }.navigationViewStyle(.stack)
            .onAppear {
            self.recipeVM.isFavView = true
            stateview.toggle()
        }
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
            .environmentObject(RecipeViewModel())
    }
}
