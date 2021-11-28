//
//  FeedController.swift
//  TwitterSwift
//
//  Created by Hari on 28/11/21.
//

import UIKit

class FeedController: UIViewController {
    // MARK: - Properties
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
        let imageView = UIImageView(image: UIImage(named: "twitterLogo"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
}
