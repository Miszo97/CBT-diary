import Foundation

struct Record: Codable, Identifiable {
    var id = UUID()
    var situation: String
    var thought: String
    var emotions: [String]
    var action: String
    var date: Date
}
