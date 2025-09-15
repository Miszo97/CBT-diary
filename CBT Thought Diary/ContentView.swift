import SwiftUI

struct ContentView: View {
    @State private var selected: Set<Emotion> = []
    @State var situation: String = ""
    @State var thought: String = ""
    @State var action: String = ""
    @State var date: Date
    @State var sendStatus: Int = 200
    let emotions_names : [String] = ["Lęk", "Smutek", "Złość"]
    
    @State private var records: [Record] = []


    var body: some View {
        ScrollView {
            
            Text("CBT").font(.title2).padding(10)
            SituationInputView(situation: $situation)
            ThoughtInputView(thought: $thought)
            EmotionsPicker(selected: $selected)
    
            
            Action(action: $action)
            DatePicker("Date", selection: $date).padding(20)
            

            HStack {
                Button("Send") {
                    date = Date()
                    let emotions: [String] = selected.map { "\($0.name) - \(String(describing: $0.level))" }
                    let record = Record(situation: situation, thought: thought, emotions: emotions, action: action, date: date)
                    Task {
                        try await sendRecord(record)
                    }
                }.padding(.horizontal)
                Button("Clear") {
                    date = Date()
                    situation = ""
                    thought = ""
                    action = ""
                    selected.removeAll()
                }.padding(.horizontal)
            }
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            if sendStatus == 200 {
                Text("\(sendStatus)").foregroundStyle(.green)
            }
            


        }
        .padding(10)
    }
}


#Preview {
    ContentView(date: Date())
}


