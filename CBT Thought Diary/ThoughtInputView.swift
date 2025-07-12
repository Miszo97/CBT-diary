//
//  situation.swift
//  CBT Thought Diary
//
//  Created by Artur Spek on 09/07/2025.
//

import SwiftUI

struct ThoughtInputView: View {
    @Binding var thought: String
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Thought")
                .font(.headline)
                .foregroundColor(.primary)

            ZStack {
                // Background & border
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.2))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )

                TextField("Describe the thought...", text: $thought)
                    .padding(12)
                    .focused($isFocused)
            }
            .contentShape(Rectangle()) // Make the entire area tappable
            .onTapGesture {
                isFocused = true
            }
        }
        .padding(.vertical, 8)
    }
}
