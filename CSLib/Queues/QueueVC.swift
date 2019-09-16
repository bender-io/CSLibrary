//
//  QueueVC.swift
//  CSLib
//
//  Created by Brian Hersh on 9/16/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class QueueVC: UIViewController {

    // MARK: - Properties
    private var queueStacks = QueueStacks<String>()
    private var count = 6
    
    // MARK: - IBOutlets
    @IBOutlet weak var leftStackLabel: UILabel!
    @IBOutlet weak var rightStackLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQueue()
    }
    
    // MARK: - IBActions
    @IBAction func enqueueButtonTapped(_ sender: Any) {
        print(queueStacks.enqueue("Ticket\(count)"))
        updateViews()
        count += 1
    }
    @IBAction func dequeueButtonTapped(_ sender: Any) {
        print(queueStacks.dequeue() as Any)
        updateViews()
    }
    @IBAction func infoButtonTapped(_ sender: Any) {
    }
    
    // MARK: - CRUD Methods
    private func setupQueue() {
        print(queueStacks.enqueue("Ticket1"))
        print(queueStacks.enqueue("Ticket2"))
        print(queueStacks.enqueue("Ticket3"))
        print(queueStacks.enqueue("Ticket4"))
        print(queueStacks.enqueue("Ticket5"))
        updateViews()
    }
    
    private func updateViews() {
        let leftStack = queueStacks.leftStack.map{$0}.joined(separator: "\n")
        let rightStack = queueStacks.rightStack.map{$0}.joined(separator: "\n")
        leftStackLabel.text = "\(leftStack)"
        rightStackLabel.text = "\(rightStack)"
    }
}
