//
//  QueueDetailVC.swift
//  CSLib
//
//  Created by Brian Hersh on 9/16/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class QueueDetailVC: UIViewController {
    
    // MARK: - Properties
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - IBActions
    @IBAction func dismissButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
