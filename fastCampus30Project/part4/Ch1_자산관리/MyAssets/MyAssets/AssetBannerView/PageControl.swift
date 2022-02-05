//
//  PageControl.swift
//  MyAssets
//
//  Created by 윤병희 on 2022/02/05.
//

import SwiftUI

struct PageControl: UIViewRepresentable {
    var numberOfPage : Int
    @Binding var currentPage : Int
    
    func makeCoordinator() -> Coordinator {
         Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPage
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged
        )
        
        return control
        
    }
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator : NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc func updateCurrentPage(sender : UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
