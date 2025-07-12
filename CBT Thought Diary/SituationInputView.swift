import SwiftUI


struct SituationInputView: View {
    @Binding var situation: String
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Situation")
                .font(.headline)
                .foregroundColor(.primary)

            ZStack {
                // Background rectangle
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.2))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )

                // Transparent tap layer
                TextField("Describe the situation...", text: $situation)
                    .padding(12)
                    .focused($isFocused)
            }
            .contentShape(Rectangle()) // Expand tap area
            .onTapGesture {
                isFocused = true
            }
        }
        .padding(.vertical, 8)
    }
}
