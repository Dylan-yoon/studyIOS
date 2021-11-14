import Foundation


/*
 protocol names {
     
 }
 */


protocol SomeProtocol {
    
}

protocol SomeProtocol2 {
    
}


struct SomeStructure : SomeProtocol , SomeProtocol2 {
    
}


protocol FirstProtocol {
    var name: String { get set }       //읽기쓰기
    var age: Int { get }            //읽기전용
}


//타입 프로퍼티를 요구하기 위해서 static사용해야한다

protocol AnotherProtocol {
   static var someTypeProperty : Int { get set }
}

protocol FullyNames {
    var fullName : String { get set }
}

struct Person : FullyNames {
    var fullName: String
}


