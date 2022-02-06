//
//  Repository.swift
//  GitHubRepository
//
//  Created by Byoung_wook on 2022/01/16.
//

import Foundation

struct Repository: Decodable {
    let id: Int
    let name: String
    let description: String
    let stargazersCount: Int
    let language: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, language
        case stargazersCount = "stargazers_count"
    }
}



//let nameLabel = UILabel()
//let descriptionLabel = UILabel()
//let starImageView = UIImageView()
//let starLabel = UILabel()
//let languageLabel = UILabel()
