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