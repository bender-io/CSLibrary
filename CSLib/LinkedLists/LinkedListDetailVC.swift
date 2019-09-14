//
//  LinkedListDetailVC.swift
//  CSLib
//
//  Created by Brian Hersh on 9/13/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class LinkedListDetailVC: UIViewController {

    // MARK: - Properties
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction func dismissButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
