import SwiftUI


struct ExpandableView: View {
    @State private var isExpanded = false

    var body: some View {
        VStack(spacing: 10) {
            Button(action: {
                    isExpanded.toggle()
            }) {
                HStack {
                    Text("Miłość")
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            }

            if isExpanded {
                HStack {
                    Button("25") {}
                    Spacer()
                    Button("50") {}
                    Spacer()
                    Button("75") {}
                    Spacer()
                    Button("100") {}
                }
                .padding()
            }
        }
        .padding()
    }
}

import SwiftUI


#Preview {
    ExpandableView()
}
