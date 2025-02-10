//
//  ContentView.swift
//  Bookworm
//
//  Created by Amr El-Fiqi on 07/02/2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @Query var books: [Book]
    @Environment(\.modelContext) var modelContext
    
    @State private var showingAddScreen = false
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            VStack {
                                Text("Title: \(book.title)")
                                    .font(.headline)
                                Text("Authoer: \(book.author)")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    
                }
            }
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Book", systemImage: "plus") {
                            showingAddScreen.toggle()
                        }
                    }
                }
        }
        .sheet(isPresented: $showingAddScreen) {
            AddBookView()
        }
    }
}

#Preview {
    ContentView()
}
