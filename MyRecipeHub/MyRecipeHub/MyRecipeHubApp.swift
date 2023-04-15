//
//  MyRecipeHubApp.swift
//  MyRecipeHub
//  Group #12
//  Nirav Goswami (301252385)
//  Samir Patel (301286671)
//  Esha Naik (301297804)
//  Chetankumar Patel(301294334)
//
import SwiftUI
import Firebase

@main
struct MyRecipeHubApp: App {
    
    @StateObject var recipeViewModel = RecipeViewModel()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipeViewModel)
        }
    }
}
