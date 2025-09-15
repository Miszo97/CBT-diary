import Testing
import Foundation
@testable import CBT_Thought_Diary

struct CBT_Thought_DiaryTests_2 {

    @Test func test_createJsonData() async throws {
        let record = Record(situation: "Situation", thought: "Thought", emotions: ["Emotion"], action: "Action", date: Date())
        let data = createJsonData(record)
        print(data)
    }
    
    @Test func test_sendRecord() async throws {
        let record = Record(situation: "Situation", thought: "Thought", emotions: ["Emotion"], action: "Action", date: Date())
        try await sendRecord(record)
    }

}
