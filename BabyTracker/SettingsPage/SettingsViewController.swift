//
//  SettingsViewController.swift
//  BabyTracker
//
//  Created by Nesrin Bozan on 21.03.2023.
//
import UIKit

class SettingsViewController: UIViewController {
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btn_back"), for: .normal)
       button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Settings"
        titleLabel.textColor = UIColor(red: 70/255, green: 37/255, blue: 195/255, alpha: 1.0)
        titleLabel.font = .systemFont(ofSize: 27, weight: .bold)
      
        return titleLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUIDesign()
    }
    
    func setupUIDesign(){
        
        let getPremium = CustomButton( text: "Premium", color: .white)
        getPremium.leftImage = UIImage(named: "star")
        getPremium.rightImage = UIImage(named: "icon_right_grey")
        getPremium.setBackgroundImage(UIImage(named: "img_premium"), for: .normal)

        
        let rateUsButton = CustomButton( text: "Rate Us", color: .black)
        rateUsButton.leftImage = UIImage(named: "icon_rate")
        rateUsButton.rightImage = UIImage(named: "icon_right_grey")

        let termOfUSeButton = CustomButton( text: "Terms Of Use", color: .black)
        termOfUSeButton.leftImage = UIImage(named: "icon_terms")
        termOfUSeButton.rightImage = UIImage(named: "icon_right_grey")

        let privacyButton = CustomButton( text: "Privacy Policy", color: .black)
        privacyButton.leftImage = UIImage(named: "icon_privacy")
        privacyButton.rightImage = UIImage(named: "icon_right_grey")

        let contactButton = CustomButton( text: "Contact Us", color: .black)
        contactButton.leftImage = UIImage(named: "icon_contact")
        contactButton.rightImage = UIImage(named: "icon_right_grey")

        let restorePButton = CustomButton( text: "Restore Purchase", color: .black)
        restorePButton.leftImage = UIImage(named: "icon_restore")
        restorePButton.rightImage = UIImage(named: "icon_right_grey")
        

        view.addSubview(backButton)
        view.addSubview(getPremium)
        view.addSubview(rateUsButton)
        view.addSubview(termOfUSeButton)
        view.addSubview(privacyButton)
        view.addSubview(contactButton)
        view.addSubview(restorePButton)

        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalTo(20)
            make.width.height.equalTo(45)
        }
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalTo(150)
            make.height.equalTo(45)
            make.width.equalTo(120)
            }
        
        getPremium.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalToSuperview().offset(140)
            make.height.equalTo(81)
        }
        
        rateUsButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(240)
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalTo(termOfUSeButton.snp.top).offset(-20)
            make.height.equalTo(60)
        }

        termOfUSeButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalTo(privacyButton.snp.top).offset(-20)
            make.height.equalTo(60)
        }

        privacyButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalTo(contactButton.snp.top).offset(-20)
            make.height.equalTo(60)
        }

        contactButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalTo(restorePButton.snp.top).offset(-20)
            make.height.equalTo(60)
        }

        restorePButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(contactButton.snp.bottom).offset(20)
            make.height.equalTo(60)
        }
    }
    
    @objc func backButtonTapped() {
        let backVC = HomePageViewController()
        backVC.modalPresentationStyle = .fullScreen
        present(backVC, animated: true)
    }
}


