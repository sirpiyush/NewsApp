//
//  Article.swift
//  NewsApp
//
//  Created by Dipendra Dubey on 25/09/24.
//

import Foundation

struct NewsResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Decodable, Identifiable {
    // You can customize these fields as per the actual structure of your articles
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    var id = UUID()
    
    private enum CodingKeys: String, CodingKey {
            case title, description, url, urlToImage, publishedAt
    }
    
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.title = try container.decodeIfPresent(String.self, forKey: .title)
            self.description = try container.decodeIfPresent(String.self, forKey: .description)
            self.url = try container.decodeIfPresent(String.self, forKey: .url)
            self.urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage)
            self.publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt)
            
            // 'id' is generated automatically, so it's not decoded from JSON
        }
}
