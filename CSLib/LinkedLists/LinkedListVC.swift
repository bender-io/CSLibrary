//
//  LinkedListVC.swift
//  CSLib
//
//  Created by Brian Hersh on 9/13/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class LinkedListVC: UIViewController {

    // MARK: - Properties
    private var linkedList = LinkedList<Int>()
    private var array = [1, 2, 3, 4, 5]
    private let ints = 1...99
    
    // MARK: - IBOutlets
    @IBOutlet weak var linkedListLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createLinkedList(from: array)
        updateViews()
    }
    
    // MARK: - IBActions
    @IBAction func appendButtonTapped(_ sender: Any) {
        linkedList.append(ints.randomElement()!)
        updateViews()
    }
    
    @IBAction func pushButtonTapped(_ sender: Any) {
        linkedList.push(ints.randomElement()!)
        updateViews()
    }
    
    @IBAction func removeLastButtonTapped(_ sender: Any) {
        let removeLast = linkedList.removeLast()
        print("Removed Last Value: \(removeLast as Any)")
        updateViews()
    }
    
    @IBAction func popButtonTapped(_ sender: Any) {
        let popped = linkedList.pop()
        print("Popped Value: \(popped as Any)")
        updateViews()
    }
    
    // MARK: - Methods
    private func createLinkedList(from array: [Int]) {
        for n in array {
            linkedList.append(n)
        }
    }
    
    private func updateViews() {
        linkedListLabel.text = "\(linkedList)"
    }
}
