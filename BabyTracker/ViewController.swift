//
//  ViewController.swift
//  BabyTracker
//
//  Created by Nesrin Bozan on 21.03.2023.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    
    var onboardingPages = [OnboardingViewController]()
    var pageViewController: UIPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController?.dataSource = self
    
        let page1 = OnboardingViewController(imageName: "img_1",
                                             titleText: "Track Your Baby's Activities with Ease",
                                             subtitleText: "Get started with tracking your baby's feedings, diaper changes, sleep patterns, and more...",
                                             pageViewController: pageViewController! ,sliderName: "slider1")
        let page2 = OnboardingViewController(imageName: "img_2",
                                             titleText: "Learn About Your Baby",
                                             subtitleText: "Customize your baby's profile, set reminders for important activities, and view detailed reports on your baby's progress.",
                                             pageViewController: pageViewController!,  sliderName: "slider2")
        let page3 = OnboardingViewController(imageName: "img_3",
                                             titleText: "Stay Connected with Caregivers",
                                             subtitleText: "Share access to your baby's tracker with family members, babysitters, or healthcare providers.",
                                             pageViewController: pageViewController!, sliderName: "slider3")

        onboardingPages.append(page1)
        onboardingPages.append(page2)
        onboardingPages.append(page3)
   
        if let firstPage = onboardingPages.first {
            pageViewController?.setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
        }
        addChild(pageViewController!)
        view.addSubview(pageViewController!.view)
        
        pageViewController!.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        pageViewController!.didMove(toParent: self)
    }
}

// MARK: - UIPageViewControllerDataSource

extension ViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = onboardingPages.firstIndex(of: viewController as! OnboardingViewController) else {
            return nil
        }
        let nextIndex = currentIndex + 1
        if nextIndex >= onboardingPages.count {
            let inAppViewController = InAppViewController()
            return inAppViewController
        }
        return onboardingPages[nextIndex]
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = onboardingPages.firstIndex(of: viewController as! OnboardingViewController) else {
            return nil
        }
        let previousIndex = currentIndex - 1
        if previousIndex < 0 {
            return nil
        }
        return onboardingPages[previousIndex]
    }
}

