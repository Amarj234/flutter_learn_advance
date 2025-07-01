class Node {
  int data;
  Node? next;

  Node(this.data);
}

class LinkedList {
  Node? head;
  int _length = 0;

  int get length => _length;

  void add(int value) {
    Node newNode = Node(value);
    if (head == null) {
      head = newNode;
    } else {
      Node current = head!;
      while (current.next != null) {
        current = current.next!;
      }
      current.next = newNode;
    }
    _length++;
  }

  void printList() {
    Node? current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }

  int? getValueAtIndex(int index) {
    if (index < 0 || index >= _length) return null; // Optional guard
    Node? current = head;

    int count = 0;

    while (current != null) {
      if (count == index) {
        return current.data;
      }
      count++;
      current = current.next;
    }
    return null;
  }
}

void main() {
  LinkedList list = LinkedList();
  LinkedList list2 = LinkedList();

  list.add(10);
  list.add(20);
  list.add(30);
  list2.add(9);

  print("Linked List 1:");
  list.printList();

  print("Linked List 2:");
  list2.printList();

  print("Length of list 1: ${list.length}");
  print("Length of list 2: ${list2.length}");
  print("Value at index 2 in list 1: ${list.getValueAtIndex(2)}");
}
