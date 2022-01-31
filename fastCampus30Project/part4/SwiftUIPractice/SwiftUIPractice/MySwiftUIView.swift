//
//  MySwiftUIView.swift
//  SwiftUIPractice
//
//  Created by 윤병희 on 2022/01/30.
//

import SwiftUI

struct MySwiftUIView: View {
    var body: some View {
        VStack{
            Text("Hello, World!")
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct MySwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MySwiftUIView()
    }
}
