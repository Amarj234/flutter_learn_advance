main() {
  List<int> list1 = [1, 2, 3, 4, 5, 2, 0];
  List<int> list2 = [3, 1, 7, 6, 2, 3, 9];

  List<int> mainList = [];
    List<int> plainList = [];
  Map myMap = {};

  for (int i = 0; i < list1.length; i++) {
//  myMap[list1[i]]=(myMap[list1[i]]??0)+1; 
//myMap[list2[i]]=(myMap[list2[i]]??0)+1; 

    if (myMap.containsKey(list1[i])) {
      myMap[list1[i]] += 1;
    } else {
      myMap[list1[i]] = 1;
    }
    if (myMap.containsKey(list2[i])) {
      myMap[list2[i]] += 1;
    } else {
      myMap[list2[i]] = 1;
    }
  }
  myMap.entries.forEach((e) {
    if (e.value > 1) {
      mainList.add(e.key);
    }
    plainList.add(e.key);
  });
  print(myMap);
  print(mainList);
    print(plainList);


}
