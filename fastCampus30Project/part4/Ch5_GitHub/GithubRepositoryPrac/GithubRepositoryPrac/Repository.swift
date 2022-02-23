//
//  Repository.swift
//  GithubRepositoryPrac
//
//  Created by 윤병희 on 2022/02/21.
//

import UIKit

struct Repository : Decodable {
    let id : Int
    let name : String
    let description : String
    let stargazersCount : Int
    let language: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, language
        case stargazersCount = "stargazers_count"
    }
}
