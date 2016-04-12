
import Foundation
import UIKit

/*:
 # Classes and objects
 */

class Location {
    
    var name: String?
    // latitude, logitude, descrtiption, ...
    
    func printDescription() {
        if let name = name {
            print(name)
        }
    }
}

class Lunch {
    
    let name: String
    
    var price = 3.5
    var isFeatured = false
    var location: Location?
    
    init(withName name: String) {
        self.name = name
    }
}

class Rating {
    
    let lunch: Lunch
    
    var value: Int
    var comment: String?
    
    init(forLunch lunch: Lunch, value: Int) {
        self.lunch = lunch
        self.value = value
    }
    
    func createDescription(rating rating: Int, withComment comment: String) -> String {
        var combined = ""
        // Swift has an easy syntax for for loops
        for _ in 1...rating {
            combined += "⭐️"
        }
        combined += " \(comment)"
        return combined
    }
    
    func printDescription() {
        if let comment = comment {
            let description = createDescription(rating: value, withComment: comment)
            print(description)
        }
    }
}

// Any unicode character is allowed as variable name or function name
let 🍔🍟 = Lunch(withName: "Burger and Fries")
let 🌮 = Lunch(withName: "Tacos")

🌮.isFeatured = true

let marksBurgerRating = Rating(forLunch: 🍔🍟, value: 5)
let lukasBurgerRating = Rating(forLunch: 🍔🍟, value: 2)
let marksTacoRating = Rating(forLunch: 🌮, value: 1)
let lukasTacoRating = Rating(forLunch: 🌮, value: 5)

lukasTacoRating.comment = "Disguisting! Found a snail in my tacos"
lukasTacoRating.printDescription()

🍔🍟.location = Location()

// Optional chaining allows to easily work with optionals
🍔🍟.location?.name = "EO"
🍔🍟.location?.printDescription()

// Arrays can be created on the fly
var ratings = [marksBurgerRating, lukasBurgerRating]

// Arrays are strongly typed like anything else in Swift
// let ratings: [Rating] = [marksBurgerRating, lukasBurgerRating, marksTacoRating, lukasTacoRating]
ratings.append(marksTacoRating)
ratings.append(lukasTacoRating)
// ratings.append(🌮)

// Inline function definitions
let ratingSum = ratings
    .filter({ rating in
        return rating.lunch.isFeatured == true
    })
    // Can be simplified to
    // .filter({ $0.lunch.isFeatured })
    .map{ $0.value }
    .reduce(0, combine: {$0 + $1})

// Since Swift is strongly typed, we need to convert everythong to Double
// let averageRating = ratingSum / ratings.count
let averageRating: Double = Double(ratingSum) / Double(ratings.count)
