// When Array is already sorted 
// Time complexity - o(n) and space complexity - o(n)

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    guard numbers.count > 1 else { return [Int]() }
    
    var leftPointer = 0, rightPointer = numbers.count - 1
    
    while leftPointer < rightPointer {
        if numbers[leftPointer] + numbers[rightPointer] < target {
            leftPointer += 1
        } else if numbers[leftPointer] + numbers[rightPointer] > target {
            rightPointer -= 1
        } else {
            return [leftPointer + 1, rightPointer + 1]
        }
    }
    
    return [Int]()
}

/*
 * Traverse the array and store target - nums[i] in a dict
 * Time Complexity: O(n), Space Complexity: O(n)
 * return two indexes which sum up to target K (TWO SUM)
*/
func twoSumII(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = Dictionary<Int, Int>()
    
    for (key, value) in nums.enumerated() {
        if let idx = dict[target - value] {
            return [idx, key]
        }
        dict[value] = key
    }
    fatalError("no pair found")
}
