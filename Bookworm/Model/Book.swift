//
//  Student.swift
//  Bookworm
//
//  Created by Amr El-Fiqi on 07/02/2025.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    
    init(title: String, author: String, genre: String, review: String, rating: Int) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
    }
}
