//
//  Queue.swift
//  DataStructures
//
//  Created by Satyam Sehgal on 28/04/19.
//  Copyright © 2019 Satyam Sehgal. All rights reserved.
//

import Foundation

class Queue<T: Equatable> {
    private var items: [T]
    
    init(with items: [T]) {
        self.items = items
    }
    
    // computed property
    var front: T? {
        return items.first
    }
    var rear: T? {
        return items.last
    }
    public func isEmpty() -> Bool {
        return items.isEmpty
    }
    
    public func Enqueue(_ element: T) {
        items.append(element)
    }
    
    public func dequeue() -> T? {
        guard !items.isEmpty else { return nil }
        return items.removeFirst()
    }
    
    deinit {
        print("queue deinit called")
    }
}
