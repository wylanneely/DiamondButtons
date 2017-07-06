//
//  TabBarViewController.swift
//  CustomTabbarController
//
//  Created by ALIA M NEELY on 7/6/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {
    
    override func viewDidLoad() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        settingsViewController = storyboard.instantiateViewController(withIdentifier: "SettingsViewController")
        scoresViewController = storyboard.instantiateViewController(withIdentifier: "ScoreViewController")
        
        viewControllerz = [mainViewController, settingsViewController,scoresViewController]
        
    }
    
    var selectedIndex: Int = 0
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var buttons: [UIButton]!
    
    var mainViewController: UIViewController!
    var settingsViewController: UIViewController!
    var scoresViewController: UIViewController!
    
    var viewControllerz: [UIViewController]!
    
    var viewControllers = [SettingsViewController(),MainViewController(), ScoresViewController()]
    
    
}
