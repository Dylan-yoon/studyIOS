//
//  CardListViewController.swift
//  ch1_CreditCardList
//
//  Created by 윤병희 on 2022/01/05.
//

import UIKit
import Kingfisher
import FirebaseDatabase

class CardListViewController : UITableViewController {
    var ref: DatabaseReference! // Firebase Realtime Database
    
    var creditCardList : [CreditCard] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UITableView Cell Register
        let nibName = UINib(nibName: "CardListCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "CardListCell")
        
        ref = Database.database().reference()
        
        ref.observe(.value) { snapshot in
            guard let value = snapshot.value as? [String: [String: Any]] else { return }
            
            //제이슨 디코딩
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: value)
                let cardData = try JSONDecoder().decode([String: CreditCard].self, from: jsonData)
                let cardList = Array(cardData.values)
                self.creditCardList = cardList.sorted { $0.rank < $1.rank }
                
                //mainThread에 해당 엑션을 넣어주는것....?
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print("ERROR JSON parsing \(error.localizedDescription)")
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creditCardList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardListCell", for: indexPath) as? CardListCell else { return UITableViewCell() }
        
        cell.rankLabel.text = "\(creditCardList[indexPath.row].rank)"
        cell.promotionLabel.text = "\(creditCardList[indexPath.row].promotionDetail.amount)만원 증정"
        cell.cardNameLabel.text = "\(creditCardList[indexPath.row].name)"
        //CardListCell에서 각Cell에 해당하는 outlet 속성 변경
        let imageURL = URL(string: creditCardList[indexPath.row].cardImageURL)
        cell.cardImageView.kf.setImage(with: imageURL)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //상세 화면 전달
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let detailViewController = storyboard.instantiateViewController(identifier: "CardDetailViewController") as? CardDetailViewController else { return }
        
        detailViewController.promotionDetail = creditCardList[indexPath.row].promotionDetail
        self.show(detailViewController, sender: nil)
         
        
        //경로를 모를 때 Option1
//        let cardID = creditCardList[indexPath.row].id
//        ref.child("Item\(cardID)/isSelected").setValue(true)
        
        //경로를 알 때 Option2
//        ref.queryOrdered(byChild: "id").queryEqual(toValue: cardID).observe(.value){[weak self] snapshot in
//            guard let self = self,
//                  let value = snapshot.value as? [String: [String:Any]],
//                  let key = value.keys.first else { return }
//
//            self.ref.child("\(key)/isSelected").setValue(true)
//        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Option1
            let cardID = creditCardList[indexPath.row].id
            ref.child("Item\(cardID)").removeValue()
            
            //Option2
//            ref.queryOrdered(byChild: "id").queryEqual(toValue: cardID).observe(.value) { [weak self] snapshot in
//                guard let self = self,
//                      let value = snapshot.value as? [String: [String : Any]],
//                      let key = value.keys.first else { return }
//                
//                ref.child(key).removeValue()
//            }
        }
    }
}


//이미지를 모든 기기에 저장해서 쓰는것이 아닌,,, 이미지URL 만 전달받은 상태에서 이미지뷰에 표현,,, 이 오픈소스를 킹피셔 KingFisher
