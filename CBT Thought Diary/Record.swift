import Foundation

func loadRecords() -> [Record] {
    if let data = UserDefaults.standard.data(forKey: "records"),
       let decoded = try? JSONDecoder().decode([Record].self, from: data) {
        return decoded
    }
    return []
}

func saveRecord(_ entry: Record) {
    var records = loadRecords()
    records.append(entry)
    
    if let encoded = try? JSONEncoder().encode(records) {
        UserDefaults.standard.set(encoded, forKey: "records")
    }
}


struct Record: Codable, Identifiable {
    var id = UUID()
    var situation: String
    var thought: String
    var emotions: [String]
    var action: String
    var date: Date
}
