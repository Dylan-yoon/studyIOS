import UIKit



let hello = { () -> () in
    print("hello")
}
hello()


let hello2 = { (name: String) -> String in
    return "Hello, \(name)"
}
