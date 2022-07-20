import UIKit

class Heap<T: Comparable> {
    
    var capacity: Int = 10
    var count: Int = 0
    var isEmpty: Bool { return count == 0 }
    
    var items: [T?]
    
    init() {
        items = Array(repeating: nil, count: capacity)
    }
}
private func ensureExtraCapacity() {
    if capacity == count {
        items.append(contentsOf: Array(repeating: nil, count: capacity))
        capacity = capacity * 2
    }
}
public func add(_ item: T) {
    ensureExtraCapacity()
    items[count] = item
    count+=1
    heapifyUp()
}

private func heapifyUp() {
    if isEmpty { return }
    var index = count - 1
    while hasParent(index) && parent(index) > items[index]! {
        items.swapAt(index, getParentIndex(index))
        index = getParentIndex(index)
    }
}
