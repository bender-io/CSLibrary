//
//  Queue.swift
//  CSLib
//
//  Created by Brian Hersh on 9/16/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import Foundation

public protocol Queue {
    /// The generic protocol type
    associatedtype Element
    /// Insert an element at the back of the queue & returns true if the operation was successful
    mutating func enqueue(_ element: Element) -> Bool
    /// Remove the element at the front of the queue and return it
    mutating func dequeue() -> Element?
    /// Checks if the queue is empty
    var isEmpty: Bool { get }
    /// Return the element at the front of the queue without removing it
    var peek: Element? { get }
}

public struct QueueStacks<T>: Queue {
    /// Used to perform dequeues from the stack [newest...oldest] - removeLast for deque
    public var leftStack: [T] = []
    /// Used to perform enqueues from the stack [oldest...newest] - append(element) for enqueue
    public var rightStack: [T] = []
    public init(){}
    
    /// O(1) - Checks to see if both stacks are empty
    public var isEmpty: Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    
    /// O(1) - Returns the element at the front of the queue without removing it
    public var peek: T? {
        return !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    /// O(1) - Pushes to the stack by appending to the right stack array [oldest...newest] -> enqueue
    public mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
    
    /// Amortized O(1) - Removes the last value in the left stack array [newest...oldest] -> dequeue. If the left stack is empty, first adds the elements from the right stack in reversed order - O(n) operation - and clears the right stack.
    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
}
