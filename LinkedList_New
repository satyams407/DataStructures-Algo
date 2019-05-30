//
//  LinkedList.swift
//  DataStructures
//
//  Created by Satyam Sehgal on 28/05/19.
//  Copyright © 2019 Satyam Sehgal. All rights reserved.
//

import Foundation

public class LinkedListNode<T>: Comparable where T: Comparable {
    var data: T
    var nextPointer: LinkedListNode<T>?
    
    init(with data: T) {
        self.data = data
    }
    
    public func addNextPointer(_ node: LinkedListNode<T>?) {
        self.nextPointer = node
    }
    
    public static func == (lhs: LinkedListNode<T>, rhs: LinkedListNode<T>) -> Bool {
        return lhs.data == rhs.data
    }
    
    public static func < (lhs: LinkedListNode<T>, rhs: LinkedListNode<T>) -> Bool {
        return lhs.data < rhs.data
    }
}

var headNode = LinkedListNode(with: 1)
var llNode2 = LinkedListNode(with: 2)
var llNode3 = LinkedListNode(with: 3)
var llNode4 = LinkedListNode(with: 4)
var llNode5 = LinkedListNode(with: 5)
var llNode6 = LinkedListNode(with: 6)


// find nth node from the end
// brute force approach - o(n) + o(n) (two scans) = find the length - m then travese till m - (n-1) node
// efficent approach
func lastNthFromEnd<T: Comparable>(with headNode: LinkedListNode<T>, n: Int) -> LinkedListNode<T>? {
    var tempHeadNode: LinkedListNode<T>? = headNode
    var pNthNode: LinkedListNode<T>? = headNode
    var count = 0
    while count < n {
        if tempHeadNode?.nextPointer == nil {
            print("out of range number")
            return nil
        }
        count = count + 1
        tempHeadNode = tempHeadNode?.nextPointer
    }
    while tempHeadNode != nil {
        tempHeadNode = tempHeadNode?.nextPointer
        pNthNode = pNthNode?.nextPointer
    }
    return pNthNode
}

// for eg 1->2->3->4->5->6->nil
// output will be 2->1->4->3->6->5->nil
func reversePairInLinkedList<T: Comparable>(with headNode: LinkedListNode<T>?) -> LinkedListNode<T>? {
    var tempNode: LinkedListNode<T>?
    guard var headNode = headNode, headNode.nextPointer != nil else { return nil }
    
    tempNode = headNode.nextPointer
    headNode.nextPointer = tempNode?.nextPointer
    tempNode?.nextPointer = headNode
    if tempNode != nil  { headNode = tempNode! }
   
    headNode.nextPointer?.nextPointer = reversePairInLinkedList(with:  headNode.nextPointer?.nextPointer)
    
    return headNode
}

