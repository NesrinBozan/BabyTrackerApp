//
//  EditViewController.swift
//  BabyTracker
//
//  Created by Nesrin Bozan on 21.03.2023.
//

import UIKit
import CoreData


class EditViewController: UIViewController {
    
    var selectedDate: Date?
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    let containerView = UIView()
    var isChild: Bool?
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btn_back"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
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
    
    
    lazy var continueButton: UIButton = {
        let continueButton = UIButton()
        continueButton.setTitle("Save", for: .normal)
        continueButton.tintColor = .white
        continueButton.layer.cornerRadius = 31
        continueButton.layer.borderWidth = 0
        continueButton.backgroundColor = UIColor(red: 0.762, green: 0.762, blue: 0.762, alpha: 1)
        continueButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return continueButton
    }()
    
    lazy var firstButton: UIButton = {
          let button = UIButton()
          button.setImage(UIImage(named: "img_unselected_girl"), for: .normal)
          button.setImage(UIImage(named: "img_selected_girl"), for: .selected)
          button.addTarget(self, action: #selector(selectFirstImage), for: .touchUpInside)
          return button
      }()
      
      lazy var secondButton: UIButton = {
          let button = UIButton()
          button.setImage(UIImage(named: "img_unselected_boy"), for: .normal)
          button.setImage(UIImage(named: "img_selected_boy"), for: .selected)
          button.addTarget(self, action: #selector(selectSecondImage), for: .touchUpInside)
          return button
      }()
    
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "   Baby Full Name"
        textField.contentMode = .left
        return textField
    }()
    
    lazy var dateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "   Birth Date"
        textField.contentMode = .left
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.frame.size = CGSize(width: 0, height: 250)
        textField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickerChanged), for: .touchUpInside)
        return textField
    }()
    
    lazy var timeStartTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "   Time of Birth"
        textField.contentMode = .left
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.frame.size = CGSize(width: 0, height: 250)
        textField.inputView = timePicker
        timePicker.addTarget(self, action: #selector(birthTimePickerChanged), for: .touchUpInside)
        return textField
    }()
    
    lazy var timeEndTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "    Due Date"
        textField.contentMode = .left
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.frame.size = CGSize(width: 0, height: 250)
        textField.inputView = timePicker
        timePicker.addTarget(self, action: #selector(dueTimePickerChanged), for: .touchUpInside)
        return textField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        view.backgroundColor = .white
        
        setupUIDesign()
        fetchEdit()
    }
    
    func fetchEdit() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        do{
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                
                if let name = result.value(forKey: "name") as? String {
                    nameTextField.text = name
                    print("label save")
                }
                if let birtDate = result.value(forKey: "birthDate") as? String{
                    dateTextField.text = birtDate
                }
                if let timeStart = result.value(forKey: "timeBirth") as? String{
                    timeStartTextField.text = timeStart
                }
                if let timeEnd = result.value(forKey: "dueTime") as? String{
                    timeEndTextField.text = timeEnd
                }
                
                if let profileImageFetch = result.value(forKey: "profilImage") as? Data {
                    profileImageView.setImage(UIImage(data: profileImageFetch), for: .normal)
                    print("image save")
                }
                
                if let isChild = result.value(forKey: "isChild") as? Bool {
                    print(isChild)
                    if isChild == false {
                        firstButton.isSelected = true
                        secondButton.isSelected = false
                    }else {
                        secondButton.isSelected = true
                        firstButton.isSelected = false
                    }
                }
            }
        } catch {
            print("fetch data catch")
            
        }
        
        let homeVC = HomePageViewController()
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: true)
        
    }
    
    func setupUIDesign(){
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 25
        containerView.layer.shadowColor = UIColor(red: 0.569, green: 0.569, blue: 0.569, alpha: 1).cgColor
        containerView.layer.shadowOpacity = 3
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        containerView.layer.shadowRadius = 1
        
        
        nameTextField.setCommonStyle()
        dateTextField.setCommonStyle()
        timeStartTextField.setCommonStyle()
        timeEndTextField.setCommonStyle()
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.width.height.equalTo(45)
        }
        
        view.addSubview(profileImageView)
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(83)
            make.centerX.equalToSuperview()
            make.width.equalTo(134)
            make.height.equalTo(134)
        }
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(45)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(-0)
            make.bottom.equalToSuperview().offset(0)
        }
        containerView.addSubview(firstButton)
        firstButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(26)
            make.leading.equalToSuperview().offset(100)
            make.width.equalTo(42)
            make.height.equalTo(42)
        }
        containerView.addSubview(secondButton)
        secondButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(26)
            make.trailing.equalToSuperview().offset(-100)
            make.width.equalTo(42)
            make.height.equalTo(42)
        }
        containerView.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(firstButton.snp.bottom).offset(26)
            make.leading.trailing.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(50)
        }
        
        containerView.addSubview(dateTextField)
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(48)
            make.leading.trailing.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(50)
        }
        containerView.addSubview(timeStartTextField)
        timeStartTextField.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(50)
        }
        containerView.addSubview(timeEndTextField)
        timeEndTextField.snp.makeConstraints { make in
            make.top.equalTo(timeStartTextField.snp.bottom).offset(48)
            make.leading.trailing.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(50)
        }
        view.addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(timeEndTextField.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(27)
            make.trailing.equalToSuperview().offset(-28)
            make.height.equalTo(60)
        }
    }
    
    @objc func datePickerChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let date = sender.date
        let formatDate = dateFormatter.string(from: date)
        dateTextField.text = formatDate
        
    }
    
    @objc func birthTimePickerChanged(_ sender: UIDatePicker) {
        let timeBirthFormatter = DateFormatter()
        timeBirthFormatter.dateStyle = .long
        timeBirthFormatter.timeStyle = .none
        let birth = sender.date
        let formattedBirth = timeBirthFormatter.string(from: birth)
        timeStartTextField.text = formattedBirth
        
    }
    
    @objc func dueTimePickerChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        let dueTime = sender.date
        let formattedDueTime = formatter.string(from: dueTime)
        timeEndTextField.text = formattedDueTime
    }
    
    @objc func backButtonTapped (){
        let backVC = HomePageViewController()
        backVC.modalPresentationStyle = .fullScreen
        present(backVC, animated: true)
    }
    
    @objc func saveButtonTapped(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        
        saveData.setValue(nameTextField.text, forKey: "name")
        saveData.setValue(String(dateTextField.text!), forKey: "birthDate")
        saveData.setValue(String(timeStartTextField.text!), forKey: "timeBirth")
        saveData.setValue(String(timeEndTextField.text!), forKey: "dueTime")
        let imagePress = profileImageView.currentImage?.jpegData(compressionQuality: 0.5)
        saveData.setValue(imagePress, forKey: "profilImage")
        saveData.setValue(isChild.self, forKey: "isChild")
        
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "new"), object: nil)
        
        
        let homeVC = HomePageViewController()
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: true)
    }
    
    @objc func selectFirstImage() {
        if firstButton.isSelected == true {
            firstButton.isSelected = false
//            isChild = false
        }else{
            firstButton.isSelected = true
            //            isChild = true
            secondButton.isSelected = false
        
        }
        }
    
    @objc func selectSecondImage() {
        
      if  secondButton.isSelected == true {
            secondButton.isSelected = false
          //            isChild = false
          
      }else{
          secondButton.isSelected = true
          //            isChild = true
          firstButton.isSelected = false
      }

        }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
}

//
//extension UITextField {
//    func setCommonStyle() {
//        self.font = UIFont(name: "Poppins-Medium", size: 14)
//        self.backgroundColor = UIColor(red: 0.953, green: 0.953, blue: 0.953, alpha: 1)
//        self.layer.cornerRadius = 25
//        
//    }
//}
