// MARK: Reverse a string without using inbuilt functions
print("Enter the string")
let string = readLine()!
var resultString = ""
for i in 1...string.count {
    let index = string.index(string.endIndex, offsetBy: -i)
    resultString.append(string[index])
}
print(resultString)
