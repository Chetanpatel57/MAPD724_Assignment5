//
//  RecipeList.swift
//  MyRecipeHub
//  Group #12
//  Nirav Goswami (301252385)
//  Samir Patel (301286671)
//  Esha Naik (301297804)
//  Chetankumar Patel(301294334)
//
import SwiftUI

struct RecipeList: View {
    @State var recipes : [Recipe]
    @State var stateview : Bool = false
    @EnvironmentObject var recipeVM : RecipeViewModel
    
    var body: some View {
        VStack{
            HStack{
                Text("\(recipes.count)")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                    .padding(.leading)
                if  recipes.count > 1  {
                    Text("recipes")
                        .font(.headline)
                        .fontWeight(.medium)
                        .opacity(0.7)
                }else{
                    Text("recipe")
                        .font(.headline)
                        .fontWeight(.medium)
                        .opacity(0.7)
                }
                Spacer()
            }
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160),spacing: 15)],spacing: 15) {
                if stateview || !stateview{
                    ForEach(recipes) { recipe in
                        NavigationLink {
                            RecipeView(recipe: recipe)
                        } label: {
                            RecipeCard(recipe: recipe)
                        }
                    }
                }
            }
            .padding(.top)
            .onAppear {
                if recipeVM.isFavView {
                    recipes = recipeVM.favrecipes
                }else if recipeVM.isMainView {
                    recipes = recipeVM.recipes
                }
                stateview.toggle()
            }
        }
        .padding(.horizontal)
        
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView{
            ContentView()
//            RecipeList(recipes: Recipe.all)
//                .environmentObject(RecipeViewModel())
        }
    }
}


