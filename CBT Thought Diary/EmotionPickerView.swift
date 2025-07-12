//
//  EmotionPicker.swift
//  CBT Thought Diary
//
//  Created by Artur Spek on 10/07/2025.
//

import SwiftUI

struct EmotionPickerView: View {
    var title: String = "Emotion"
    var options: [String] = []

    @Binding var selected: Set<Emotion>
    @State private var showingPopover = false

    var body: some View {
        Button {
            showingPopover = true
        } label: {
            Label(title, systemImage: "chevron.down")
                .padding()
                .background(Color.blue.opacity(0.2))
                .cornerRadius(8)
        }
        .popover(isPresented: $showingPopover, arrowEdge: .bottom) {
            VStack(alignment: .leading) {

                List {
                    ForEach(options, id: \.self) { option in
                        MultiplePickerRow(option: option, selected: $selected)
                    }
                }

                Button("Done") {
                    showingPopover = false
                }
                .frame(maxWidth: .infinity)
                .background(Color.blue.opacity(0.1))
                .font(.title2)
            }
        }
    }
}
