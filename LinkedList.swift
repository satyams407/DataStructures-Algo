import UIKit
import Foundation

public class Node<T> {
    var value: T
    var nextNode: Node?

    public init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {
    public typealias node =  Node<T>
    var headNode: Node<T>?

    public init() {}

    func createNode(_ data: T)  {
        let newNode = node.init(value: data)
        if var head = headNode {
            while head.nextNode != nil {
                head = head.nextNode!
            }
            head.nextNode = newNode
        } else {
           headNode = newNode
        }
    }

    func printLinkedList() {
        var currentNode: Node? = headNode
        while (currentNode != nil) {
            print(currentNode?.value ?? 0)
            currentNode = currentNode?.nextNode
        }
    }
}

let list = LinkedList<Int>()
list.createNode(1)
list.createNode(2)
list.createNode(3)
list.createNode(4)

list.printLinkedList()


