import SwiftUI

struct ContentView: View {
    @State private var selected: Set<Emotion> = []
    @State private var number: Int = 0
    @State var situation: String = ""
    @State var thought: String = ""
    @State var action: String = ""
    @State var date: Date
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
                }.padding(.horizontal)
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


