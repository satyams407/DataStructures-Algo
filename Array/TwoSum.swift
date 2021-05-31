// When Array is already sorted 
// Time complexity - o(n) and space complexity - o(n)

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    guard numbers.count > 1 else { return [Int]() }
    
    var left = 0, right = numbers.count - 1
    
    while left < right {
        if numbers[left] + numbers[right] < target {
            left += 1
        } else if numbers[left] + numbers[right] > target {
            right -= 1
        } else {
            return [left + 1, right + 1]
        }
    }
    
    return [Int]()
}

// return two indexes which sum up to target K (TWO SUM)
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
