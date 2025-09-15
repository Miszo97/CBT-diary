//
//  EmotionsPicker.swift
//  CBT Thought Diary
//
//  Created by Artur Spek on 15/09/2025.
//


import SwiftUI

struct EmotionsPicker: View {
    @Binding var selected: Set<Emotion>
    
    var body: some View {
        HStack{
            EmotionButton(selectedEmotions: $selected, emotionName: "Radość")
            EmotionButton(selectedEmotions: $selected, emotionName: "Smutek")
            EmotionButton(selectedEmotions: $selected, emotionName: "Żal")
        }
    }
}

#Preview {
    struct PreviewView: View {
        @State var selected: Set<Emotion> = []
        var body: some View {
            EmotionsPicker(selected: $selected)
        }
    }
    return PreviewView()
}
