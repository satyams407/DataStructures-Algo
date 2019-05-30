import UIKit

class Sorting {

    func bubbleSort(array: inout [Int]) {
        for _ in 0..<(array.count) {
            for innerIndex in 0..<(array.count - 1) {
                if array[innerIndex] > array[innerIndex + 1] {
                     let temp =  array[innerIndex]
                     array[innerIndex] = array[innerIndex + 1]
                     array[innerIndex + 1]  = temp
                }
            }
        }
    }

    func printArray(array: [Int]) {
        for index in array {
            print("\(index) ")
        }
    }

    private func swap(a: inout Int, b: inout Int) {
        a = a ^ b
        b = a ^ b
        a = a ^ b
    }

}

  var unsortedArray = [2,7,4,1,3,5]
  let object = Sorting()
  object.bubbleSort(array: &unsortedArray)
  object.printArray(array: unsortedArray)


