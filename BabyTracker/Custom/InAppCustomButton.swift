//
//  InAppCustomButton.swift
//  BabyTracker
//
//  Created by Nesrin Bozan on 23.03.2023.
//

import Foundation
import UIKit

class InAppCustomButton: UIButton {
    private let leftView = SubPostView()
    private let rightView = SubPostView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 25
        layer.borderWidth = 0
        layer.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        
        addSubview(leftView)
        addSubview(rightView)
        
        leftView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-260)
        }
        
        rightView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLeftTitle(_ title: String?, iconImage: UIImage?) {
        leftView.configure(title: title, iconImage: iconImage)
    }
    
    func setRightTitle(_ title: String?, iconImage: UIImage?) {
        rightView.configure(title: title, iconImage: iconImage)
    }
    
}


