//
//  TabBarController.swift
//  Sales
//
//  Created by Philip Starner on 1/2/18.
//  Copyright © 2018 Philip Starner. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "logo_sm")
        imageView.image = image
        navigationItem.titleView = imageView
        
        self.setupTabs()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func setupTabs() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        let vc1 = storyboard.instantiateViewController(withIdentifier: "ContactsViewController")
        let icon1 = UITabBarItem(title: "Contacts", image: UIImage(named: "icon_account")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "icon_account_s")?.withRenderingMode(.alwaysOriginal))
        vc1.tabBarItem = icon1
        
        let vc2 = storyboard.instantiateViewController(withIdentifier: "TasksViewController")
        let icon2 = UITabBarItem(title: "Tasks", image: UIImage(named: "icon_wish")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "icon_wish_s")?.withRenderingMode(.alwaysOriginal))
        vc2.tabBarItem = icon2
        
        self.viewControllers = [vc1, vc2]
        
        self.tabBar.itemPositioning = .fill
        
        //bar item background
        let numberOfItems = CGFloat(tabBar.items!.count)
        let tabBarItemSize = CGSize(width: (tabBar.frame.width / numberOfItems), height: tabBar.frame.height)
        tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: Constants.COLOR_MAIN_TINT_2, size: tabBarItemSize)
        
        //text color
        let selectedColor   = UIColor.black
        let unselectedColor = UIColor.white
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: unselectedColor, NSAttributedStringKey.font: UIFont(name: "Avenir-Heavy", size: 12)!], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: selectedColor, NSAttributedStringKey.font: UIFont(name: "Avenir-Heavy", size: 12)!], for: .selected)
        
    }
}


