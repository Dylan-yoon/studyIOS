//
//  Beer.swift
//  ch7_Brewery
//
//  Created by 윤병희 on 2022/01/28.
//

import Foundation


struct Beer: Decodable {
    let id: Int?
    let name, taglineString, description, brewersTips, imageURL: String?
    let foodPairing: [String]?
    
    var tagLine: String {
        let tags = taglineString?.components(separatedBy: ". ")
        let hashtags = tags?.map { "#" + $0.replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: ".", with: "")
            .replacingOccurrences(of: ",", with: " #")
        }
        return hashtags?.joined(separator: " ") ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, description
        case taglineString = "tagline"
        case imageURL = "image_url"
        case brewersTips = "brewers_tips"
        case foodPairing = "food_pairing"
    }
}



// 아래 프로토콜 오류.. 왜일까?

//
//struct Beer : Decodable {
//    let id : Int?
//    let name, taglineString, description, brewersTip, imageURL : String?
//    let foodParing: [String]?
//
//    var tagLine : String {
//        let tags = taglineString?.components(separatedBy: ". ")
//        let hashtags = tags?.map {
//            "#" + $0.replacingOccurrences(of: " ", with: "")
//                .replacingOccurrences(of: ".", with: "")
//                .replacingOccurrences(of: ",", with: " #")
//        }
//
//        return hashtags?.joined(separator: " ") ?? "" //#tag #good #hello
//    }
//
//    enum CodingKeys : String, CodingKey {
//        case id, name, description
//        case taglineString = "tagline"
//        case imageURL = "image_url"
//        case brewersTips = "brewers_tips"
//        case foodParing = "food_paring"
//    }
//}


