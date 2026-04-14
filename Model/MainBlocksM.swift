import Foundation

struct MainBlocksM: Identifiable {
    var id = UUID()
    var term: String
    var definition: String
    var images: [String]?
}

struct questionBlockM: Identifiable {
    var id = UUID()
    var question: String
    var points: [String]
    var rightAnswers: [Int]
    var VUZ: String
    var discipline: String
    var memorableScale: Int
}
