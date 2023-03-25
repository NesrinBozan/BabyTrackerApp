//
//  DiaperViewController.swift
//  BabyTracker
//
//  Created by Nesrin Bozan on 21.03.2023.
//

import UIKit
import CoreData
import Lottie

class DiaperViewController: UIViewController {
    private var animationView: LottieAnimationView?
    
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btn_back"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Diaper Change"
        titleLabel.textColor = UIColor(red: 70/255, green: 37/255, blue: 195/255, alpha: 1.0)
        titleLabel.font = .systemFont(ofSize: 27, weight: .bold)
        return titleLabel
    }()
    
    lazy var diaperTitle: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Diaper Status"
        titleLabel.textColor = UIColor.black
        titleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        return titleLabel
    }()
    lazy var timeTextField: UITextField = {
        let textField1 = UITextField()
        textField1.backgroundColor = UIColor(red: 0.953, green: 0.953, blue: 0.953, alpha: 1)
        textField1.layer.cornerRadius = 25
        textField1.placeholder = "   Time"
        textField1.textAlignment = .left
        textField1.contentHorizontalAlignment = .left
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.frame.size = CGSize(width: 0, height: 250)
        textField1.inputView = timePicker
        timePicker.addTarget(self, action: #selector(timeTextFieldChanged), for: .valueChanged)
        return textField1
    }()
    
    lazy var longTextView: UITextField = {
        let longTextView = UITextField()
        longTextView.textAlignment = .left
        longTextView.placeholder = "Note"
        longTextView.backgroundColor = UIColor(red: 0.953, green: 0.953, blue: 0.953, alpha: 1)
        longTextView.layer.cornerRadius = 25
        longTextView.addTarget(self, action: #selector(noteTextFieldChanged), for: .valueChanged)
        return longTextView
    }()
    lazy var saveButton: UIButton = {
        let saveButton = UIButton()
        saveButton.setTitle("Save", for: .normal)
        saveButton.tintColor = .white
        saveButton.layer.cornerRadius = 31
        saveButton.layer.borderWidth = 0
        saveButton.backgroundColor =  UIColor.nextButtoColorn
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return saveButton
    }()
    
    
    let wetButton = DiaperCustomButton(selectedImage: UIImage(named: "wet_selected")!, unselectedImage: UIImage(named: "wet_unselected")!)
    let dirtyButton = DiaperCustomButton(selectedImage: UIImage(named: "dirty_selected")!, unselectedImage: UIImage(named: "dirty_unselected")!)
    let mixedButton = DiaperCustomButton(selectedImage: UIImage(named: "mixed_selected")!, unselectedImage: UIImage(named: "mixed_unselected")!)
    let dryButton = DiaperCustomButton(selectedImage: UIImage(named: "dry_selected")!, unselectedImage: UIImage(named: "dry_unselected")!)
    
    
    override func viewDidLoad() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        super.viewDidLoad()
        view.backgroundColor = .white
        timeTextField.delegate = self
        longTextView.delegate = self
        setupUIDesign()
        updateButtonVisibility()
    }
    
    func setupUIDesign(){
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.width.height.equalTo(45)
        }
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-320)
        }
        
        view.addSubview(timeTextField)
        timeTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.width.equalTo(40)
        }
        view.addSubview(diaperTitle)
        diaperTitle.snp.makeConstraints { make in
            make.top.equalTo(timeTextField.snp.bottom).offset(27)
            make.leading.equalToSuperview().offset(48)
            
        }
        view.addSubview(wetButton)
        wetButton.snp.makeConstraints { make in
            make.top.equalTo(timeTextField.snp.bottom).offset(60)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(48)
            make.height.equalTo(30)
            make.width.equalTo(70)
            
        }
        view.addSubview(dirtyButton)
        dirtyButton.snp.makeConstraints { make in
            make.top.equalTo(wetButton.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(48)
            make.height.equalTo(20)
            make.width.equalTo(70)
        }
        view.addSubview(mixedButton)
        mixedButton.snp.makeConstraints { make in
            make.top.equalTo(dirtyButton.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(48)
            make.height.equalTo(30)
            make.width.equalTo(70)
        }
        view.addSubview(dryButton)
        dryButton.snp.makeConstraints { make in
            make.top.equalTo(mixedButton.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(48)
            make.height.equalTo(30)
            make.width.equalTo(70)
        }
        view.addSubview(longTextView)
        longTextView.snp.makeConstraints { make in
            make.top.equalTo(dryButton.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(150)
        }
        view.addSubview(saveButton)
        saveButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
            make.width.equalTo(250)
            make.height.equalTo(62)
        }
        
        
        wetButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        dirtyButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        mixedButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        dryButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
    }
    
    @objc func backButtonTapped(){
        let backVC = HomePageViewController()
        backVC.modalPresentationStyle = .fullScreen
        present(backVC, animated: true)
    }
    
    @objc private func buttonTapped(_ sender: CalenderCustomButton) {
        [wetButton, dirtyButton, mixedButton, dryButton].forEach { $0.isSelected = false }
        sender.isSelected = true
        
    }
    
    @objc func timeTextFieldChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.dateFormat = "HH:mm:ss"
        self.timeTextField.text = formatter.string(from: sender.date)
        
    }
    
    @objc func noteTextFieldChanged(_ sender: UIDatePicker){
        
    }
    
    func stopAnimation() {
        animationView?.stop()
        animationView?.isHidden = true
    }
    
    func startAnimation(){
        animation()
        animationView?.play()
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { [self] _ in
            stopAnimation()
        }
    }
    
    func updateButtonVisibility() {
        let textField1HasText = !(timeTextField.text?.isEmpty ?? true)
        let longTextViewHasText = !(longTextView.text?.isEmpty ?? true)
        let shouldShowButton = textField1HasText && longTextViewHasText
        saveButton.isHidden = !shouldShowButton
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    @objc func saveButtonTapped(){
        startAnimation()
        let newActivity = ActivityModel(type: .Diaper, time: timeTextField.text ?? "", note: longTextView.text ?? "")
        CoreDataManager.shared.saveActivityToCoreData(model: newActivity)
           DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
               let homeVC = HomePageViewController()
               homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: true)
               
           })
    }
    
    func animation() {
        animationView = .init(name: "loading-gray")
        animationView?.loopMode = .loop
        animationView?.animationSpeed = 0.7
        view.addSubview(animationView!)
        animationView?.snp.makeConstraints({ make in
            make.left.equalToSuperview().offset(60)
            make.right.equalToSuperview().inset(60)
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.bottom.equalTo(saveButton.snp.top).inset(-300)
        })
    }
    
    }

extension DiaperViewController: UITextFieldDelegate {
 func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
     updateButtonVisibility()
     return true
 }
    func textViewDidChange(_ textView: UITextView) {
        updateButtonVisibility()
    }
}
    
    

    

//    func updateButtonVisibility() {
//         let textField1HasText = !(timeTextField.text?.isEmpty ?? true)
//         let textField2HasText = !(amountTextField.text?.isEmpty ?? true)
//         let longTextViewHasText = !(longTextView.text?.isEmpty ?? true)
//         let shouldShowButton = textField1HasText && textField2HasText && longTextViewHasText
//         saveButton.isHidden = !shouldShowButton
//     }
//    }
//
//    extension FeedingViewController: UITextFieldDelegate {
//     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//         updateButtonVisibility()
//         return true
//     }
//        func textViewDidChange(_ textView: UITextView) {
//            updateButtonVisibility()
//        }
//    }
//
//    extension UITextView: UITextViewDelegate {
//        public func textViewDidChange(_ textView: UITextView) {
//            if let placeholderLabel = viewWithTag(100) as? UILabel {
//                placeholderLabel.isHidden = !textView.text.isEmpty
//            }
//        }
//    }
