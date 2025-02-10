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
                        HStack(alignment: .top) {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBook)
                
            }
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
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
        .sheet(isPresented: $showingAddScreen) {
            AddBookView()
        }
    }
    
    func deleteBook(at offsets: IndexSet) {
        for index in offsets {
            let book = books[index]
            modelContext.delete(book) // Delete from SwiftData
        }
    }
}

#Preview {
    ContentView()
}
