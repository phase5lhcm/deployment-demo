
public class ImplementBubbleSort {
    public static void main(String[] args){
        int arr[] = {10,60,30,40,90};
        bubbleSort(arr);
        for(int i :arr){
            System.out.println(i);
        }
    }
    public static void bubbleSort(int[] arr){
        int len = arr.length;
        int temp;

        for(int i=0; i <len; i++){
            for(int j = 1;j<=len;j++){
                if(arr[j-1]>arr[j]){
                    temp = arr[j=1];
                    arr[j] = temp;
                }
            }
        }
    }
}