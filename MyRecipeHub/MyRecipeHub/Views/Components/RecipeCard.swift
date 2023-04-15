//
//  RecipeCard.swift
//  MyRecipeHub
//  Group #12
//  Nirav Goswami (301252385)
//  Samir Patel (301286671)
//  Esha Naik (301297804)
//  Chetankumar Patel(301294334)
//
import SwiftUI

struct RecipeCard: View {
    var recipe : Recipe
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: recipe.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(alignment:.bottom) {
                        Text(recipe.name)
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color:.black ,radius: 3)
                            .frame(maxWidth: 136)
                            .padding()
                    }
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40,height: 40,alignment: .center)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .overlay(alignment:.bottom) {
                        Text(recipe.name)
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color:.black ,radius: 3)
                            .frame(maxWidth: 136)
                            .padding()
                    }
            }
        }
        .frame(width: 160,height: 217,alignment: .top)
        .background(LinearGradient(colors: [Color(.gray).opacity(0.3),Color(.gray)], startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20,style: .continuous))
        .shadow(color:.black.opacity(0.3),radius: 15,x: 0,y: 10)
    }
    
}

struct RecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        RecipeCard(recipe: Recipe.all[0])
    }
}
