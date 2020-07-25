//
//  HighSchoolGPAVC.swift
//  PeerGC
//
//  Created by Artemas Radik on 7/24/20.
//  Copyright © 2020 AJ Radik. All rights reserved.
//

import Foundation
import UIKit

class HighSchoolGPAVC: GenericStructureViewController {
    override func viewDidLoad() {
        genericStructureViewControllerMetadataDelegate = self
        buttonsDelegate = self
        super.viewDidLoad()
    }
}

extension HighSchoolGPAVC: GenericStructureViewControllerMetadataDelegate {
    func title() -> String {
        return "What was your high school GPA?"
    }
    
    func subtitle() -> String? {
        return "This information will be displayed on your public profile and is used by our matching algorithm."
    }
    
    func nextViewController() -> UIViewController? {
        return HighSchoolScoresVC()
    }
}

extension HighSchoolGPAVC: ButtonsDelegate {
    func databaseIdentifier() -> String {
        return "highSchoolGPA"
    }
    
    func buttons() -> [String] {
        return ["2 or under.", "Between 2 and 3.", "Between 3 and 4.", "4+"]
    }
}
