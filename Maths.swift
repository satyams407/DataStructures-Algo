
func power(a: Int, b: Int) -> Int {
    var result = 0
    if b == 0 { return 1 }
    result = power(a: a, b: b/2)
    if b % 2 == 0 { return result * result }
    else { return a * result * result }
}
