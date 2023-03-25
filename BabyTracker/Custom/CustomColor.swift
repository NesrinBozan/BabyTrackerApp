//
//  CustomColor.swift
//  BabyTracker
//
//  Created by Nesrin Bozan on 23.03.2023.
//

import Foundation
import UIKit

extension UIColor {
    static let nextButtoColorn  = UIColor(red: 0.275, green: 0.147, blue: 0.767, alpha: 1)
    
}

extension Date {
    func getCurrentDate() -> String {
        let formatter = DateFormatter()
            formatter.dateFormat = "E, MMMd"
            return formatter.string(from: self)
    }
}


extension UITextField {
    func setCommonStyle() {
        self.font = UIFont(name: "Poppins-Medium", size: 14)
        self.backgroundColor = UIColor(red: 0.953, green: 0.953, blue: 0.953, alpha: 1)
        self.layer.cornerRadius = 25
    }
}
