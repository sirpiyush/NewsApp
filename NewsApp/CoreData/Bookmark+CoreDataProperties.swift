//
//  Bookmark+CoreDataProperties.swift
//  NewsApp
//
//  Created by Dipendra Dubey on 29/09/24.
//
//

import Foundation
import CoreData


extension Bookmark {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bookmark> {
        return NSFetchRequest<Bookmark>(entityName: "Bookmark")
    }

    @NSManaged public var author: String?
    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var url: String?
    @NSManaged public var urlToImage: String?
    @NSManaged public var publishedAt: Date?
    @NSManaged public var content: String?
    @NSManaged public var id: UUID?

}

extension Bookmark : Identifiable {
    func getArticle() -> Article? {
          Article(title: title, description: description, url: url, urlToImage: urlToImage, publishedAt: publishedAt)
      }
}
