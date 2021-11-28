//
//  ConversationsController.swift
//  TwitterSwift
//
//  Created by Hari on 28/11/21.
//

import UIKit

class ConversationsController: UIViewController {
    // MARK: - Properties
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
        navigationItem.title = "Messages"
    }
}
