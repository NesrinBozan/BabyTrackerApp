//
//  LoginInformationViewController.swift
//  BabyTracker
//
//  Created by Nesrin Bozan on 21.03.2023.
//

import UIKit
import CoreData


class LoginInformationViewController: UIViewController {
    

    let selectionView = UIView()
    var selectedDate: Date?
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    var isChild: Bool?
    
    private var profileImage: UIImage?
   
    
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
    
    lazy var profileImageView: UIButton = {
        let imageView = UIButton()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.setImage(UIImage(named: "btn_addphoto"), for: .normal)
        imageView.addTarget(self, action: #selector(handleProfileImage), for: .touchUpInside)
        return imageView
    }()
   
    lazy var continueButton: UIButton = {
        let continueButton = UIButton()
        continueButton.setTitle("Continue", for: .normal)
        continueButton.tintColor = .white
        continueButton.layer.cornerRadius = 31
        continueButton.layer.borderWidth = 0
        continueButton.backgroundColor = UIColor.nextButtoColorn
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        return continueButton
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "   Baby Full Name"
        textField.contentMode = .left
        textField.textColor = .black
        return textField
    }()
    
    lazy var dateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "   Birth Date"
        textField.contentMode = .left
        textField.textColor = .black
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.frame.size = CGSize(width: 0, height: 250)
        textField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
        return textField
    }()
    
    lazy var timeStartTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "   Time of Birth"
        textField.contentMode = .left
        textField.textColor = .black
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.frame.size = CGSize(width: 0, height: 250)
        textField.inputView = timePicker
        timePicker.addTarget(self, action: #selector(birthTimePickerChanged), for: .valueChanged)
        return textField
    }()
    
    lazy var timeEndTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "    Due Date"
        textField.contentMode = .left
        textField.textColor = .black
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.frame.size = CGSize(width: 0, height: 250)
        textField.inputView = timePicker
        timePicker.addTarget(self, action: #selector(dueTimePickerChanged), for: .valueChanged)
        return textField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUIDesign()
    }
    
    func setupUIDesign(){
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        selectionView.layer.borderWidth = 1
        selectionView.layer.cornerRadius = 10

        nameTextField.settCommonStyle()
        dateTextField.settCommonStyle()
        timeStartTextField.settCommonStyle()
        timeEndTextField.settCommonStyle()

        view.addSubview(profileImageView)
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(83)
            make.centerX.equalToSuperview()
            make.width.equalTo(134)
            make.height.equalTo(134)
        }
        
        view.addSubview(selectionView)
        selectionView.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(45)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(-0)
            make.bottom.equalToSuperview().offset(0)
        }
        
        selectionView.addSubview(firstButton)
           firstButton.snp.makeConstraints { make in
               make.top.equalToSuperview().offset(26)
               make.leading.equalToSuperview().offset(100)
               make.width.equalTo(42)
               make.height.equalTo(42)

           }
        
        selectionView.addSubview(secondButton)
           secondButton.snp.makeConstraints { make in
               make.top.equalToSuperview().offset(26)
               make.trailing.equalToSuperview().offset(-100)
               make.width.equalTo(42)
               make.height.equalTo(42)
           }
        
        selectionView.addSubview(nameTextField)
          nameTextField.snp.makeConstraints { make in
             make.top.equalTo(firstButton.snp.bottom).offset(26)
             make.leading.trailing.equalToSuperview().offset(24)
             make.trailing.equalToSuperview().offset(-24)
             make.height.equalTo(50)
        }
        
        selectionView.addSubview(dateTextField)
           dateTextField.snp.makeConstraints { make in
             make.top.equalTo(nameTextField.snp.bottom).offset(48)
             make.leading.trailing.equalToSuperview().offset(24)
             make.trailing.equalToSuperview().offset(-24)
             make.height.equalTo(50)
        }
        
        selectionView.addSubview(timeStartTextField)
          timeStartTextField.snp.makeConstraints { make in
             make.top.equalTo(dateTextField.snp.bottom).offset(48)
             make.leading.equalToSuperview().offset(24)
             make.trailing.equalToSuperview().offset(-24)
             make.height.equalTo(50)
        }
        
        selectionView.addSubview(timeEndTextField)
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
    
    @objc func handleProfileImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func selectFirstImage() {
        if firstButton.isSelected == true {
            firstButton.isSelected = false
            isChild = false
        }else{
            firstButton.isSelected = true
            isChild = true
            secondButton.isSelected = false
        
        }
    }
        
    @objc func selectSecondImage() {
        
      if  secondButton.isSelected == true {
            secondButton.isSelected = false
            isChild = false
          
      }else{
          secondButton.isSelected = true
          isChild = true
          firstButton.isSelected = false
      }

        }
    
    @objc func datePickerChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let date = sender.date
        let formatDate = dateFormatter.string(from: date)
        dateTextField.text = formatDate
    }
    
    @objc func birthTimePickerChanged(sender: UIDatePicker) {
        let timeBirthFormatter = DateFormatter()
        timeBirthFormatter.dateStyle = .long
        timeBirthFormatter.timeStyle = .none
        timeBirthFormatter.dateFormat = "HH:mm:ss"
        let birth = sender.date
        let formattedBirth = timeBirthFormatter.string(from: birth)
        timeStartTextField.text = formattedBirth
       
        
    }
    
    @objc func dueTimePickerChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
            formatter.dateStyle = .none
            formatter.timeStyle = .short
            formatter.dateFormat = "HH:mm:ss"
            let dueTime = sender.date
            let formattedDueTime = formatter.string(from: dueTime)
            timeEndTextField.text = formattedDueTime
        
    }
    
    @objc func continueButtonTapped(){
        
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

        do {
             try context.save()
             print("User saved successfully.")
         } catch {
             print("Error saving user: \(error.localizedDescription)")
         }

        let homeVC = HomePageViewController()
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: true)
    }

    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}

extension LoginInformationViewController: UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImage = selectedImage
            profileImageView.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
            profileImageView.layer.borderColor = UIColor.white.cgColor
            profileImageView.layer.masksToBounds = true
            profileImageView.layer.borderWidth = 2
            profileImageView.layer.cornerRadius = profileImageView.frame.width/2
            picker.dismiss(animated: true, completion: nil)
        }
        
    }
}

extension UITextField {
    func settCommonStyle() {
        self.font = UIFont(name: "Poppins-Medium", size: 14)
        self.backgroundColor = UIColor(red: 0.953, green: 0.953, blue: 0.953, alpha: 1)
        self.layer.cornerRadius = 25
        
    }
}

            
       
