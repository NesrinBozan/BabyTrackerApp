//
//  OnboardingViewController.swift
//  BabyTracker
//
//  Created by Nesrin Bozan on 21.03.2023.
//

import UIKit

class OnboardingViewController: UIViewController {

    var pageControl: UIPageControl!
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        imageView.layer.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1).cgColor
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.font = .boldSystemFont(ofSize: 37)
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    lazy var subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        subtitleLabel.font = UIFont(name: "Poppins", size: 17)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        return subtitleLabel
    }()
  
    lazy var nextButton: UIButton = {
         let nextButton = UIButton()
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        nextButton.backgroundColor = .white
        nextButton.layer.backgroundColor = UIColor.nextButtoColorn.cgColor
        nextButton.layer.cornerRadius = 25
        nextButton.translatesAutoresizingMaskIntoConstraints = false
         return nextButton
     }()
    
    var scrollView: UIScrollView!
    var pageViewController: UIPageViewController?
    let sliderImage = UIImageView()
    
    init(imageName: String, titleText: String, subtitleText: String, pageViewController: UIPageViewController, sliderName: String) {
        super.init(nibName: nil, bundle: nil)
        self.imageView.image = UIImage(named: imageName)
        self.titleLabel.text = titleText
        self.subtitleLabel.text = subtitleText
        self.nextButton.setTitle("Next", for: .normal)
        self.pageViewController = pageViewController
        self.sliderImage.image = UIImage(named: sliderName)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIDesign()
    }
 
    func setupUIDesign() {
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(427)
            make.left.equalToSuperview().offset(61)
            make.right.equalToSuperview().offset(-62)
            make.height.equalTo(84)
            
        }
        view.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(27)
            make.right.equalToSuperview().offset(-28)
        }
        view.addSubview(sliderImage)
        sliderImage.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(68)
            make.left.equalToSuperview().offset(184)
            make.right.equalToSuperview().offset(-230)
            make.height.equalTo(4)
            make.width.equalTo(44)
            
        }
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-82)
            make.left.equalToSuperview().offset(27)
            make.right.equalToSuperview().offset(-28)
            make.height.equalTo(64)
        }
          }
        
    @objc func nextTapped() {
        guard let viewController = pageViewController?.viewControllers?.first,
              let nextViewController = pageViewController?.dataSource?.pageViewController(pageViewController!, viewControllerAfter: viewController) else {
            return
        }
        pageViewController?.setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        updatePageControl(for: nextViewController)
     }
        
    func updatePageControl(for viewController: UIViewController) {
        if let indexClosure = pageViewController?.dataSource?.presentationIndex {
            let index = indexClosure(pageViewController!)
            pageControl.currentPage = index
        }
    }
}
