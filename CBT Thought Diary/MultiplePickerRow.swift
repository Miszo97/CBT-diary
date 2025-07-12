import SwiftUI

struct Emotion: Hashable {
    var name: String
    var level: Int? = nil
}

struct MultiplePickerRow: View {
    let option: String
    @Binding var selected: Set<Emotion>
    @State private var checked = false

    var body: some View {
        let emotion = Emotion(name: option)

        Button(action: {
            if checked {
                selected.remove(emotion)
                checked = false
            } else {
                selected.insert(Emotion(name:option))
                checked = true
            }
        }) {
            VStack{
                HStack {
                    Text(option)
                    Spacer()
                    if checked {
                        Image(systemName: "checkmark")
                    }
                }
                if checked {
                    HStack {
                        Button("25") {
                            selected.remove(emotion)
                            selected.insert(Emotion(name:option,  level: 25))
                        }
                        Spacer()
                        Button("50") {
                            selected.remove(emotion)
                            selected.insert(Emotion(name:option,  level: 50))
                        }
                        Spacer()
                        Button("75") {
                            selected.remove(emotion)
                            selected.insert(Emotion(name:option,  level: 75))
                        }
                        Spacer()
                        Button("100") {
                            selected.remove(emotion)
                            selected.insert(Emotion(name:option,  level: 100))
                        }
                    }
                    .padding()
                }
            }
        }
    }
}


struct MultiplePickerRow_Previews: PreviewProvider {
    @State static var selectedEmotions: Set<Emotion> = []

    static var previews: some View {
        VStack {
            MultiplePickerRow(option: "love", selected: $selectedEmotions)
            MultiplePickerRow(option: "joy", selected: $selectedEmotions)
            MultiplePickerRow(option: "sadness", selected: $selectedEmotions)
        }
        .padding()
    }
}
