//
//  FirstMessageVC.swift
//  PeerGC
//
//  Created by Artemas Radik on 8/6/20.
//  Copyright © 2020 AJ Radik. All rights reserved.
//

import Foundation
import UIKit

class FirstMessageVC: UIViewController {
    
    var customCell: CustomCell? = nil
    var chatVC: ChatViewController? = nil
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet var option1Button: DesignableButton!
    @IBOutlet var option2Button: DesignableButton!
    @IBOutlet var option3Button: DesignableButton!
    @IBOutlet var option4Button: DesignableButton!
    
    @IBOutlet var options: [DesignableButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.font = titleLabel.font.withSize((3.0/71) * UIScreen.main.bounds.height)
        subTitleLabel.font = subTitleLabel.font.withSize((1.5/71) * UIScreen.main.bounds.height)
        
        for option in options {
            option.titleLabel!.font = option.titleLabel!.font.withSize((1.5/71) * UIScreen.main.bounds.height)
            option.titleLabel?.textAlignment = .center
        }
        
        setOptions()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender != option4Button {
            chatVC?.newMessage(message: sender.titleLabel!.text!)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func setOptions() {
        if customCell!.data![DatabaseKey.accountType.name] == DatabaseValue.student.name {
            option1Button.setTitle("I was wondering if you could tell me about how you first got interested in \(DatabaseValue(name: customCell!.data![DatabaseKey.interest.name]!)!.rawValue)?", for: .normal)
            option2Button.setTitle("Why'd you choose \(DatabaseValue(name: customCell!.data![DatabaseKey.kindOfCollege.name]!)!.rawValue) as your college type?", for: .normal)
            option3Button.setTitle("Hello! What can I help you with the most?", for: .normal)
        }
        
        else if customCell!.data![DatabaseKey.accountType.name] == DatabaseValue.mentor.name {
            option1Button.setTitle("I was wondering if you could tell me about how you first got interested in \(DatabaseValue(name: customCell!.data![DatabaseKey.major.name]!)!.rawValue)?", for: .normal)
            option2Button.setTitle("Why'd you choose \(customCell!.data![DatabaseKey.collegeName.name]!) as your school?", for: .normal)
            option3Button.setTitle("I was wondering if you could help me with standardized testing?", for: .normal)
        }
        
        option4Button.setTitle("I will write my own message.", for: .normal)
    }
    
}