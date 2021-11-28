//
//  MainTabBarController.swift
//  TwitterSwift
//
//  Created by Hari on 28/11/21.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Properties
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigatorAppearance() // for navigation bar appearance in ios 15 to show it
        configureTabBarAppearance() // for tab bar appearance in ios 15 to show it
        configureViewController() // show bottom tab bar
    }
    
    // MARK: - Helpers
    
    // UITabBar in ios 15 will be transparent if not set this
    func configureTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.clear
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    // UINavigationBar in ios 15 will be transparent if not set this
    func configureNavigatorAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.clear
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    // to configure or show the bottom tab bar with icon
    func configureViewController() {
        
        let feed = FeedController()
        let feedImage = self.resizeImage(image: UIImage(named: "homeIcon")!, targetSize: CGSize(width: 25, height: 25))
        let feedNav = navigator(image: feedImage, rootViewController: feed)
        
        let explore = ExploreController()
        let exploreImage = self.resizeImage(image: UIImage(named: "searchIcon")!, targetSize: CGSize(width: 25, height: 25))
        let exploreNav = navigator(image: exploreImage, rootViewController: explore)
        
        let notifications = NotificationsController()
        let notificationsImage = self.resizeImage(image: UIImage(named: "heartIcon")!, targetSize: CGSize(width: 25, height: 25))
        let notificationNav = navigator(image: notificationsImage, rootViewController: notifications)
        
        let conversations = ConversationsController()
        let conversationsImage = self.resizeImage(image: UIImage(named: "mailIcon")!, targetSize: CGSize(width: 25, height: 25))
        let conversationsNav = navigator(image: conversationsImage, rootViewController: conversations)
        
        viewControllers = [feedNav, exploreNav, notificationNav, conversationsNav]
    }
    
    func navigator(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        
        let navigation = UINavigationController(rootViewController: rootViewController)
        navigation.tabBarItem.image = image
        navigation.navigationBar.barTintColor = .clear
        return navigation
    }
        
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
