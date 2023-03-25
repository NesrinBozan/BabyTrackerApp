//
//  InAppViewController.swift
//  BabyTracker
//
//  Created by Nesrin Bozan on 21.03.2023.
//
import SnapKit
import UIKit
import RevenueCat

class InAppViewController: UIViewController {
    
    private var selectedButton: InAppCustomButton? = nil
    
    let imageView = UIImageView()
    let subPostsContainer = UIView()
    let containerView = UIView()
    
    lazy var closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.setImage(UIImage(named: "btn_close"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return closeButton
    }()
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Get Premium"
        titleLabel.textColor = UIColor(red: 70/255, green: 37/255, blue: 195/255, alpha: 1)
        titleLabel.font = .boldSystemFont(ofSize: 27)
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    lazy var subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.text = "Subtitle"
        subtitleLabel.font = UIFont.systemFont(ofSize: 18)
        subtitleLabel.textAlignment = .center
        return subtitleLabel
    }()
    
    lazy var privacyLabel: UILabel = {
        let privacyLabel = UILabel()
        privacyLabel.text = "Privacy Policy |"
        privacyLabel.textColor = .black
        privacyLabel.font = .systemFont(ofSize: 9)
        privacyLabel.isUserInteractionEnabled = true
        privacyLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(privacyLabelTapped)))
        return privacyLabel
    }()
    
    lazy var restoreLabel: UILabel = {
        let restoreLabel = UILabel()
        restoreLabel.text = "Restore Purchase |"
        restoreLabel.textColor = .black
        restoreLabel.font = .systemFont(ofSize: 9)
        restoreLabel.isUserInteractionEnabled = true
        restoreLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(restoreLabelTapped)))
        return restoreLabel
    }()
    
    lazy var termsLabel: UILabel = {
        let termsLabel = UILabel()
        termsLabel.text = "Terms of Use"
        termsLabel.isUserInteractionEnabled = true
        termsLabel.textColor = .black
        termsLabel.font = .systemFont(ofSize: 9)
        termsLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(termsLabelTapped)))
        return termsLabel
    }()
    
    lazy  var  startButton:  UIButton = {
        let startButton = UIButton()
        startButton.setTitle("Start", for: .normal)
        startButton.tintColor = .white
        startButton.layer.cornerRadius = 25
        startButton.layer.borderWidth = 0
        startButton.backgroundColor =  UIColor.nextButtoColorn
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return startButton
    }()
    
    let weeklyButton = InAppCustomButton()
    let monthlyButton = InAppCustomButton()
    let annualButton = InAppCustomButton()
    let subPost1 = SubPostView()
    let subPost2 = SubPostView()
    let subPost3 = SubPostView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        createdGetCustomer()
        
        imageView.image = UIImage(named: "img_4")
        imageView.contentMode = .scaleAspectFit
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 25
        containerView.layer.shadowColor = UIColor(red: 0.569, green: 0.569, blue: 0.569, alpha: 1).cgColor
        containerView.layer.shadowOpacity = 3
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        containerView.layer.shadowRadius = 1
        
        weeklyButton.setLeftTitle("Weekly", iconImage: nil)
        weeklyButton.setRightTitle("$10", iconImage: nil)
        weeklyButton.tag = 1
        weeklyButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    
        monthlyButton.setLeftTitle("Monthly", iconImage: nil)
        monthlyButton.setRightTitle("$20", iconImage: nil)
        monthlyButton.tag = 2
        monthlyButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    
        annualButton.setLeftTitle("Annual", iconImage: nil)
        annualButton.setRightTitle("$30", iconImage: nil)
        annualButton.tag = 3
        annualButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        subPost1.configure(title: "Share the care", iconImage: UIImage(named: "icon_matter"))
        
        subPost2.configure(title: "All-in-one baby tracker", iconImage: UIImage(named: "icon_matter"))
        
        subPost3.configure(title: "Watch your babys growth", iconImage: UIImage(named: "icon_matter"))
        
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(121)
            make.top.equalToSuperview().offset(86)
            
        }
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(102)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(subPostsContainer)
        subPostsContainer.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(34)
            make.height.equalTo(100)
            make.leading.equalToSuperview().offset(80)
            make.trailing.equalToSuperview().offset(-50)
        }
        
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.equalTo(subPostsContainer.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(-0)
            make.bottom.equalToSuperview().offset(-0)
        }
        
        subPostsContainer.addSubview(subPost1)
        subPost1.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        subPostsContainer.addSubview(subPost2)
        subPost2.snp.makeConstraints { make in
            make.top.equalTo(subPost1.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview()
        }
        
        subPostsContainer.addSubview(subPost3)
        subPost3.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(26)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        containerView.addSubview(weeklyButton)
        weeklyButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.equalToSuperview().offset(27)
            make.trailing.equalToSuperview().offset(-28)
            make.height.equalTo(70)
            
        }
        
        containerView.addSubview(monthlyButton)
        monthlyButton.snp.makeConstraints { make in
            make.top.equalTo(weeklyButton.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(27)
            make.trailing.equalToSuperview().offset(-28)
            make.height.equalTo(70)
        }
        
        containerView.addSubview(annualButton)
        annualButton.snp.makeConstraints { make in
            make.top.equalTo(monthlyButton.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(27)
            make.trailing.equalToSuperview().offset(-28)
            make.height.equalTo(70)
        }
        
        containerView.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.top.equalTo(annualButton.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(27)
            make.trailing.equalToSuperview().offset(-28)
            make.height.equalTo(60)
        }
        
        containerView.addSubview(privacyLabel)
        privacyLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(startButton.snp.bottom).offset(16)
        }
        
        containerView.addSubview(restoreLabel)
        restoreLabel.snp.makeConstraints { make in
            make.trailing.equalTo(privacyLabel.snp.leading).offset(-8)
            make.centerY.equalTo(privacyLabel)
        }
        
        containerView.addSubview(termsLabel)
        termsLabel.snp.makeConstraints { make in
            make.leading.equalTo(privacyLabel.snp.trailing).offset(8)
            make.centerY.equalTo(privacyLabel)
        }
        
    }
    
    func createdGetCustomer(){
        Purchases.shared.getCustomerInfo { [weak self ] info , error in
            guard let info = info , error == nil else { return}
            
            if info.entitlements.all["Premium"]?.isActive == true {
                let backVC = LoginInformationViewController()
                backVC.modalPresentationStyle = .fullScreen
                self!.present(backVC, animated: true)
            }else {
                DispatchQueue.main.async {
                    
                }
            }
        }
    }
    
    @objc func closeButtonTapped(){
        let loginVC = LoginInformationViewController()
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true)
    }
    
    @objc private func buttonTapped(_ sender: InAppCustomButton) {
        
        selectedButton?.isSelected = false
        sender.isSelected = true
        selectedButton = sender
        selectedButton?.setBackgroundImage(UIImage(named: "btn_selected"), for: .selected)
           if sender.tag == 1 {
            fetchPackage(input: "$rc_weekly") {[weak self] package in
                self?.purchase(package: package)
            }
            print("weekly")
               
            } else if sender.tag == 2 {
                fetchPackage(input: "$rc_monthly") {[weak self] package in
                    self?.purchase(package: package)
            }
                print("monthly")
                
            } else if sender.tag == 3 {
              fetchPackage(input: "$rc_anuual") {[weak self] package in
              self?.purchase(package: package)
        }
                print("annual")
        }
    }
    
    @objc func startButtonTapped(){
        let loginVC = LoginInformationViewController()
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true)
    }

    func fetchPackage(input: String, completion: @escaping (RevenueCat.Package) -> Void ) {
        Purchases.shared.getOfferings { offerings, error in
            guard let offerings = offerings, error == nil else {
                return
     }
        guard let package = offerings.all.first?.value.package(identifier: input) else {
             return
     }
        completion(package)
    }
  }
    
    func purchase(package: RevenueCat.Package) {
        Purchases.shared.purchase(package: package) { transaction, info, error, userCancelled in
            guard let transaction = transaction,
            let info = info,
                error == nil, !userCancelled else {
                return
    }
        if info.entitlements.all["Premium"]?.isActive == true {
            let vc = LoginInformationViewController()
                self.navigationController?.pushViewController(vc, animated: true)
                } else {
                DispatchQueue.main.async {
                        print("purchase error")
            }
        }
    }
}
                
    func restorePurchases() {
        Purchases.shared.restorePurchases { info, error in
            guard let info = info, error == nil else { return}
        }
        
    }
    
    @objc func privacyLabelTapped() {
        
    }
    
    @objc func restoreLabelTapped() {
        
    }
    
    @objc func termsLabelTapped() {
        
    }
                }
                
 
