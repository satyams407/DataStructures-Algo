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
