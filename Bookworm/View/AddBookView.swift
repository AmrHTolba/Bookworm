//
//  AddBookView.swift
//  Bookworm
//
//  Created by Amr El-Fiqi on 07/02/2025.
//

import SwiftData
import SwiftUI

struct AddBookView: View {
    // MARK: - Properties
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.purple.opacity(0.8), Color.blue.opacity(0.6)]),startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                Form {
                    Section {
                        TextField("Title", text: $title)
                            .submitLabel(.next)
                        TextField("Author", text: $author)
                            .submitLabel(.done)
                            .onSubmit {
                                hideKeyboard()
                            }
                        Picker("Genre", selection: $genre) {
                            ForEach(genres, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    
                    Section("Write a review") {
                        TextEditor(text: $review)
                            .submitLabel(.done)
                            .onSubmit { hideKeyboard()}
                        RatingView(rating: $rating)
                    }
                    
                    Section {
                        Button("Save") {
                            let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                            modelContext.insert(newBook)
                            dismiss()
                        }
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}


// MARK: - Extension
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
