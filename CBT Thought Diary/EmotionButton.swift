//
//  EmotionButton.swift
//  CBT Thought Diary
//
//  Created by Artur Spek on 14/07/2025.
//


import SwiftUI

struct EmotionButton: View {
    @Binding var selectedEmotions: Set<Emotion>
    let emotionName: String
    
    /// Level currently stored in `selectedEmotions` for this emotion (or nil)
    private var selectedLevel: Int? {
        selectedEmotions.first(where: { $0.name == emotionName })?.level
    }
    
    var body: some View {
        Menu {
            Button("Brak") {
                if let existing = selectedEmotions.first(where: { $0.name == emotionName }) {
                    selectedEmotions.remove(existing)
                }
            }
            ForEach(Array(stride(from: 10, through: 100, by: 10)), id: \.self) { number in
                Button {
                    updateSet(with: number)
                } label: {
                    HStack {
                        Text("\(number)")
                        if number == selectedLevel {
                            Spacer()
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
        } label: {
            Text("\(emotionName)\(selectedLevel.map { ": \($0)" } ?? "")")
                .fixedSize(horizontal: true, vertical: false)   // let the text grow instead of truncating
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.blue.opacity(0.2))
                .foregroundColor(.blue)
                .cornerRadius(10)
        }
    }
    
    // MARK: - Helper
    private func updateSet(with number: Int) {
        // Remove any existing record for this emotion
        if let existing = selectedEmotions.first(where: { $0.name == emotionName }) {
            selectedEmotions.remove(existing)
        }
        // Insert the updated one
        selectedEmotions.insert(Emotion(name: emotionName, level: number))
    }
}
