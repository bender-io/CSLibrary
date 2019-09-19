//
//  Stack.swift
//  CSLib
//
//  Created by Brian Hersh on 9/13/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import Foundation

public struct Stack<Element> {
    
    private var storage: [Element] = []
    public init(){}
    public init(_ elements: [Element]) {
        storage = elements
    }
    
    public var isEmpty: Bool {
        return peek() == nil
    }
    
    /// O(1) -> Peeks at the top element in the stack, without mutating it
    public func peek() -> Element? {
        return storage.last
    }
    
    /// O(1) -> Pushes an element to the top of the stack
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    /// O(1) -> Pops an element from the top of the stack
    public mutating func pop() -> Element? {
        return storage.popLast()
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        let topDivider = "----top----\n"
        let bottomDivider = "\n----bottom----"
        
        let stackElements = storage
            .map{"\($0)"}
            .reversed()
            .joined(separator: "\n")
        
        return topDivider + stackElements + bottomDivider
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}


