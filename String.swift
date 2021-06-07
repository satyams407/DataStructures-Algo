extension String {
    mutating func swapAt(_ index1: Int, _ index2: Int) {
        var characters = Array(self)
        characters.swapAt(index1, index2)
        self = String(characters)
    }
}

// MARK: Reverse a string without using inbuilt functions
print("Enter the string")
let string = readLine()!
var resultString = ""
for i in 0..<string.count  {
    let index = string.index(string.startIndex, offsetBy: (string.count - 1) - i)
    resultString.append(string[index])
}
print(resultString)

// Min number of adjacent swaps to make a string palindrome - on failure return -1 
func getMinNumberOfSwapsToMakePalindrome(from string: inout String) -> Int {
    guard string.count > 0 else  { return -1 }
    
    var totalSwapsCount = 0
    
    var i = 0
    var j = string.count - 1
    
    while i < j {
        let leftIndex = string.index(string.startIndex, offsetBy: i)
        let rightIndex = string.index(string.startIndex, offsetBy: j)
        
        if string[leftIndex] != string[rightIndex] {
            var k = j
            var kIndex = rightIndex
            while (i < k) && (string[leftIndex] != string[kIndex]) {
                k = k - 1
                kIndex = string.index(string.startIndex, offsetBy: k)
            }
            
            if k == i {
                // NO match found
                string.swapAt(i, i + 1)
                totalSwapsCount = totalSwapsCount + 1
            } else {
                while k < j {
                    string.swapAt(k, k + 1)
                    totalSwapsCount = totalSwapsCount + 1
                    k = k + 1
                }
                i = i + 1
                j = j - 1
            }
        } else {
            i = i + 1
            j = j - 1
        }
    }
    
    if !testPalindrome(palindromeStr: string)  { return -1 }
    
    return totalSwapsCount
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

// MARK: How many palindromes are in a word with string length > 2
/* For eg: str = "abbaeae" thus output is 4
   Explanation : All palindrome substring are : "bb", "abba", "aea", "eae":
*/
func noOfPalindromes(inString str: String) -> Int {
        var count = 0
        for i in 0..<str.count {
            let iIndex = str.index(str.startIndex, offsetBy: i)
            for j in (i+1)..<str.count {
                let jIndex = str.index(str.startIndex, offsetBy: j)
                let tempSubString = str[iIndex...jIndex]
                let rvrString = String(tempSubString.reversed())
                if rvrString.compare(tempSubString) == .orderedSame {
                    count = count + 1
                }
            }
        }
    return count
 }

// MARK: Removes duplicates if any and maintain the orignal order - o(n) + o(n)
func removeDuplicatesIfAny(with array: [String]) -> [String] {
    var resultArray = [String]()
    var countDictionary = Dictionary<String,Int>()
    
    for idx in 0..<array.count {
        let index = array.index(array.startIndex, offsetBy: idx)
        countDictionary[array[index]] = (countDictionary[array[index]] ?? 0) + 1
        if countDictionary[array[index]]! < 2 {
            resultArray.append(array[index])
        }
    }
    return resultArray
}

// eg agoda best apps - "apps best agoda"
func reverseStringWithWords(_ str: String) -> String {
    var resultstr = ""
    let spiltArr = str.reversed().split(separator: " ")
    for string in spiltArr {
        resultstr += string.reversed() + " "
    }
   return resultstr
}
