struct Stack<T> {
    private var items: [T]
    
    init(with items: [T]) {
        self.items = items
    }
    
    func top() -> T? {
        guard let firstElement = items.first else { return nil }
        return firstElement
    }
    
    mutating func push(_ element: T) {
        items.insert(element, at: 0)
    }
    
    mutating func pop() {
        items.removeFirst()
    }
}
