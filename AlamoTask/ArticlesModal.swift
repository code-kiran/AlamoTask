//
//  ArticlesModal.swift
//  AlamoTask
//
//  Created by kiran on 9/7/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import Foundation
class Umbrella:NSObject {
    let status: String?
    let totalResults: Int?
    let articles: Article?
    
    init(umbrellaJson: NSDictionary) {
        self.status = umbrellaJson["status"] as? String
        self.totalResults = umbrellaJson["totalResults"] as? Int
        self.articles = Article(articleJson: (umbrellaJson["articles"] as? NSDictionary)!)
        
    }
}

class Article: NSObject {
    let source: Source?
    let author: String?
    let title: String?
    let desc: String?
    let url:String?
    let urlToImage: String?
    let publishedAt: String?
    
    init(articleJson: NSDictionary) {
        self.source = Source(sourceJson: (articleJson["source"] as? NSDictionary)!)
        self.author = articleJson["author"] as? String
        self.title = articleJson["title"] as? String
        self.desc = articleJson["description"] as? String
        self.url = articleJson["url"] as? String
        self.urlToImage = articleJson["urlToImage"] as? String
        self.publishedAt = articleJson["publishedAt"] as? String
        
    }
}

class Source {
    let id: String?
    let name: String?
    
    init(sourceJson: NSDictionary) {
        self.id = sourceJson["id"] as? String
        self.name = sourceJson["name"] as? String
    }
}


