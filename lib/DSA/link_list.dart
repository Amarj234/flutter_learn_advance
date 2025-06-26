/// Represents a single node in the linked list.
/// Each node contains a value and a reference to the next node in the sequence.
class Node<T> {
  T value;
  Node<T>? next;

  /// Creates a new Node with the given [value].
  /// Optionally, a [next] node can be provided.
  Node(this.value, [this.next]);

  @override
  String toString() => '$value';
}

/// Represents a singly linked list.
/// It maintains a reference to the head (first node) of the list.
class LinkedList<T> {
  Node<T>? _head; // The first node in the list.

  /// Checks if the linked list is empty.
  bool get isEmpty => _head == null;

  /// Adds a new node with the given [value] to the end of the linked list.
  void add(T value) {
    final newNode = Node(value);
    if (isEmpty) {
      _head = newNode; // If list is empty, new node becomes the head.
      return;
    }

    // Traverse to the last node and append the new node.
    Node<T> current = _head!;
    while (current.next != null) {
      current = current.next!;
    }
    current.next = newNode;
  }

  /// Traverses the linked list and prints the value of each node.
  void printList() {
    if (isEmpty) {
      print("Linked List is empty.");
      return;
    }

    print("Linked List elements:");
    Node<T>? current = _head;
    while (current != null) {
      // Print the value of the current node.
      // If it's the last node, print without " -> ".
      // Otherwise, print with " -> " to show the link.
      print('${current.value}${current.next != null ? ' -> ' : ''}');
      current = current.next; // Move to the next node.
    }
  }

  /// Finds and returns the node at the specified [index].
  /// Returns `null` if the index is out of bounds.
  Node<T>? nodeAt(int index) {
    if (index < 0) return null; // Invalid index.

    Node<T>? current = _head;
    int currentIndex = 0;
    while (current != null && currentIndex < index) {
      current = current.next;
      currentIndex++;
    }
    return current; // Returns null if index is out of bounds.
  }

  /// Inserts a new node with the given [value] at the specified [index].
  /// If [index] is 0, the new node becomes the head.
  /// If [index] is greater than or equal to the list's length, the node is appended.
  void insert(int index, T value) {
    if (index < 0) {
      print("Cannot insert at negative index: $index");
      return;
    }

    final newNode = Node(value);
    if (index == 0 || isEmpty) {
      // If inserting at the beginning or list is empty,
      // new node's next is current head, and new node becomes head.
      newNode.next = _head;
      _head = newNode;
      return;
    }

    // Find the node just before the insertion point.
    Node<T>? previous = nodeAt(index - 1);
    if (previous == null) {
      // This means index is too large, so just add to end.
      add(value);
    } else {
      newNode.next = previous.next;
      previous.next = newNode;
    }
  }

  /// Removes the first occurrence of a node with the specified [value].
  /// Returns `true` if the node was found and removed, `false` otherwise.
  bool remove(T value) {
    if (isEmpty) return false;

    // If the head node contains the value.
    if (_head!.value == value) {
      _head = _head!.next;
      return true;
    }

    Node<T>? current = _head;
    // Traverse until the next node has the target value or end of list is reached.
    while (current!.next != null && current.next!.value != value) {
      current = current.next;
    }

    // If a node to remove was found (i.e., current.next is not null and its value matches).
    if (current.next != null && current.next!.value == value) {
      current.next = current.next!.next; // Skip the node to be removed.
      return true;
    }
    return false; // Value not found.
  }
}

void main() {
  print("--- Demonstrating Linked List ---");

  // Create a new linked list of integers.
  final myList = LinkedList<int>();
  print("Is list empty? ${myList.isEmpty}"); // true

  // Add elements to the list.
  myList.add(10);
  myList.add(20);
  myList.add(30);
  myList.add(40);

  // Print the list to see its contents.
  myList.printList();
  // Expected output:
  // Linked List elements:
  // 10 ->
  // 20 ->
  // 30 ->
  // 40

  print("Is list empty? ${myList.isEmpty}"); // false

  // Insert an element at the beginning.
  print("\nInserting 5 at index 0:");
  myList.insert(0, 5);
  myList.printList();
  // Expected output:
  // Linked List elements:
  // 5 ->
  // 10 ->
  // 20 ->
  // 30 ->
  // 40

  // Insert an element in the middle.
  print("\nInserting 25 at index 3:");
  myList.insert(3, 25);
  myList.printList();
  // Expected output:
  // Linked List elements:
  // 5 ->
  // 10 ->
  // 20 ->
  // 25 ->
  // 30 ->
  // 40

  // Insert an element at an index greater than list length (should append).
  print("\nInserting 50 at index 10 (should append):");
  myList.insert(10, 50);
  myList.printList();
  // Expected output:
  // Linked List elements:
  // 5 ->
  // 10 ->
  // 20 ->
  // 25 ->
  // 30 ->
  // 40 ->
  // 50

  // Remove an element from the middle.
  print("\nRemoving 25:");
  bool removed = myList.remove(25);
  print("Was 25 removed? $removed"); // true
  myList.printList();
  // Expected output:
  // Linked List elements:
  // 5 ->
  // 10 ->
  // 20 ->
  // 30 ->
  // 40 ->
  // 50

  // Try to remove a non-existent element.
  print("\nAttempting to remove 99:");
  removed = myList.remove(99);
  print("Was 99 removed? $removed"); // false
  myList.printList(); // List remains unchanged

  // Remove the head element.
  print("\nRemoving 5 (head):");
  myList.remove(5);
  myList.printList();
  // Expected output:
  // Linked List elements:
  // 10 ->
  // 20 ->
  // 30 ->
  // 40 ->
  // 50

  // Remove all remaining elements to make the list empty.
  print("\nRemoving all remaining elements:");
  myList.remove(10);
  myList.remove(20);
  myList.remove(30);
  myList.remove(40);
  myList.remove(50);
  myList.printList();
  // Expected output:
  // Linked List is empty.
}
