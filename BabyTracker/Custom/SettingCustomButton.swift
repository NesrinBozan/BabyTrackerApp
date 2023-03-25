//
//  SettingCustomButton.swift
//  BabyTracker
//
//  Created by Nesrin Bozan on 23.03.2023.
//

import Foundation
import UIKit


class CustomButton: UIButton {

    private let leftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let rightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let customTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()

    init(frame: CGRect = .zero, text: String, color: UIColor) {
        super.init(frame: frame)
        setupViews(text: text, color: color)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setupViews(text: String, color: UIColor) {
        backgroundColor = UIColor(red: 0.953, green: 0.953, blue: 0.953, alpha: 1)
        layer.cornerRadius = 25

        addSubview(leftImageView)
        leftImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(21)
            make.centerY.equalToSuperview()
        }

        addSubview(rightImageView)
        rightImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-21)
            make.centerY.equalToSuperview()
        }

        addSubview(customTitleLabel)
        customTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(leftImageView.snp.trailing).offset(4)
            make.centerY.equalToSuperview()
        }

        customTitleLabel.textColor = color
        customTitleLabel.text = text
    }

    var leftImage: UIImage? {
        didSet {
            leftImageView.image = leftImage
        }
    }

    var rightImage: UIImage? {
        didSet {
            rightImageView.image = rightImage
        }
    }

    func setTitle(_ title: String?) {
        customTitleLabel.text = title
    }

}

