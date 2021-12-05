//
//  UIButtonExtension.swift
//  iOS-Calculator
//
//  Created by Jose Maria Gomez Cereto on 5/12/21.
//

import UIKit

extension UIButton {
    
    //Borde redondeado
    func round() {
        layer.cornerRadius = bounds.height / 2.3
        clipsToBounds = true
    }
    
    //Brillar
    func shine() {
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
            
        }
    }
}
