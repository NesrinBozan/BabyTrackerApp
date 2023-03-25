//
//  CalenderCustomButton.swift
//  BabyTracker
//
//  Created by Nesrin Bozan on 23.03.2023.
//

import Foundation
import UIKit

class CalenderCustomButton: UIButton {
    
    private let selectedImage: UIImage
    private let unselectedImage: UIImage
    
    init(selectedImage: UIImage, unselectedImage: UIImage) {
        self.selectedImage = selectedImage
        self.unselectedImage = unselectedImage
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        setBackgroundImage(unselectedImage, for: .normal)
        setBackgroundImage(selectedImage, for: .selected)
    }
}
