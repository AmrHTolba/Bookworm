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
class Students {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
