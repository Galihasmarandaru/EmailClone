//
//  ViewController.swift
//  EmailApps
//
//  Created by Galih Asmarandaru on 04/11/20.
//

import UIKit

private let reuseIdentifier = "EmailCell"

class MainController: UITabBarController {
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()            
    }        

    func configureCollectionView() {
        let feed = EmailController(collectionViewLayout: UICollectionViewFlowLayout())
        let nav1 = templateNavigationController(image: UIImage(named: "mail"), rootViewController: feed)
        
        viewControllers = [nav1]
    }
    
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        return nav
    }    
}


