//
//  ImageModel.swift
//  sample Assessment 2
//
//  Created by shivakumar chirra on 11/08/25.
//

import Foundation
import CoreData
import SwiftUI

struct ImageItem: Identifiable {
    var id: UUID
    var name: String
    var category: String
    var isFavorite: Bool
}

extension ImageEntity {
    func toImageItem() -> ImageItem {
        ImageItem(
            id: self.id ?? UUID(),
            name: self.name ?? "",
            category: self.category ?? "",
            isFavorite: self.isFavourite
        )
    }
}
