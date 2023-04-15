//
//  RecipeView.swift
//  MyRecipeHub
//  Group #12
//  Nirav Goswami (301252385)
//  Samir Patel (301286671)
//  Esha Naik (301297804)
//  Chetankumar Patel(301294334)
//
import SwiftUI

struct RecipeView: View {
    @EnvironmentObject var recipeVM : RecipeViewModel
    var recipe: Recipe
    @State var isFav : Bool = false
    @State var isviewloaded = false
    @State var adLoaded = false
   
    var body: some View {
        ScrollView{
                
                AsyncImage(url: URL(string: recipe.image)) { image in
                    image
                        .resizable()
                    //                    .aspectRatio(contentMode: .fill)
                    
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100,height: 100,alignment: .center)
                        .foregroundColor(.white.opacity(0.7))
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                }
                .frame(height: 300)
                .frame(maxWidth: .infinity)
                .background(LinearGradient(colors: [Color(.gray).opacity(0.3),Color(.gray)], startPoint: .top, endPoint: .bottom))
                .overlay(alignment:.bottom) {
                    HStack(alignment: .bottom, content: {
                        Spacer()
                        Button {
                            adddeleterecipefav()
                            
                        } label: {
                            Image(systemName: isFav ? "heart.fill" : "heart")
                                .resizable()
                                .frame(width:40,height:40,alignment: .trailing)
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 3)
                                .padding()
                        }
                        
                    }).frame(maxWidth: .infinity)
                }.onAppear(perform: checkrecipeisfav)
                
                
            
            VStack(spacing: 30, content: {
//                BannerView()
//                    .frame(height: 50)
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                VStack(alignment:.leading, spacing: 30, content: {
                    if !recipe.description.isEmpty{
                        Text(recipe.description)
                    }
                    if !recipe.ingredients.isEmpty{
                        VStack(alignment:.leading, spacing: 30){
                            Text("Ingredients")
                                .font(.headline)
                            Text(recipe.ingredients)
                        }
                    }
                    if !recipe.directions.isEmpty{
                        VStack(alignment:.leading, spacing: 30){
                            Text("Directions")
                                .font(.headline)
                            Text(recipe.directions)
                        }
                    }
                    if !recipe.url.isEmpty{
                        HStack{
                            Spacer()
                            NavigationLink {
                                WebKitView(urltoopen: recipe.url)
                            } label: {
                                Text("Visit Website")
                                    .padding()
                                    .background(Color("buttonbackground"))
                                    .cornerRadius(10)
                                    .foregroundColor(Color("buttontextcolor"))
                                    .font(.headline)
                            }

                            Spacer()
                        }

                    }
                })
                .frame(maxWidth: .infinity,alignment: .leading)
//                BannerView()
//                    .frame(height: 50)
            })
            .padding(.horizontal)
            
        }
    
    
        .ignoresSafeArea(.container,edges: .top)
    }
    
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
//        RecipeView(recipe: Recipe.all[0])
//            .environmentObject(RecipeViewModel())
        ContentView()
    }
}

extension RecipeView {
    func checkrecipeisfav(){
        isFav = false
        let favlist = recipeVM.getFavRecipeitems()
        if favlist.firstIndex(where: {$0.name == recipe.name}) != nil{
            isFav = true
        }
    }
    
    func adddeleterecipefav(){
        var favlist = RecipeViewModel().getFavRecipeitems()
        if let index = favlist.firstIndex(where: {$0.name == recipe.name}){
            favlist.remove(at: index)
        }
        else{
            let favrecipe = FavRecipeModel(name: recipe.name)
            favlist.append(favrecipe)
        }
        recipeVM.saveitems(favRecipe: favlist)
        recipeVM.filteroutfavrecipe()
        checkrecipeisfav()
    }
}
