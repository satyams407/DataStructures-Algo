// Given a non-empty array of integers, every element appears twice except for one. Find that single one.
func singleNumber(_ nums: [Int]) -> Int {
        return nums.reduce(0, ^)
}

func singleNumber(_ nums: [Int]) -> Int {
        if nums.isEmpty { fatalError("Empty array is not valid input") }
        var aSet: Set<Int> = Set()
        for i in 0..<nums.count {
            if aSet.contains(nums[i]) {
                aSet.remove(nums[i])
            } else {
                aSet.insert(nums[i])
            }
        }
        return aSet.first!
}


// return two indexes which sum up to target K (TWO SUM)
 func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
            var dict = Dictionary<Int, Int>()
            
            for (key, value) in nums.enumerated() {
                if let idx = dict[target - value] {
                    return [idx, key]
                }
                dict[value] = key
            }
            fatalError("no pair found")
  }

// minimum pair product 
func minimumProduct(in array: [Int]) -> Int {
  var minProduct: Int = Int.max
  let count = array.count
  array = array.sort {($0 < $1)}
  
  if array.count > 2 {
    if array[0] < 0 && array[count-1] < 0 {
      minProduct = array[count-1]*array[count-2]
    } else if array[0] < 0 {
        minProduct = array[0]*array[count-1]
    } else {
       minProduct =  array[0]*array[1]
    }
  } else if array.count == 2 {
     minProduct = array[0]*array[1]
  } else {
     print("array count is less than 2 so pair doesn't exist")
  }
  return minProduct
}

// Function to convert string into int given it contains only 0 to 9 digits
func myAtoi(with str: String)  -> Int {
    var result: Int = 0
    var place: Int = 1
    let rvstr = str.reversed()
    for idx in 0..<rvstr.count {
        var value: Int = 0
        let index = rvstr.index(rvstr.startIndex, offsetBy: idx)
        let byte = (rvstr[index].asciiValue! - Character("0").asciiValue!)
        value = value << 8
        value = value | Int(byte)
        result = result + (value * place)
        place = place*10
    }
    return result
}


func intersectionOfTwoSortedArray() {
    let arr1 = [1,5,6,9]
    let arr2 = [2,3,5,9]
    var i = 0
    var j = 0
    while (i < arr1.count && j < arr2.count) {
        if arr1[i] == arr2[j] { print(arr2[j])
            i += 1
            j += 1
        }
        else if (arr1[i] < arr2[j]) {
            i += 1
        } else {
            j += 1
        }
    }
}

// find max difference between two elements such that larger element appears after smaller element
func maxDiff(arr: [Int32]) -> Int32 {
    var maxDiff = INT8_MIN
    for i in 0..<arr.count {
        for j in i..<arr.count {
            if (arr[j] - arr[i]) > maxDiff {
                maxDiff = (arr[j] - arr[i])
            }
        }
    }
    return maxDiff
}

// optimise solution
func maxDiffOptimsed(arr: [Int32]) -> Int32 {
    var maxDiff = arr[1] - arr[0]
    var minElement = arr[0]
    
    for i in 1..<arr.count {
        if arr[i] - minElement > maxDiff {
            maxDiff = arr[i] - minElement
        }
        if arr[i] < minElement {
            minElement = arr[i]
        }
    }
    return maxDiff
}

//Given an array of n elements which contains elements from 0 to n-1, with any of these numbers appearing any number of times.
func printAllDuplicates() {
    var arr = [1,2,3,1,3,6,6]
    let n = arr.count
    for idx in 0..<arr.count {
        let index = arr[idx] % n
        arr[index] += n
    }
    for idx in 0..<arr.count {
        if arr[idx]/n > 1 {
            print(idx)
        }
    }
}

// find whether duplicates are there or not in an array
// return true if duplicates are there
func hasDuplicates(_ numarray: [Int]) -> Bool {
    if numarray.count == 0 || numarray.count == 1  {
        print("no duplicates")
        return false
    }
    
    let set = Set(numarray)
    
    if set.count != numarray.count { return true }
    
    return false
}
// Or How to remove duplicates - take dictionary ..filter out the array if it contains more than one



// find largest and smallest number from integer array unsorted one
// solution1 - apply sorting and return first and last element o(nlogn)
// solution2 - o(n) - Time complexity + o(1) - space complexity
func findLargestAndSmallest() {
    var arr = [2,4,1,6,100,0,-5]
    var minElement = arr[0]
    var maxElement = arr[0]
    
    for value in arr {
        if value > maxElement {
            maxElement = value
        }
        if value < minElement {
            minElement = value
        }
    }
    print("max element is \(maxElement), min element is \(minElement)")
}


// common elements in three unsorted array
func findCommonElements() {
    let a1 = [1,5,10,20,40,80]
    let a2 = [6,7,20,80,100]
    let a3 = [3,4,15,20,30,70,80,120]
    var i = 0
    var j = 0
    var k = 0
    
    while (i < a1.count) && (j < a2.count) && (k < a3.count) {
        
        if (a1[i] == a2[j]) && (a2[j] == a3[k]) {
            print(a1[i])
            i += 1
            j += 1
            k += 1
        } else if a1[i] < a2[j] {
            i += 1
        } else if a2[j] < a3[k] {
            j += 1
        } else {
            k += 1
        }
    }
}

// Rearrange positive and negative numbers in alternate order
func rearrange() {
    var a = [1,-2,3,1,4,-5]
    var i = -1
    var j = 0
    while j < a.count {
        if a[j] < 0 {
            i += 1
            a.swapAt(i, j)
        }
        j += 1
    }
    
    var postivePosition = i + 1
    var negativePosition = 0
    
    while (postivePosition < a.count  && negativePosition < postivePosition && a[negativePosition] < 0) {
        a.swapAt(negativePosition, postivePosition)
        postivePosition += 1
        negativePosition += 2
    }
    
    print(a)
}

// maximum sum subarray of length k
func maxiumSumSubArray(arr: [Int], k: Int) -> Int? {
        guard k <= arr.count else { return nil }
        
        var maxSum = 0
        
        for idx in 0..<k { maxSum += arr[idx] }
        
        var currentSum = maxSum
        
        var i = k
        while i < arr.count {
            currentSum += arr[i] - arr[i-k]
            if currentSum > maxSum {
                maxSum = currentSum
            }
            i += 1
        }
        return maxSum
    }

 // Time Complexity: O(nlogn), Space Complexity: O(n)
 func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        guard let pivot = nums.first else {
            fatalError("Invalid Input")
        }
       
        let leftPart = nums.filter { $0 > pivot }
        let middlePart = nums.filter { $0 == pivot}
        let rightPart = nums.filter { $0 < pivot }
        
        if nums.count == middlePart.count {
            return pivot
        }
        
        if leftPart.count > k - 1 {
            return findKthLargest(leftPart, k)
        } else if k - leftPart.count <= middlePart.count {
            return findKthLargest(middlePart, k - leftPart.count)
        } else {
            return findKthLargest(rightPart, k - leftPart.count - middlePart.count)
        }
    }
