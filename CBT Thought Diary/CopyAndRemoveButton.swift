import SwiftUI

struct CopyAndRemoveButton: View {
    var combinedText: String
    @Binding var records: [Record]
    
    var body: some View {
        Button("Copy and Remove") {
            // Copy to clipboard (iOS and macOS)
            #if os(iOS)
            UIPasteboard.general.string = combinedText
            #elseif os(macOS)
            let pasteboard = NSPasteboard.general
            pasteboard.clearContents()
            pasteboard.setString(combinedText, forType: .string)
            #endif
            
            // Clear stored records
            UserDefaults.standard.removeObject(forKey: "records")
            records = []
        }.padding(.horizontal)
    }
}
