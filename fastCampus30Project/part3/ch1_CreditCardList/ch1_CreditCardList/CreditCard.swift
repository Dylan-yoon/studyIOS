//
//  CreditCard.swift
//  ch1_CreditCardList
//
//  Created by 윤병희 on 2022/01/05.
//

import Foundation

struct CreditCard: Codable {
    let id: Int
    let rank : Int
    let name : String
    let cardImageURL : String
    let promotionDetail : promotionDetail
    let isSelected : Bool
}

struct promotionDetail : Codable {
    let companyName : String
    let amount : Int
    let period : String
    let condition : String
    let benefitDate : String
    let benefitDetail : String
    let benefitCondition: String
}



//Json 형태를 모두 객채화 해놓고 이 내용들을 tableView의 cell에 뿌려준다!
