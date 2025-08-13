//
//  ImageEntity+CoreDataProperties.swift
//  sample Assessment 2
//
//  Created by shivakumar chirra on 11/08/25.
//
//

import Foundation
import CoreData


extension ImageEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageEntity> {
        return NSFetchRequest<ImageEntity>(entityName: "ImageEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var isFavourite: Bool
    @NSManaged public var name: String?
    @NSManaged public var category: String?

}

extension ImageEntity : Identifiable {

}
