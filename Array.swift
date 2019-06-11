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

