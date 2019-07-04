//
//  SnakeAndLadder.swift
//  DataStructures
//
//  Created by Satyam Sehgal on 04/07/19.
//  Copyright © 2019 Satyam Sehgal. All rights reserved.
//

import Foundation

class QueueEntry: Equatable {
    var vertex: Int = 0
    var distance: Int = 0
    
    static func == (lhs: QueueEntry, rhs: QueueEntry) -> Bool {
        return lhs.vertex == rhs.vertex && lhs.distance == rhs.distance
    }
}

class SnakeAndLadder {
    
    private func getMinNumberOfDicesMove(_ moves: [Int], _ size: Int) -> Int {
        var qEntry = QueueEntry()
        let queue = Queue.init(with: [qEntry])
        var visitedNode = Array.init(repeating: 0, count: size)
        visitedNode[0] = 1
        
        while !queue.isEmpty() {
            if let q = queue.dequeue() {
                qEntry = q
                let currentVertex = qEntry.vertex
                
                if currentVertex == size {
                    break
                }
                
                var j = currentVertex + 1
                while j<(currentVertex+6) && j<size {
                    
                    if visitedNode[j] == 0 {
                        let a = QueueEntry()
                        a.distance = qEntry.distance + 1
                        visitedNode[j] = 1
                        
                        if moves[j] != -1 {
                            a.vertex = moves[j];
                        } else {
                            a.vertex = j
                        }
                        queue.Enqueue(a)
                    }
                    j += 1
                }
            }
        }
        return qEntry.distance
    }
    
    func performSnakeAndLadder() {
        
        var moves = Array.init(repeating: -1, count: 30)
        
        // Ladders
        moves[2] = 21;
        moves[4] = 7;
        moves[10] = 25;
        moves[19] = 28;
        
        // Snakes
        moves[26] = 0;
        moves[20] = 8;
        moves[16] = 3;
        moves[18] = 6;
        
        print("min number of dices to reach end point is \(getMinNumberOfDicesMove(moves, moves.count)) ")
    }
}
