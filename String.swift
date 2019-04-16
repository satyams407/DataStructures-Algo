// MARK: Reverse a string without using inbuilt functions
print("Enter the string")
let string = readLine()!
var resultString = ""
for i in 0..<string.count  {
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

// MARK: Check Permutation - whether for given two strings, one is permutation of other or not
// MARK: Check anagrams
func checkPermutation(str1: String, str2: String) -> Bool {
        // Base case
        if str1.count != str2.count {
            return false
        }
        
        let sortedStr1 = str1.sorted(by: {$0 < $1})
        let sortedStr2 = str2.sorted(by: {$0 < $1})
        for index in 0..<sortedStr1.count where sortedStr1[index] != sortedStr2[index] {
            return false
        }
    return true
 }

// MARK: Check anagrams - optimised solution - Time O(n) and space O(n)
func checkAnagrams(str1: String, str2: String) -> Bool {
        guard str1.count == str2.count else { return false }
        var dictionary = Dictionary<Character, Int>()
        for index in 0..<str1.count {
            let value1 = str1[str1.index(str1.startIndex, offsetBy: index)]
            let value2 = str2[str2.index(str2.startIndex, offsetBy: index)]
            dictionary[value1] = (dictionary[value1] ?? 0) + 1
            dictionary[value2] = (dictionary[value2] ?? 0) - 1
        }
        return !dictionary.contains(where: {(_, value) in
            return value != 0
        })
 }
