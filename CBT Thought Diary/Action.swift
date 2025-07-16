import SwiftUI

struct Action: View {
    @Binding var action: String
    @FocusState private var isFocused: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Action")
                .font(.headline)
                .foregroundColor(.primary)

            ZStack {
                // Background and border
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.2))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )

                // TextField
                TextField("What were your action", text: $action)
                    .padding(12)
                    .focused($isFocused)
            }
            .contentShape(Rectangle()) // Make entire area tappable
            .onTapGesture {
                isFocused = true
            }
        }
        .padding(.vertical, 4)
    }
}
