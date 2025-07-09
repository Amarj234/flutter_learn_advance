main() {
  List<int> list = [1, 3, 2, 7, 4, 6, 5, 0, 9];
int i=0;
while(i<list.length-1){
if(list[i]>list[i+1]){ // if uoy use < oprator then get reverse list
int temp =list[i+1];
list[i+1]=list[i];
list[i]=temp;

if(i>0){
  i--;
}

}else{
  i++;
}
}
print(list);

    //print(plainList);
}
