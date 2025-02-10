//
//  DetailView.swift
//  Bookworm
//
//  Created by Amr El-Fiqi on 10/02/2025.
//

import SwiftData
import SwiftUI

struct DetailView: View {
    // MARK: - Properties
    let book: Book
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    
    // MARK: - Body
    var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.purple.opacity(0.8), Color.blue.opacity(0.6)]),startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
                                
                
                ScrollView {
                    ZStack(alignment: .bottomTrailing) {
                        Image(book.genre)
                            .resizable()
                            .scaledToFit()
                        
                        Text(book.genre.uppercased())
                            .font(.caption)
                            .fontWeight(.black)
                            .padding(8)
                            .foregroundColor(.white)
                            .backgroundStyle(.black.opacity(0.75))
                            .clipShape(.capsule)
                            .offset(x: -5, y: -5)
                    }
                    
                    Text(book.author)
                        .font(.title)
                        .foregroundStyle(.white.opacity(0.8))
                    
                    
                    Text(book.review)
                        .padding()
                        .foregroundColor(.white)
                        .background(.black.opacity(0.4))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    
                    
                    RatingView(rating: .constant(book.rating))
                    
                }
                .navigationTitle(book.title)
                .navigationBarTitleDisplayMode(.inline)
                .scrollBounceBehavior(.basedOnSize)
                .alert("Delete book", isPresented: $showingDeleteAlert) {
                    Button("Delete", role: .destructive, action: deleteBook)
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("Are you sure?")
                }
                .toolbar {
                    Button("Delete this book", systemImage: "trash") {
                        showingDeleteAlert = true
                    }
                }
            }
   }
    
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
}

#Preview {
    
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "First", author: "Amr", genre: "Fantasy", review: "It is a test dude, grow up", rating: 5)
        
        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Error: \(error.localizedDescription)")
    }
}
