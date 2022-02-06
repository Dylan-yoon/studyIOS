//
//  Asset.swift
//  MyAssets
//
//  Created by 윤병희 on 2022/02/06.
//

import Foundation

class Asset : Identifiable, ObservableObject, Decodable {
    let id : Int
    let type : AssetMenu
    let data : [AssetData]
    
    init(id : Int, type: AssetMenu, data : [AssetData] ) {
        self.id = id
        self.type = type
        self.data = data
    }
    
}

class AssetData : Identifiable, ObservableObject, Decodable {
    let id: Int
    let title : String
    let amount : String
    let creditCardAmounts : [CreditCardAmounts]?
    
    init(id: Int , title : String , amount : String , creditCardAmounts : [CreditCardAmounts]? = nil) {
        self.id = id
        self.title = title
        self.amount = amount
        self.creditCardAmounts = creditCardAmounts
    }
}

enum CreditCardAmounts : Identifiable, Decodable {
    case previousMonth(amount : String)
    case currentMount(amount : String)
    case nextMount(amount: String)
    
    var id : Int {
        switch self {
        case .previousMonth:
            return 0
        case .currentMount:
            return 1
        case .nextMount:
            return 2
        }
    }
    var amount : String {
        switch self {
        case .previousMonth(let amount),
                .currentMount(let amount),
                .nextMount(let amount):
            return amount
        }
    }
    
    enum CodingKeys : String, CodingKey {
        case previousMount
        case currentMount
        case nextMount
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try? values.decode(String.self, forKey: .previousMount){
            self = .previousMonth(amount: value)
            return
        }
        
        if let value = try? values.decode(String.self, forKey: .currentMount){
            self = .currentMount(amount: value)
            return
        }
        if let value = try? values.decode(String.self, forKey: .nextMount){
            self = .nextMount(amount: value)
            return
        }
        
        throw fatalError("ERROR: CreditCardAmounts JSON Decoding")
         
    }
    
}
