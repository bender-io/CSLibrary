//
//  BinaryTree.swift
//  CSLib
//
//  Created by Brian Hersh on 9/18/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import Foundation

public class BinaryNode<Element> {
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public init(value: Element) {
        self.value = value
    }
}

extension BinaryNode {
    
    /// First traverses the left-most node before visiting the value. Then traverse to the right-most node
    public func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    /// First visits the current node. Then recursively traverses left to right.
    public func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    /// First visists left and right child. Then visits self.
    public func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}

extension BinaryNode: CustomStringConvertible {
    public var description: String {
        return diagram(for: self)
    }
    
    private func diagram(for node: BinaryNode?, _ top: String = "", _ root: String = "", _ bottom: String = "") -> String {
        guard let node = node else { return root + "nil\n" }
        
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        
        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.value)\n"
            + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

private extension BinaryNode {
    var min: BinaryNode {
        return leftChild?.min ?? self
    }
}

// MARK: - BinarySearchTree Struct
public struct BinarySearchTree<Element: Comparable> {
    public private(set) var root: BinaryNode<Element>?
    public init(){}
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        guard let root = root else { return "empty tree" }
        return String(describing: root)
    }
}

// MARK: - Insert Methods
extension BinarySearchTree {
    // Public insert method exposed to the users for use
    public mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    // Private helper insert method
    /// O(log n) Insertion:
    /// 1. If the current node is nil, you’ve found the insertion point and you return the new BinaryNode.
    /// 2. If the new value is less than the current value, you call insert on the left child. If the new value is greater than or equal to the current value, you’ll call insert on the right child.
    /// 3. Return the current node. This makes assignments of the form node = insert(from: node, value: value) possible as insert will either create node (if it was nil) or return node (it it was not nil).
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        guard let node = node else { return BinaryNode(value: value) }
        
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        return node
    }
}

// MARK: - Contains Methods
extension BinarySearchTree {
    
    /// O(log n) Contains: Traverses through the tree in-order and returns true if the value is found
    /// 1. Start by setting current to the root node. While current is not nil, check the current node’s value.
    /// 2. If the value is equal to what you’re trying to find, return true.
    /// 3. Otherwise, decide whether you’re going to check the left or the right child.
    public func contains(_ value: Element) -> Bool {
        var current = root
        
        while let node = current {
            if node.value == value {
                return true
            } else if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }
}

// MARK: - Remove Methods
extension BinarySearchTree {
    /// Public remove method for users
    public mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }
    
    // Private helper
    /// O(log n) Removal: Similar to insert, but with different leaf cases:
    /// 1. In the case in which the node is a leaf node, you simply return nil, thereby removing the current node.
    /// 2. If the node has no left child, you return node.rightChild to reconnect the right subtree.
    /// 3. If the node has no right child, you return node.leftChild to reconnect the left subtree.
    /// 4. This is the case in which the node to be removed has both a left and right child. You replace the node’s value with the smallest value from the right subtree. You then call remove on the right child to remove this swapped value.
    private func remove(node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard let node = node else { return nil }
        
        if value == node.value {
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            if node.leftChild == nil {
                return node.rightChild
            }
            if node.rightChild == nil {
                return node.leftChild
            }
            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.value)
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        return node
    }
}
