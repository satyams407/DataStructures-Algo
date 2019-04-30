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

func levelOrderTraversal(with rootNode: Node<Int>?) {
    guard let rootNode = rootNode else { return }
    var queueInstance: Queue? = Queue.init(with: [rootNode])
    guard let queue = queueInstance else { return }
    while(!queue.isEmpty()) {
        print(queue.front?.value ?? 0)
        let tempNode = queue.dequeue()
        if let leftChild = tempNode?.child.first {
            queue.Enqueue(leftChild)
        }
        if let rightChild = tempNode?.child.last {
            queue.Enqueue(rightChild)
        }
    }
    queueInstance = nil
}


func zigZagTraversalInSpiralOrder<T: Comparable>(with rootNode: Node<T>?) {
    guard let rootNode = rootNode else { return }
    var stack1 = Stack.init(with: [])
    var stack2 = Stack.init(with: [])
    stack1.push(rootNode)
    while !stack1.isEmpty() || !stack2.isEmpty() {
        while !stack1.isEmpty() {
            let node = stack1.top() as? Node<T>
            print(node?.data ?? 0)
            stack1.pop()
            if let leftChild = node?.child.first {
                stack2.push(leftChild)
            }
            if let rightChild = node?.child.last {
                stack2.push(rightChild)
            }
        }
        while !stack2.isEmpty() {
            let node = stack2.top() as? Node<T>
            print(node?.data ?? 0)
            stack2.pop()
            if let rightChild = node?.child.last {
                stack1.push(rightChild)
            }
            if let leftChild = node?.child.first {
                stack1.push(leftChild)
            }
        }
    }
}

// Optimised way using 2 stacks 
// Time complexity - O(n)
// Space complexity - O(n) + O(n) = O(n) 
func zigZagTraversalInSpiralOrder<T: Comparable>(with rootNode: Node<T>?) {
    guard let rootNode = rootNode else { return }
    var stack1 = Stack.init(with: [])
    var stack2 = Stack.init(with: [])
    stack1.push(rootNode)
    var isLeftToRight = false
    while !stack1.isEmpty() {
        if let node = stack1.top() as? Node<T> {
            print(node.data)
            stack1.pop()
            if isLeftToRight {
                if let rightChild = node.child.last {
                    stack2.push(rightChild)
                }
                if let leftChild = node.child.first {
                    stack2.push(leftChild)
                }
            } else {
                if let leftChild = node.child.first {
                    stack2.push(leftChild)
                }
                if let rightChild = node.child.last {
                    stack2.push(rightChild)
                }
            }
        }
        if stack1.isEmpty() {
            isLeftToRight = !isLeftToRight
            swap(&stack1, &stack2)
        }
    }
}
