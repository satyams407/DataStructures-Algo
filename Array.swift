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
