//
//  CustomTableViewCell.swift
//  BabyTracker
//
//  Created by Nesrin Bozan on 21.03.2023.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    let cellReuseIdentifier = "CustomCell"
    
     private let upperLeftImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let  upperLeftLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let  lowerLeftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_calender2")
        return imageView
    }()
    
    private let  lowerLeftLabel: UILabel = {
        let label = UILabel()
        label.text = "\(Date().getCurrentDate())"
        return label
    }()
    
    private let  rightLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private let  lineView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "line")
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(red: 243/255.0, green: 243/255.0, blue: 243/255.0, alpha: 1.0)
             contentView.addSubview(upperLeftImageView)
             contentView.addSubview(upperLeftLabel)
             contentView.addSubview(lowerLeftImageView)
             contentView.addSubview(lowerLeftLabel)
             contentView.addSubview(rightLabel)
             contentView.addSubview(lineView)
             
             let middleView = UIView()
             contentView.addSubview(middleView)
             
             lowerLeftImageView.snp.makeConstraints { make in
                 make.top.equalToSuperview().offset(2)
                 make.leading.equalTo(10)
                 make.width.height.equalTo(50)
             }
             
             lowerLeftLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(18)
                 make.leading.equalTo(54)
             }
             
             lineView.snp.makeConstraints { make in
                 make.top.equalTo(47)
                 make.width.equalTo(440)
                 make.height.equalTo(1)
             }
             
             upperLeftImageView.snp.makeConstraints { make in
                 make.bottom.equalToSuperview().offset(-10)
                 make.leading.equalTo(10)
                 make.width.height.equalTo(30)
             }
             
             upperLeftLabel.snp.makeConstraints { make in
                 make.bottom.equalToSuperview().offset(-13)
                 make.leading.equalTo(50)
             }
             
             rightLabel.snp.makeConstraints { make in
                 make.bottom.equalToSuperview().offset(-13)
                 make.trailing.equalToSuperview().offset(-14)
             }
         }
    
    func configure(model: ActivityModel) {

        
        switch model.type {
        case .Sleep:
            upperLeftImageView.image = UIImage(named: "icon_sleep_blue")
            upperLeftLabel.text = "Sleep"
            rightLabel.text = model.time
        case .Feed:
            upperLeftImageView.image = UIImage(named: "icon_feeding_purple")
            upperLeftLabel.text = "Feed"
            rightLabel.text = model.time
        case .Diaper:
            upperLeftImageView.image = UIImage(named: "icon_diaper_green")
            upperLeftLabel.text = "Diaper"
            rightLabel.text = model.time
        default:
            break
        }
     }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
        contentView.layer.cornerRadius = 25
        contentView.layer.masksToBounds = true
    
   
        
    }
       
}

