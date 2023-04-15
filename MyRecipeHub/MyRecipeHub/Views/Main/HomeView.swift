//
//  HomeView.swift
//  MyRecipeHub
//  Group #12
//  Nirav Goswami (301252385)
//  Samir Patel (301286671)
//  Esha Naik (301297804)
//  Chetankumar Patel(301294334)
//
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var recipeVM : RecipeViewModel
    @State private var darkmode : Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView{
                if recipeVM.recipes.count > 0 {
                    RecipeList(recipes: recipeVM.recipes)
                }else{
                    ProgressView()
                }
            }
            .navigationTitle("My Recipes")
            .onReceive(NotificationCenter.default.publisher(for: Notification.Name("DARKMODE"))) { notification in
                if let isOn = notification.userInfo?["isOn"] as? Bool {
                    darkmode = isOn
                }
            }
        }
        .navigationViewStyle(.stack)
        .onAppear {
            self.recipeVM.isFavView = false
            self.recipeVM.isMainView = true
        }
        .onDisappear {
            NotificationCenter.default.removeObserver(self, name: Notification.Name("DARKMODE"), object: nil)
            self.recipeVM.isMainView = false
        }
        .preferredColorScheme(darkmode ? .dark : .light)
        .task {
            do {
                try await recipeVM.fetchData()
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RecipeViewModel())
    }
}
