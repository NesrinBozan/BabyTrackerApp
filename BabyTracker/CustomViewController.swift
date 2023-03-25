//
//  CustomViewController.swift
//  BabyTracker
//
//  Created by Nesrin Bozan on 21.03.2023.
//

import UIKit
import CoreData

//class CustomViewController: UIViewController {
//
//    lazy var backButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "btn_back"), for: .normal)
//        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
//        return button
//    }()
//
//    lazy var titleLabel: UILabel = {
//        let titleLabel = UILabel()
//        titleLabel.text = "   "
//        titleLabel.textColor = UIColor(red: 70/255, green: 37/255, blue: 195/255, alpha: 1.0)
//        titleLabel.font = .systemFont(ofSize: 27)
//        return titleLabel
//    }()
//
//    lazy var saveButton: UIButton = {
//        let saveButton = UIButton()
//        saveButton.setTitle("Save", for: .normal)
//        saveButton.tintColor = .white
//        saveButton.layer.cornerRadius = 31
//        saveButton.layer.borderWidth = 0
//        saveButton.backgroundColor = UIColor(red: 0.275, green: 0.147, blue: 0.767, alpha: 1)
//        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
//        return saveButton
//    }()
//
//    lazy var timeTextField: UITextField = {
//        let textField = UITextField()
//        textField.backgroundColor = UIColor(red: 0.953, green: 0.953, blue: 0.953, alpha: 1)
//        textField.layer.cornerRadius = 25
//        textField.placeholder = "   Time"
//        textField.textAlignment = .left
//        textField.keyboardType = .numberPad
//        textField.contentHorizontalAlignment = .left
//        let timePicker = UIDatePicker()r
//        timePicker.datePickerMode = .time
//        timePicker.preferredDatePickerStyle = .wheels
//        timePicker.frame.size = CGSize(width: 0, height: 250)
//        textField.inputView = timePicker
//        timePicker.addTarget(self, action: #selector(timeTextFieldChanged), for: .touchUpInside)
//        return textField
//    }()
//
//    lazy var amountTextField: UITextField = {
//        let textField2 = UITextField()
//        textField2.backgroundColor = UIColor(red: 0.953, green: 0.953, blue: 0.953, alpha: 1)
//        textField2.layer.cornerRadius = 25
//        textField2.placeholder = "   Amount (ml)"
//        textField2.keyboardType = .numberPad
//        textField2.contentHorizontalAlignment = .left
//        textField2.addTarget(self, action: #selector(amountTextFieldChanged), for: .touchUpInside)
//        return textField2
//    }()
//
//    lazy var wokeUpTextField: UITextField = {
//        let textField = UITextField()
//        textField.backgroundColor = UIColor(red: 0.953, green: 0.953, blue: 0.953, alpha: 1)
//        textField.layer.cornerRadius = 25
//        textField.placeholder = "   Time"
//        textField.textAlignment = .left
//        textField.keyboardType = .numberPad
//        textField.contentHorizontalAlignment = .left
//        let timePicker = UIDatePicker()
//        timePicker.datePickerMode = .time
//        timePicker.preferredDatePickerStyle = .wheels
//        timePicker.frame.size = CGSize(width: 0, height: 250)
//        textField.inputView = timePicker
//        timePicker.addTarget(self, action: #selector(wokeUpTextFieldChanged), for: .touchUpInside)
//        return textField
//    }()
//
//
//    lazy var longTextView: UITextField = {
//        let longTextView = UITextField()
//        longTextView.backgroundColor = UIColor(red: 0.953, green: 0.953, blue: 0.953, alpha: 1)
//        longTextView.layer.cornerRadius = 25
//
//        longTextView.addTarget(self, action: #selector(noteTextFieldChanged), for: .touchUpInside)
//        return longTextView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
//        view.addGestureRecognizer(tapGesture)
//        timeTextField.delegate = self
//        amountTextField.delegate = self
//        longTextView.delegate = self
//        setupUIDesign()
//        updateButtonVisibility()
//    }
//
//    func setupUIDesign() {
//
//        view.addSubview(backButton)
//        backButton.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
//            make.left.equalTo(view.safeAreaLayoutGuide).offset(10)
//            make.width.height.equalTo(45)
//        }
//
//        view.addSubview(titleLabel)
//        titleLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.centerY.equalToSuperview().offset(-320)
//        }
//
//        view.addSubview(timeTextField)
//        timeTextField.snp.makeConstraints { make in
//            make.top.equalTo(titleLabel.snp.bottom).offset(60)
//            make.left.equalToSuperview().offset(20)
//            make.right.equalToSuperview().offset(-20)
//            make.height.equalTo(50)
//        }
//
//        view.addSubview(amountTextField)
//        amountTextField.snp.makeConstraints { make in
//            make.top.equalTo(timeTextField.snp.bottom).offset(30)
//            make.left.equalToSuperview().offset(20)
//            make.right.equalToSuperview().offset(-20)
//            make.height.equalTo(50)
//        }
//        view.addSubview(wokeUpTextField)
//        wokeUpTextField.snp.makeConstraints { make in
//            make.top.equalTo(amountTextField.snp.bottom).offset(30)
//            make.left.equalToSuperview().offset(20)
//            make.right.equalToSuperview().offset(-20)
//            make.height.equalTo(50)
//        }
//
//        view.addSubview(longTextView)
//        longTextView.snp.makeConstraints { make in
//            make.top.equalTo(wokeUpTextField.snp.bottom).offset(30)
//            make.left.equalToSuperview().offset(20)
//            make.right.equalToSuperview().offset(-20)
//            make.height.equalTo(150)
//        }
//
//        view.addSubview(saveButton)
//        saveButton.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
//            make.width.equalTo(250)
//            make.height.equalTo(62)
//        }
//    }
//
//    @objc func backButtonTapped() {
//        let backVC = HomePageViewController()
//        backVC.modalPresentationStyle = .fullScreen
//        present(backVC, animated: true)
//    }
//
//
//    @objc func timeTextFieldChanged(sender: UIDatePicker) {
//        let timeFormatter = DateFormatter()
//        timeFormatter.dateStyle = .long
//        timeFormatter.timeStyle = .none
//        let birth = sender.date
//        let formattedTime = timeFormatter.string(from: birth)
//        timeTextField.text = formattedTime
//
//    }
//    @objc func noteTextFieldChanged(){
//
//    }
//    @objc func amountTextFieldChanged(){
//
//    }
//    @objc func wokeUpTextFieldChanged(sender: UIDatePicker){
//        let timeFormatter = DateFormatter()
//        timeFormatter.dateStyle = .long
//        timeFormatter.timeStyle = .none
//        let birth = sender.date
//        let formattedTime = timeFormatter.string(from: birth)
//        timeTextField.text = formattedTime
//    }
//
//    @objc func saveButtonTapped() {
//
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        let newSleep = Sleep(context: context)
//        let newFeeding = Feeding(context: context)
//        let dateFormatter = DateFormatter()
//            dateFormatter.dateStyle = .none
//            dateFormatter.timeStyle = .short
//
//        newSleep.notes = longTextView.text
//        if let wokeUp = newSleep.wokeUp {
//            wokeUpTextField.text = dateFormatter.string(from: wokeUp)
//        }
//        if let sleep = newSleep.feelSleep {
//            timeTextField.text = dateFormatter.string(from: sleep)
//        }
//
//
//        newFeeding.notes = longTextView.text
//        newFeeding.amount = Int16(amountTextField.text ?? "0") ?? 0
//        if let timeBirth = newFeeding.time {
//        timeTextField.text = dateFormatter.string(from: timeBirth)
//          }
//
//
//        do {
//            try context.save()
//        } catch let error as NSError {
//            print("Could not save. \(error), \(error.userInfo)")
//        }
//
//        }
//
//    @objc func dismissKeyboard(){
//        view.endEditing(true)
//    }
//func updateButtonVisibility() {
//     let textField1HasText = !(timeTextField.text?.isEmpty ?? true)
//     let textField2HasText = !(amountTextField.text?.isEmpty ?? true)
//     let longTextViewHasText = !(longTextView.text?.isEmpty ?? true)
//     let shouldShowButton = textField1HasText && textField2HasText && longTextViewHasText
//     saveButton.isHidden = !shouldShowButton
// }
//}
//
//extension CustomViewController: UITextFieldDelegate {
// func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//     updateButtonVisibility()
//     return true
// }
//    func textViewDidChange(_ textView: UITextView) {
//        updateButtonVisibility()
//    }
//}
//
//extension UITextView: UITextViewDelegate {
//    public func textViewDidChange(_ textView: UITextView) {
//        if let placeholderLabel = viewWithTag(100) as? UILabel {
//            placeholderLabel.isHidden = !textView.text.isEmpty
//        }
//    }
//}
//
//
//
//
