//
//  RecipeModel.swift
//  MyRecipeHub
//  Group #12
//  Nirav Goswami (301252385)
//  Samir Patel (301286671)
//  Esha Naik (301297804)
//  Chetankumar Patel(301294334)
//
import Foundation

enum Category:String ,CaseIterable,Identifiable{
    var id: String {self.rawValue}
    case breakfast = "Breakfast"
    case soup = "Soup"
    case salad = "Salad"
    case appetizer = "Appetizer"
    case main = "Main"
    case side = "Side"
    case dessert = "Dessert"
    case snack = "Snack"
    case drink = "Drink"
    func localizedString() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
    
    static func getTitleFor(title: Category) -> String {
        return title.localizedString()
    }
}
struct Recipe: Identifiable , Codable{
   // let id = UUID()
    var id : UUID = .init()
    let name : String
    let image : String
    let description : String
    let ingredients : String
    let directions : String
    let category : String//Category.RawValue
    let datePublished : String
    let url : String
    
    enum CodingKeys : CodingKey {
        case name
        case image
        case description
        case ingredients
        case directions
        case category
        case datePublished
        case url
    }
}
///Offline Data
/*
extension Recipe{
    static let all:[Recipe]=[
    Recipe(name: "Curried Tomato Lentil Soup (Shorba Addis)",
           image: "https://www.forksoverknives.com/wp-content/uploads/Tomato-Lentil-Soup-2-300kb.jpg",
           description: "This recipe is based on an Ethiopian soup with a rich, deep curry flavor and complex textures. It’s easy to make in a big batch for the week ahead, but it’s so good, don’t expect it to last more than a couple of days.",
           ingredients: "½ yellow onion, diced\n1 small carrot, diced\n1 teaspoon freshly grated ginger\n3 cloves garlic, minced\n1 tablespoon curry powder (berbere is preferable)\n1 teaspoon fenugreek seeds\n2½ cups vegetable broth\n¼ cup tomato paste\n¼ cup brown or green lentils\n1 Yukon Gold potato, diced\n¼ cup whole-wheat orzo pasta",
           directions: "Over medium-high heat, sauté the onion until it is brown. Reduce the heat to medium. Add the carrot, ginger, garlic, curry powder, and fenugreek, sautéing them for about 1 minute.\nAdd the veggie broth and tomato paste, stirring until the tomato paste is thoroughly combined with the broth. Bring the soup to a simmer. Add the lentils and stir. Once the soup comes back to a simmer, cover the pot and reduce the heat to low. Cook the soup for 20 minutes.\nAdd the potato and orzo; cook the soup, covered, for 5 more minutes.",
           category: "Soup",
           datePublished: "2023-01-13",
           url: "https://www.forksoverknives.com/recipes/vegan-soups-stews/curried-tomato-lentil-soup-shorba-addis/"
          ),
    Recipe(name: "Vegan Potato Scramble with Hot Chile Sauce",
           image: "https://www.forksoverknives.com/wp-content/uploads/Potato-Scramble-FOK-Plan-300kb.jpg",
           description: "This hearty dish is easy to prepare ahead of time which makes it an ideal holiday breakfast dish and a good option to serve for brunch. When you’re ready to serve, simply reheat the potatoes and spoon them on top of toast or roll up in tortillas. To make it a bigger meal, serve it with a side of steamed greens or vegetables or with a salad.",
           ingredients: "1 ½ cups chopped red onion\n3 tablespoons prepared yellow mustard\n¼ teaspoon ground allspice\n1 ½ teaspoons finely chopped seeded jalapeño\n2 pounds potatoes, any variety, scrubbed and cut into ½-inch cubes\nSea salt\n2 ripe medium tomatoes, finely chopped (about 1 cup)\n½ cup fresh cilantro, finely chopped\n3 tablespoons fresh lime juice (from 1 to 2 limes)\n6 slices whole-grain bread, toasted, or 6 whole-grain tortillas, warmed",
           directions: "In a skillet, combine the onion, mustard, allspice, jalapeño, and 1 cup water. Stir to combine and bring to simmer over medium heat. Cover the pan and cook until the onions are translucent, 5 to 10 minutes. Add the potatoes, salt to taste, and an additional 1 cup water. Raise the heat to high, cover, and cook, stirring once or twice, for 5 minutes. Reduce the heat to medium and continue to cook, covered, until the potatoes are tender when pierced with a sharp knife, 10 to 15 minutes. You can prepare the dish to this point up to 2 days ahead; just transfer the potato mixture to an airtight container and store in the refrigerator until ready to serve.\nTo serve, reheat over low heat if necessary. Just before serving, stir in the tomatoes, cilantro, and lime juice. Place a slice of bread on each of six plates and top them evenly with the potato scramble. Alternatively, wrap the scramble in warmed whole-grain tortillas. If desired, drizzle Hot Chile Sauce over the top or pass it in a bowl at the table.",
           category: "Breakfast",
           datePublished: "2023-01-13",
           url: "https://www.forksoverknives.com/recipes/vegan-breakfast/potato-scramble-hot-chile-sauce/"
          ),
    Recipe(name: "Radicchio Salad with Cranberry Orange Dressing",
           image: "https://www.forksoverknives.com/wp-content/uploads/Radicchio-Salad-200kb.jpg",
           description: "This simple salad of seasonal autumn fruits is easy to make and yet has an interesting sweet and sour flavor. You can add some cooked grains to make it a heartier no-cook dish.",
           ingredients : "⅓ cup walnut halves\nFOR THE DRESSING:\n1 cup fresh orange juice\n½ cup cranberries, fresh or frozen\n6-7 Medjool dates, pitted\nPinch cayenne pepper\nSea salt\nFOR THE SALAD:\n1 head romaine lettuce, chopped\n½ head radicchio, chopped\n½ cup fresh pomegranate seeds\n½ cup parsley leaves, loosely packed",
           directions : "Preheat the oven to 250°F. Roast the walnuts on a baking sheet for 15 to 20 minutes, until they turn lightly brown. Remove and break into small bits.\nTo make the salad dressing, combine the orange juice, cranberries, and dates in a blender, and blend until smooth.\nPour the dressing into a shallow pan and bring to a boil, then reduce the heat to low and simmer for 10 to 15 minutes, until the liquid thickens a bit and reduces by about a third. Add the cayenne, and season with salt to taste. Set aside to cool.\nIn a large bowl, combine the romaine, radicchio, pomegranate seeds, and parsley. Toss with some of the oil-free dressing (taste first; you may not want to use all of it).\nSprinkle with walnuts right before serving.",
           category: "Salad",
           datePublished: "2023-01-13",
           url: "https://www.forksoverknives.com/recipes/vegan-salads-sides/radicchio-salad-cranberry-orange-dressing/"
          ),
    Recipe(name: "Sweet Fig Flatbreads",
           image: "https://www.forksoverknives.com/wp-content/uploads/Fig-Flatbreads-wordpress.jpg",
           description: "This simple flatbread showcases the natural sweetness of figs by pairing them with ribbons of floral orange zest and a creamy vanilla-infused spread. Perfect as a fruit-forward appetizer or light dessert, you can even bake the flatbread base beforehand and have it ready for quick assembly. Fresh figs are luscious in this recipe, but you can always substitute dried figs if they are out of season or not quite at their peak.",
           ingredients : "Cornmeal, for dusting\n1 recipe Homemade Oil-Free Pizza Dough\n½ cup raw cashews\n2 tablespoons chopped dried whole pitted dates\n½ teaspoon orange zest\n¼ teaspoon pure vanilla extract\n8 fresh figs, thinly sliced\nOrange zest, cut into strips\nPure maple syrup, for drizzling",
           directions : "Preheat oven to 400°F. Lightly sprinkle a large baking sheet with cornmeal.\nDivide dough into four portions. On a lightly floured surface, roll portions into 7- to 8-inch circles or 10×5-inch ovals. Transfer flatbreads to prepared pan. Bake 10 to 13 minutes or until lightly browned and set (flatbreads may puff). Let cool.\nMeanwhile, for sweet cream, in a small bowl combine cashews, dates, and enough boiling water to cover. Let stand 1 hour. Drain. Transfer to a small food processor. Add ¼ cup fresh water and process until smooth and creamy, adding up to 3 tablespoons additional water as necessary to reach spreadable consistency. Transfer to a bowl. Stir in the ½ teaspoon orange zest and the vanilla.\nSpread sweet cream on flatbreads. Top with figs. Garnish with orange strips; drizzle with maple syrup.",
           category: "Main",
           datePublished: "2023-01-13",
           url: "https://www.forksoverknives.com/recipes/vegan-baked-stuffed/sweet-fig-flatbreads/"
          )
    ]
}
*/
