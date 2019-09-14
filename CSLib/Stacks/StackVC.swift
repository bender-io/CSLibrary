//
//  StackVC.swift
//  CSLib
//
//  Created by Brian Hersh on 9/13/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class StackVC: UIViewController {

    private var stack = Stack([1, 2, 3, 4, 5])
    private var ints = 1...99
    
    // MARK: - IBOutlets
    @IBOutlet weak var stackLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - IBActions
    @IBAction func pushButtonTapped(_ sender: Any) {
        stack.push(ints.randomElement()!)
        updateViews()
    }
    
    @IBAction func popButtonTapped(_ sender: Any) {
        let pop = stack.pop()
        print(pop as Any)
        updateViews()
    }
    
    // MARK: - Methods
    private func updateViews() {
        stackLabel.text = "\(stack)"
    }
}
