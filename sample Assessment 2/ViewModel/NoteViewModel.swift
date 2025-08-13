//
//  NoteModel.swift
//  sample Assessment 2
//
//  Created by Netaxis on 08/08/25.
//


import Foundation
import Foundation
import CoreData
import SwiftUI

class ImageViewModel: ObservableObject {
    @Published var images: [ImageItem] = []
    private let context = PersistenceController.shared.container.viewContext

    init() {
        fetchImages()
    }

    func fetchImages() {
        let request: NSFetchRequest<ImageEntity> = ImageEntity.fetchRequest()
        do {
            let result = try context.fetch(request)
            self.images = result.map { $0.toImageItem() }
        } catch {
            print("Error fetching: \(error)")
        }
    }

    func addImage(name: String, category: String) {
        let newImage = ImageEntity(context: context)
        newImage.id = UUID()
        newImage.name = name
        newImage.category = category
        newImage.isFavourite = false
        save()
    }

    func toggleFavorite(for image: ImageItem) {
        let request: NSFetchRequest<ImageEntity> = ImageEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", image.id as CVarArg)
        if let entity = try? context.fetch(request).first {
            entity.isFavourite.toggle()
            save()
        }
    }

    private func save() {
        do {
            try context.save()
            fetchImages()
        } catch {
            print("Error saving: \(error)")
        }
    }
}
