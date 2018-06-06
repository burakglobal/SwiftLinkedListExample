

class Node {
    var value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class LinkedList {
    
    var head: Node?
    
    init(head: Node?) {
        self.head = head
    }
    
    func append(_ node: Node) {
        
        guard head != nil else {
            head = node
            return
        }
        
        var current = head
        while let _ = current?.next {
            current = current?.next
        }
        current?.next = node
    }
    
    
    func getNode(atPosition position: Int) -> Node? {
        guard position > 0 else {
            return nil
        }
        
        var counter = 1
        var current = head
        
        while current != nil && counter <= position {
            if counter == position {
                return current
            }
            current = current?.next
            counter += 1
        }
        return nil
    }
    
    func insertNode(_ node: Node, at position: Int) {
        guard position > 0 else {
            return
        }
        
        var counter = 1
        var current = head
        
        if position > 1 {
            while current != nil && counter < position {
                if counter == position - 1 {
                    node.next = current?.next
                    current?.next = node
                    break
                }
                current = current?.next
                counter += 1
            }
        } else if position == 1 {
            node.next = head
            head = node
        }
    }
    
    func deleteNode(withValue value: Int) {
        var current = head
        var previous: Node?
    
        while current?.value != value && current?.next != nil {
            previous = current
            current = current?.next
        }
    
        if current?.value == value {
            if previous != nil {
                previous?.next = current?.next
            } else {
                head = current?.next
            }
        }
    }
    
    
}


 let n1 = Node(value: 10)
 let n2 = Node(value: 20)
 let n3 = Node(value: 30)
 let n4 = Node(value: 40)
 
 // Start setting up a LinkedList
 let ll = LinkedList(head: n1)
 ll.append(n2)
 ll.append(n3)
 ll.append(n4)

 // Test getNode(atPosition:)
 print(ll.head!.next!.next!.next!.value) // Should print 40
 print(ll.getNode(atPosition: 3)!.value) // Should also print 30

 // Test insert
 ll.insertNode(n4, at: 3)
 print(ll.getNode(atPosition: 3)!.value) // Should print 40 now

 // Test delete(withValue:)
 ll.deleteNode(withValue: 1)
 print(ll.getNode(atPosition: 1)!.value) // Should print 20 now
 print(ll.getNode(atPosition: 2)!.value) // Should print 40 now
 print(ll.getNode(atPosition: 3)!.value) // Should print 30






