//
//  FirstLanguageVC.swift
//  PeerGC
//
//  Created by Artemas Radik on 7/24/20.
//  Copyright © 2020 AJ Radik. All rights reserved.
//

import Foundation
import UIKit

class FirstLanguageVC: GenericStructureViewController {
    override func viewDidLoad() {
        metaDataDelegate = self
        buttonsDelegate = self
        super.viewDidLoad()
    }
    
    override func selectionButtonTextHandler(text: String) {
        if text == DatabaseValue.other.rawValue {
            nextViewControllerHandler(viewController: OtherFirstLanguageVC())
        } else {
            GenericStructureViewController.sendToDatabaseData[databaseIdentifier().name] = text
            nextViewControllerHandler(viewController: nextViewController())
        }
    }
}

extension FirstLanguageVC: GenericStructureViewControllerMetadataDelegate {
    func title() -> String {
        return "What is your first language?"
    }
    
    func subtitle() -> String? {
        return "This information will be displayed on your public profile and is used by our matching algorithm."
    }
    
    func nextViewController() -> UIViewController? {
        return MatchingVC()
    }
}

extension FirstLanguageVC: ButtonsDelegate {
    func databaseIdentifier() -> DatabaseKey {
        return .First_Language
    }
    
    func buttons() -> [DatabaseValue] {
        return [.english, .other]
    }
}
