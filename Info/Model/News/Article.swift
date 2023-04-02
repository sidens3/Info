//
//  Article.swift
//  Info
//
//  Created by Михаил Зиновьев on 31.03.2023.
//

import Foundation

struct Article: Codable {
    var source: Source
    var author: String?
    var title: String
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String
    var content: String?
}

// MARK: - Default object
extension Article {
    static func getDefault() -> Article {
        Article(source: Source(id: "ars-technica", name: "Ars Technica"),
                author: "Kevin Purdy",
                title: "Nvidia’s GameStream is dead. Sunshine and Moonlight are great replacements.",
                description: "What started as a hackathon project is now a full-fledged streaming platform.",
                url: "https://arstechnica.com/gaming/2023/04/nvidias-gamestream-is-dead-sunshine-and-moonlight-are-better-replacements/",
                urlToImage: "https://cdn.arstechnica.net/wp-content/uploads/2023/03/gamestream_ipad-760x380.jpg",
                publishedAt: "2023-04-01T11:30:54Z",
                content: "Enlarge/ I wish I had more games installed for iPad-on-the-couch photo purposes, but I just don't keep that many games on my drive at once!\r\n0 with \r\nNvidia's GameStream had one job, the one in its n… [+3426 chars]")
    }
}
