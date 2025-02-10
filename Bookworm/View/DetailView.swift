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
    
    
    // MARK: - Body
    var body: some View {
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
               .foregroundStyle(.secondary)
           
           Text(book.review)
               .padding()
           
           RatingView(rating: .constant(book.rating))
       }
       .navigationTitle(book.title)
       .navigationBarTitleDisplayMode(.inline)
       .scrollBounceBehavior(.basedOnSize)
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
