//
//  RecipeViewModel.swift
//  MyRecipeHub
//  Group #12
//  Nirav Goswami (301252385)
//  Samir Patel (301286671)
//  Esha Naik (301297804)
//  Chetankumar Patel(301294334)
//
import Foundation
import FirebaseFirestore
import FirebaseAuth
import FirebaseFirestoreSwift

class RecipeViewModel : ObservableObject{
    @Published  var recipes : [Recipe] = []
    @Published  var favrecipes : [Recipe] = []
    @Published  var isFavView : Bool = false
    @Published  var isMainView : Bool = false
    let items_key : String = "items_key"
    @Published var logStatus : Bool = false
    init(){
       // recipes = Recipe.all
        
        filteroutfavrecipe()
    }
    
    func addRecipe(recipe:Recipe){
        recipes.append(recipe)
    }
    
    func getFavRecipeitems() -> [FavRecipeModel]{
        guard
            let data = UserDefaults().data(forKey: items_key),
            let saveditems = try? JSONDecoder().decode([FavRecipeModel].self, from: data)
        else {return [FavRecipeModel]()}
        return saveditems
    }
    
    func saveitems(favRecipe:[FavRecipeModel]){
        if let data = try? JSONEncoder().encode(favRecipe) {
            UserDefaults().set(data, forKey: items_key)
        }
    }
    
    func filteroutfavrecipe(){
        favrecipes.removeAll()
        let favereicpe = self.getFavRecipeitems()
        for item in favereicpe {
            for item2 in recipes {
                if item.name == item2.name{
                    favrecipes.append(item2)
                }
            }
        }
    }
    
    func fetchData() async throws{
        if !logStatus{
            try await loginUserAnonymous()
            var language = "english"
            let langStr = Locale.current.languageCode
            if langStr == "hi"{
                language = "hindi"
            }
            let recipesall = try await Firestore.firestore().collection("recipehub").document(language).collection("recipes").getDocuments()
                .documents
                .compactMap{
                    try $0.data(as: Recipe.self)
                }
            await MainActor.run(body: {
                self.recipes = recipesall
            })
        }
    }
    
    func loginUserAnonymous()async throws{
        if !logStatus {
            await MainActor.run(body: {
                logStatus = true
            })
            try await Auth.auth().signInAnonymously()
        }
    }
}
