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
        
        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])
        
    }
    
    var selectedIndex: Int = 1
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var tabbar: UIView!
    
    @IBOutlet var buttons: [UIButton]!
    
    var viewControllers: [UIViewController] = {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        let settingsViewController = storyboard.instantiateViewController(withIdentifier: "SettingsViewController")
        let scoresViewController = storyboard.instantiateViewController(withIdentifier: "ScoreViewController")
        
        return [settingsViewController, mainViewController, scoresViewController]
    }()
    
    @IBAction func didPressTab(_ sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        buttons[previousIndex].isSelected = false
        
        // Pops the previews view
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        // Pushes on the new view
        sender.isSelected = true
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        
        
        //Adjust the size of the ViewController view you are adding to match the contentView of your tabBarViewController and add it as a subView of the contentView.
        vc.view.frame = contentView.bounds 
        contentView.addSubview(vc.view)
    //    self.view.bringSubview(toFront: self.tabbar)
        
        
        // Call the viewDidApperear you are adding using didMove(toParentViewController: self).
        
        vc.didMove(toParentViewController: self)
        
        
    }
    
    
    
}
