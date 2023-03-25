//
//  CalenderViewController.swift
//  BabyTracker
//
//  Created by Nesrin Bozan on 21.03.2023.
//

import UIKit
import CoreData

class CalenderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let tableView = UITableView()
    let cellReuseIdentifier = "CustomCell"
    var fetchedData = [ActivityModel]()
    var filteredData = [ActivityModel]()
    
    
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btn_back"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Calender"
        titleLabel.textColor = UIColor(red: 70/255, green: 37/255, blue: 195/255, alpha: 1.0)
        titleLabel.font = .systemFont(ofSize: 27, weight: .bold)
        
        return titleLabel
    }()
    lazy var timeLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "\(Date().getCurrentDate())"
        titleLabel.textColor = UIColor.black
        titleLabel.font = .systemFont(ofSize: 15)
        return titleLabel
    }()
    
    private let allbutton = CalenderCustomButton(selectedImage: UIImage(named: "text_all_selected")!, unselectedImage: UIImage(named: "text_all_unselected")!)
    private let sleepButton = CalenderCustomButton(selectedImage: UIImage(named: "icon_sleep_blue")!, unselectedImage: UIImage(named: "icon_sleep_unselected")!)
    private let feedingButton = CalenderCustomButton(selectedImage: UIImage(named: "icon_feeding_purple")!, unselectedImage: UIImage(named: "icon_feeding_unselected")!)
    private let diaperButton = CalenderCustomButton(selectedImage: UIImage(named: "icon_diaper_green")!, unselectedImage: UIImage(named: "icon_diaper_unselected")!)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = .white
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 120
        tableView.layer.cornerRadius = 25
        tableView.rowHeight = 120
        CoreDataManager.shared.fetchActivityData { [self]model in
            fetchedData = model
        }
        filteredData = fetchedData
        
    }
    
    
    
    private func setupViews() {
        allbutton.tag = 1
        feedingButton.tag = 2
        diaperButton.tag = 3
        sleepButton.tag = 4
        
        view.addSubview(backButton)
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
        view.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.leading.equalTo(160)
            make.height.equalTo(45)
            make.width.equalTo(190)
        }
        view.addSubview(allbutton)
        allbutton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.top.equalToSuperview().offset(170)
            make.width.height.equalTo(50)
        }
        
        view.addSubview(feedingButton)
        feedingButton.snp.makeConstraints { make in
            make.leading.equalTo(allbutton.snp.trailing).offset(35)
            make.top.equalToSuperview().offset(170)
            make.width.height.equalTo(50)
        }
        view.addSubview(diaperButton)
        diaperButton.snp.makeConstraints { make in
            make.leading.equalTo(feedingButton.snp.trailing).offset(35)
            make.top.equalToSuperview().offset(170)
            make.width.height.equalTo(50)
        }
        view.addSubview(sleepButton)
        sleepButton.snp.makeConstraints { make in
            make.leading.equalTo(diaperButton.snp.trailing).offset(35)
            make.top.equalToSuperview().offset(170)
            make.width.height.equalTo(50)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(sleepButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-0)
        }
        
        allbutton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        sleepButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        feedingButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        diaperButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
    }
    
    
    @objc private func buttonTapped(_ sender: CalenderCustomButton) {
        [allbutton, sleepButton, feedingButton, diaperButton].forEach { button in
            button.isSelected = false
            if button == sender {
                switch button.tag {
                case 1:
                    filteredData = fetchedData
                case 2:
                    filteredData = fetchedData.filter({$0.type == .Feed})
                case 3:
                    filteredData = fetchedData.filter({$0.type == .Diaper})
                case 4:
                    filteredData = fetchedData.filter({$0.type == .Sleep})
                default:
                    break
                }
            }
            
        }
        
        sender.isSelected = true
        print(filteredData)
        tableView.reloadData()
        
    }
    
    @objc func backButtonTapped() {
        let backVC = HomePageViewController()
        backVC.modalPresentationStyle = .fullScreen
        present(backVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? CustomTableViewCell else {
            fatalError("cannot work tableView")
        }
    
        DispatchQueue.main.async { [self] in
                cell.configure(model: filteredData[indexPath.row])
            }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected cell at row \(indexPath.row)")
    }
    
}







//class BabyTrack {
//    enum Activity {
//        case Feeding
//        case Diaper
//        case Slee
//    }
//
//    let activty: Activity
//    init(activty: Activity) {
//        self.activty = activty
//    }
//}
//
//
//let a = BabyTrack(activty: .Diaper)
//
//
//let calenderDataModel = [BabyTrack]()


class ActivityModel {
    enum Activity {
        case Feed
        case Sleep
        case Diaper
        case None
    }
    
    let type: Activity?
    let time: String?
    var note: String?
    
    init(type: Activity? = .None, time: String? = "", note: String? = "") {
        self.type = type
        self.time = time
        self.note = note
    }
}
