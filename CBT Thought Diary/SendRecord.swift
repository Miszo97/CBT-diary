import Foundation

struct RecordForEncoding: Codable {
    var id: UUID
    var situation: String
    var thought: String
    var emotions: String
    var action: String
    var date: Date

    init(from record: Record) {
        id = record.id
        situation = record.situation
        thought = record.thought
        emotions = record.emotions.joined(separator: ", ")
        action = record.action
        date = record.date
    }
}

func createJsonData(_ record: Record) -> Data? {
    let record_for_encoding = RecordForEncoding(from: record)
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .iso8601  // or .millisecondsSince1970
    
    do {
        let jsonData = try encoder.encode(record_for_encoding)
        return jsonData
    } catch {
        print("❌ Failed to encode record: \(error)")
        return nil
    }
}


func sendRecord(_ record: Record) async throws -> Int? {
    let urlString = "https://records-583023182320.europe-central2.run.app/records"
    
    guard let url = URL(string: urlString) else {
        print("❌ Invalid URL")
        return nil
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = createJsonData(record)
    
    // This is the async call
    let (data, response) = try await URLSession.shared.data(for: request)
    
    if let httpResponse = response as? HTTPURLResponse {
        print("✅ Response status code: \(httpResponse.statusCode)")
        return httpResponse.statusCode
    }
    
    if let jsonString = String(data: data, encoding: .utf8) {
        print("📦 Response body: \(jsonString)")
    }
    return nil
}
