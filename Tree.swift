//
//  Tree.swift
//  DataStructures
//
//  Created by Satyam Sehgal on 28/04/19.
//  Copyright © 2019 Satyam Sehgal. All rights reserved.
//

import Foundation

public class Node<T: Equatable> {
    var value: T
    weak var parent: Node<T>?
    var child = [Node<T>]()
    
    init(with data: T) {
        self.value = data
    }
    
    public func addChild(_ node: Node<T>) {
        child.append(node)
        node.parent = self
    }
}

let node1 = Node(with: 1) // root node

let node2 = Node(with: 2)
let node4 = Node(with: 4)
let node5 = Node(with: 5)

let node3 = Node(with: 3)
let node6 = Node(with: 6)
let node7 = Node(with: 7)

// Consisdering it to binary
func preOrderTraversal(with rootNode: Node<Int>?) {
    guard let rootNode = rootNode else { return }
    print(rootNode.value)
    preOrderTraversal(with: rootNode.child.first)
    preOrderTraversal(with: rootNode.child.last)
}

func inOrderTraversal(with rootNode: Node<Int>?) {
    guard let rootNode = rootNode else { return }
    inOrderTraversal(with: rootNode.child.first)
    print(rootNode.value)
    inOrderTraversal(with: rootNode.child.last)
}

func postOrderTraversal(with rootNode: Node<Int>?) {
    guard let rootNode = rootNode else { return }
    postOrderTraversal(with: rootNode.child.first)
    postOrderTraversal(with: rootNode.child.last)
    print(rootNode.value)
}
