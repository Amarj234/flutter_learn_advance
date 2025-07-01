class Node {
  int data;
  Node? next;

  Node(this.data);
}

class CircularLinkedList {
  Node? head;

  void insertAtEnd(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
      newNode.next = head;
    } else {
      Node temp = head!;
      while (temp.next != head) {
        temp = temp.next!;
      }
      temp.next = newNode;
      newNode.next = head;
    }
  }

  void insertAtBeginning(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
      newNode.next = head;
    } else {
      Node temp = head!;
      while (temp.next != head) {
        temp = temp.next!;
      }
      temp.next = newNode;
      newNode.next = head;
      head = newNode; // Update head
    }
  }

  void display() {
    if (head == null) {
      print("List is empty.");
      return;
    }

    Node temp = head!;
    do {
      print(temp.data);
      temp = temp.next!;
    } while (temp != head);
  }
}

void main() {
  CircularLinkedList cll = CircularLinkedList();

  cll.insertAtEnd(20);
  cll.insertAtEnd(30);
  cll.insertAtBeginning(10);
  cll.insertAtEnd(40);

  print("Circular Linked List:");
  cll.display();
}