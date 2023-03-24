//
//  APIFilm.swift
//  HugoJenouvrier
//
//  Created by Cours on 24/03/2023.
//

import Foundation

struct APIFilm: Codable {
    let id: Int
    let title: String
    let description: String
    let imagePath: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description = "overview"
        case imagePath = "poster_path"
    }
}

