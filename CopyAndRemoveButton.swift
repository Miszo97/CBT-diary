//
//  CopyAndRemoveButton.swift
//  CBT Thought Diary
//
//  Created by Artur Spek on 11/07/2025.
//


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