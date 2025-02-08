//
//  RatingView.swift
//  Bookworm
//
//  Created by Amr El-Fiqi on 07/02/2025.
//

import SwiftUI

struct RatingView: View {
    // MARK: - Properties
    @Binding var rating: Int
    
    var label = ""
    
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    // MARK: - Body
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id:\.self) { number in
                Button {
                    rating = number
                } label: {
                    rating(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
                .buttonStyle(.plain)
                
            }
        }
    }
    
    
    func rating(for number: Int) -> Image {
        if number > rating {
             offImage ?? onImage
        } else  {
            onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(3))
}
