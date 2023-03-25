//
//  subPostViewCustom.swift
//  BabyTracker
//
//  Created by Nesrin Bozan on 23.03.2023.
//

import Foundation
import UIKit

class SubPostView: UIView {
    
    private let titleLabel = UILabel()
    private let iconImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        addSubview(iconImageView)
        addSubview(titleLabel)
        
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(46)
            make.height.equalTo(46)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(iconImageView.snp.trailing).offset(1)
            make.trailing.equalToSuperview()
        }
    }
    
    func configure(title: String?, iconImage: UIImage?) {
        titleLabel.text = title
        iconImageView.image = iconImage
    }
}
