//
//  BinaryTreeVC.swift
//  CSLib
//
//  Created by Brian Hersh on 9/18/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class BinaryTreeVC: UIViewController {
    
    // MARK: - Properties
    private var tree: BinarySearchTree<Int> {
        var bst = BinarySearchTree<Int>()
        bst.insert(3)
        bst.insert(1)
        bst.insert(4)
        bst.insert(0)
        bst.insert(2)
        bst.insert(5)
        
        return bst
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var btsBeforeLabel: UILabel!
    @IBOutlet weak var btsAfterLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTree()
    }
    
    // MARK: - IBActions
    @IBAction func insertButtonTapped(_ sender: UIButton) {
        guard let text = textField.text, !text.isEmpty else { return }
        
        var tree₁ = tree
        tree₁.insert(Int(text) ?? 0)
        btsAfterLabel.text = tree₁.description
    }
    
    @IBAction func removeButtonTapped(_ sender: UIButton) {
        guard let text = textField.text, !text.isEmpty else { return }
        
        var tree₁ = tree
        tree₁.remove(Int(text) ?? 0)
        btsAfterLabel.text = tree₁.description
    }
    
    @IBAction func containsButtonTapped(_ sender: UIButton) {
        guard let text = textField.text, !text.isEmpty else { return }
        
        btsAfterLabel.text = "Contains \(text): \(tree.contains(Int(text) ?? 123123))"
    }
    
    // MARK: - Methods
    private func setupTree() {
        btsBeforeLabel.text = tree.description
    }
}
