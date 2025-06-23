class Node {
  int data;
  Node? prev;
  Node? next;

  Node(this.data);
}

class DoublyLinkedList {
  Node? head;

  void insertAtEnd(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
      return;
    }
    Node temp = head!;
    while (temp.next != null) {
      temp = temp.next!;
    }
    temp.next = newNode;
    newNode.prev = temp;
  }

  void displayForward() {
    Node? temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  void displayBackward() {
    Node? temp = head;
    if (temp == null) return;

    // Move to tail
    while (temp!.next != null) {
      temp = temp.next;
    }

    // Traverse backward
    while (temp != null) {
      print(temp.data);
      temp = temp.prev;
    }
  }
}

void main() {
  var dll = DoublyLinkedList();
  dll.insertAtEnd(10);
  dll.insertAtEnd(20);
  dll.insertAtEnd(30);

  print("Forward:");
  dll.displayForward();

  print("Backward:");
  dll.displayBackward();
}