import SwiftUI

struct ContentView: View {
    @State private var selected: Set<Emotion> = []
    @State private var number: Int = 0
    @State var situation: String = ""
    @State var thought: String = ""
    @State var action: String = ""
    @State var date: Date
    
    @State private var records: [Record] = loadRecords()

    var combinedText: String {
        records.map { entry in
            """
            Situation: \(entry.situation)
            Thought: \(entry.thought)
            Emotions: \(entry.emotions.joined(separator: ", "))
            Action: \(entry.action)
            Date: \(entry.date.formatted(.dateTime.hour().minute().day().month().year()))
            """
        }
        .joined(separator: "\n\n")
    }

    var body: some View {
        ScrollView {
            
            Text("CBT").font(.title2).padding(10)
            SituationInputView(situation: $situation)
            ThoughtInputView(thought: $thought)
            
            HStack {
                ForEach(emotions, id: \.self) { emotion in
                    EmotionButton(selectedEmotions: $selected, emotionName: emotion)
                }
            }


            if !selected.isEmpty {
                Text(
                    selected.map { emotion in
                        if let level = emotion.level {
                            return "\(emotion.name) \(level)"
                        } else {
                            return emotion.name
                        }
                    }.joined(separator: ", ")
                )
                .padding(20)
            }
            
            Action(action: $action)
            DatePicker("Date", selection: $date).padding(20)
            

            HStack {
                Button("Save") {
                    let allEmotions = selected.map { $0 }
                    
                    if (situation.isEmpty || thought.isEmpty || action.isEmpty || selected.isEmpty){
                    }
                    else {
                        
                        let newRecord = Record(
                            situation: situation,
                            thought: thought,
                            emotions: allEmotions.compactMap { emotion in
                                if let level = emotion.level {
                                    return "\(emotion.name) \(level)"
                                } else {
                                    return "\(emotion.name)"
                                }
                            },
                            action: action,
                            date: date
                        )
                        
                        saveRecord(newRecord)
                        records = loadRecords()
                        selected = []
                        situation = ""
                        thought = ""
                        action = ""
                    }
                }.padding(.horizontal)
                
                CopyAndRemoveButton(combinedText: combinedText, records: $records)
                
                Button("Clear") {
                    date = Date()
                }.padding(.horizontal)
            }
            if (!combinedText.isEmpty)
            {
                VStack(alignment: .leading) {
                    Text(combinedText)
                        .textSelection(.enabled)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                }
                .padding(10)
            }

        }
        .padding(10)
    }
}


#Preview {
    ContentView(date: Date())
}
