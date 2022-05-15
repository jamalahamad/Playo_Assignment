//
//  Articles.swift
//  Playo_Assignment
//
//  Created by Jamal Ahamad on 15/05/22.
//

import Foundation

class ArticlesDataModel: Codable {
    var articles: [Articles]?
    enum CodingKeys: String, CodingKey {
        case articles = "articles"
    }
    
    required init() {
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        articles = try values.decode([Articles].self, forKey: .articles)
        
    }
    
}

class Articles: Codable {
    var author: String?
    var title: String?
    var desc: String?
    var urlNewsWeb: String?
    var urlImage: String?
    
    
    enum CodingKeys: String, CodingKey {
        case author = "author"
        case title = "title"
        case desc = "description"
        case urlNewsWeb = "url"
        case urlImage = "urlToImage"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        author = try values.decode(String.self, forKey: .author)
        title = try values.decode(String.self, forKey: .title)
        desc = try values.decode(String.self, forKey: .desc)
        urlNewsWeb = try values.decode(String.self, forKey: .urlNewsWeb)
        urlImage = try values.decode(String.self, forKey: .urlImage)
    }
}


