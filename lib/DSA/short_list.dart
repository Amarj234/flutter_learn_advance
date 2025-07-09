main() {
  List<int> list1 = [1, 3, 2, 7, 4, 6, 5, 0, 9];

for(int i=0;i<list1.length;i++){
  for(int j=0;j<i;j++){
if(list1[i]<list1[j]){
int tmp=list1[i];
list1[i]=list1[j];
list1[j]=tmp;

}

  }
}
print(list1);


//bobule list 

int i=0;
while(i<list1.length-1){
if(list1[i]>list1[i+1]){ // if uoy use < oprator then get reverse list
int temp =list1[i+1];
list1[i+1]=list1[i];
list1[i]=temp;

if(i>0){
  i--;
}

}else{
  i++;
}
}
print(list1);



}





    //print(plainList);

