// MARK: Reverse a string without using inbuilt functions
print("Enter the string")
let string = readLine()!
var resultString = ""
for i in 0...(string.count - 1)  {
    let index = string.index(string.startIndex, offsetBy: (string.count - 1) - i)
    resultString.append(string[index])
}
print(resultString)


// MARK: Validate a string palindrome or not
func testPalindrome(palindromeStr: String) -> Bool {
    var left = 0
    var right = palindromeStr.count - 1
    if palindromeStr.count == 0 {
         return false
    } else if palindromeStr.count == 1 {
        return true
    }
        
    while left < right {
      let leftIndex = palindromeStr.index(palindromeStr.startIndex, offsetBy: left)
      let rightIndex = palindromeStr.index(palindromeStr.startIndex, offsetBy: right)
      if palindromeStr[leftIndex] !=  palindromeStr[rightIndex] {
          return false
      }
      left = left + 1
      right = right - 1
    }
   return true
}
