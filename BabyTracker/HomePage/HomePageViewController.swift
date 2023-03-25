//
//  HomePageViewController.swift
//  BabyTracker
//
//  Created by Nesrin Bozan on 21.03.2023.
//

import UIKit
import SnapKit
import CoreData

class HomePageViewController: UIViewController {
    
    let selectionView = UIView()
    
    lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btn_settings"), for: .normal)
        button.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var calendarButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btn_calender"), for: .normal)
        button.addTarget(self, action: #selector(clanderButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var profileImageView: UIButton = {
        let imageView = UIButton()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.setImage(UIImage(named: "img_photo"), for: .normal)
        return imageView
    }()
   
    lazy var editProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit Profile", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(editProfileButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var nameLabel: UILabel = {
        let textColor = UIColor(red: 70/255, green: 37/255, blue: 195/255, alpha: 1.0)
        let label = UILabel()
        label.text = "Joe "
        label.textColor = textColor
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "44 Months 17 Days"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    lazy var feedingButton: UIButton = {
         let button = UIButton()
         button.setBackgroundImage(UIImage(named: "feeding"), for: .normal)
         button.setImage(UIImage(named: "icon_feeding"), for: .normal)
         button.setTitle(" Feeding", for: .normal)
         button.setTitleColor(.white, for: .normal)
         button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
         button.titleLabel?.textAlignment = .left
         button.contentHorizontalAlignment = .left
         button.addTarget(self, action: #selector(feedingButtonTapped), for: .touchUpInside)
         return button
     }()
     
    lazy var diaperButton: UIButton = {
         let button = UIButton()
         button.setBackgroundImage(UIImage(named: "diaper"), for: .normal)
         button.setImage(UIImage(named: "icon_diaper"), for: .normal)
         button.setTitle("Diaper Change", for: .normal)
         button.setTitleColor(.white, for: .normal)
         button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
         button.titleLabel?.textAlignment = .left
         button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(diaperButtonTapped), for: .touchUpInside)
         return button
     }()
     
    lazy var sleepButton: UIButton = {
         let button = UIButton()
         button.setBackgroundImage(UIImage(named: "sleep"), for: .normal)
         button.setImage(UIImage(named: "icon_sleep"), for: .normal)
         button.setTitle("Sleep", for: .normal)
         button.setTitleColor(.white, for: .normal)
         button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
         button.titleLabel?.textAlignment = .left
         button.contentHorizontalAlignment = .left
         button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
         return button
     }()
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(fetchData), name: NSNotification.Name("new"), object: nil)

      }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUIDesign ()
        fetchData()
    }

    
    func setupUIDesign (){
        
        selectionView.backgroundColor = .white
        selectionView.layer.cornerRadius = 25
        selectionView.layer.shadowColor = UIColor(red: 0.569, green: 0.569, blue: 0.569, alpha: 1).cgColor
        selectionView.layer.shadowOpacity = 3
        selectionView.layer.shadowOffset = CGSize(width: 0, height: 0)
        selectionView.layer.shadowRadius = 1
        
        view.addSubview(settingsButton)
        settingsButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.width.height.equalTo(45)
        }
        
        view.addSubview(calendarButton)
        calendarButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.width.height.equalTo(45)
        }
        
        view.addSubview(profileImageView)
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        view.addSubview(editProfileButton)
        editProfileButton.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(10)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(editProfileButton.snp.bottom).offset(10)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(ageLabel)
        ageLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        view.addSubview(selectionView)
        selectionView.snp.makeConstraints { make in
            make.top.equalTo(ageLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(-0)
            make.bottom.equalToSuperview().offset(0)
        }
        
        selectionView.addSubview(feedingButton)
        feedingButton.snp.makeConstraints { make in
            make.top.equalTo(ageLabel.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(27)
            make.trailing.equalToSuperview().offset(-28)
            make.height.equalTo(60)
        }
        selectionView.addSubview(diaperButton)
        diaperButton.snp.makeConstraints { make in
            make.top.equalTo(feedingButton.snp.bottom).offset(17)
            make.leading.equalToSuperview().offset(27)
            make.trailing.equalToSuperview().offset(-28)
            make.height.equalTo(60)
        }
        selectionView.addSubview(sleepButton)
        sleepButton.snp.makeConstraints { make in
            make.top.equalTo(diaperButton.snp.bottom).offset(17)
            make.leading.equalToSuperview().offset(27)
            make.trailing.equalToSuperview().offset(-28)
            make.height.equalTo(60)
        }
    }
    
    @objc func settingsButtonTapped(){
        let settingVC = SettingsViewController()
        settingVC.modalPresentationStyle = .fullScreen
        present(settingVC, animated: true)
    }
    
    @objc func  clanderButtonTapped(){
        let calenderVC = CalenderViewController()
        calenderVC.modalPresentationStyle = .fullScreen
        present(calenderVC, animated: true)
    }
    
    @objc func editProfileButtonTapped(){
        let editVC = EditViewController()
        editVC.modalPresentationStyle = .fullScreen
        present(editVC, animated: true)
    }
    
    @objc func feedingButtonTapped(){
        let feedingVC = FeedingViewController()
        feedingVC.modalPresentationStyle = .fullScreen
        present(feedingVC, animated: true)
    }
    
    @objc func diaperButtonTapped(){
        let diaperVC = DiaperViewController()
        diaperVC.modalPresentationStyle = .fullScreen
        present(diaperVC, animated: true)
    }
    
    @objc func saveButtonTapped(){
        let sleepVC = SleepViewController()
        sleepVC.modalPresentationStyle = .fullScreen
        present(sleepVC, animated: true)
    }

    @objc func fetchData(){
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            
        do{
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                if let name = result.value(forKey: "name") as? String {
                    nameLabel.text = name
                    print("label fetch")
                }
                if let birthDateString = result.value(forKey: "birthDate") as? String {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd.MM.yyyy"
                    if let birthDate = dateFormatter.date(from: birthDateString) {
                        let calendar = Calendar.current
                        let ageComponents = calendar.dateComponents([.year], from: birthDate, to: Date())
                        if let age = ageComponents.year {
                            ageLabel.text = "\(age) years old"
                        }
                    }
                }
                if let image = result.value(forKey: "profilImage") as? Data {
                    profileImageView.setImage(UIImage(data: image), for: .normal)

                }
            }
        } catch {
                print("fetch data catch")
            }
        }
      
      func calculateAge(birthDate: Date) -> String {
          let calendar = Calendar.current
          let ageComponents = calendar.dateComponents([.year], from: birthDate, to: Date())
          let age = ageComponents.year ?? 0
          return "\(age) years old"
      }
  }


