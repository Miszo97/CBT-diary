import SwiftUI

struct ContentView: View {
    @State private var selected: Set<Emotion> = []
    @State private var number: Int = 0
    @State var situation: String = ""
    @State var thought: String = ""
    @State var action: String = ""
    @State var date: Date
    
    @State private var records: [Record] = []


    var body: some View {
        ScrollView {
            
            Text("CBT").font(.title2).padding(10)
            SituationInputView(situation: $situation)
            ThoughtInputView(thought: $thought)
            

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
                Button("Clear") {
                    date = Date()
                }.padding(.horizontal)
            }


        }
        .padding(10)
    }
}


#Preview {
    ContentView(date: Date())
}


