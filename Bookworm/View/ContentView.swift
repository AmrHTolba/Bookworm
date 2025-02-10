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
    @Query(sort: [SortDescriptor(\Book.title), SortDescriptor(\Book.author)]) var books: [Book]
    @Environment(\.modelContext) var modelContext
    
    @State private var showingAddScreen = false
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.purple.opacity(0.8), Color.blue.opacity(0.6)]),startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                List {
                    ForEach(books) { book in
                        NavigationLink(value: book) {
                            HStack(alignment: .top) {
                                EmojiRatingView(rating: book.rating)
                                    .font(.largeTitle)
                                    .frame(width: 50, height: 50)
                                
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
                .scrollContentBackground(.hidden) // Hides default list background
                .background(Color.clear)
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
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
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
