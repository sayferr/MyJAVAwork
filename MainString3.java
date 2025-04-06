public class Main {

    ///////////ТУТ ЗАДАНИЕ ИЗ ВИДЕОУРОКА С ЦИКЛОМ ФОР, НИЖЕ БУДЕТ ЦИКЛ ВАЙЛ//////////////

//    public static boolean contains(char[] arr, char[] search, int start) {
//        for (int i = 0; i < search.length; i++) {
//            if (arr[i + start] != search[i]){
//                return false;
//            }
//        }
//        return true;
//    }


//    public static int countVhod(char[] arr, char[] search){
//        int count = 0;
//        for (int i = 0; i < arr.length - search.length; i++) {
//            if (contains(arr, search, i)) {
//                i+= search.length;
//                count++;
//            }
//        }
//        return count;
//    }


//    public static int indexOf(char[] arr, char[] search, int start){
//        for (int i = start; i <= arr.length - search.length; i++) {
//            if (contains(arr, search, i)){
//                return i;
//            }
//        }
//        return -1;
//    }


//    public static void main(String[] args){
//        char[] str = "I will Roma create an ideal Roma world around me. Roma".toCharArray();
//        char[] search = "Roma".toCharArray();
//        char[] old = ".".toCharArray();
//        System.out.print("My >> ");
//        char[] result = replaceAll(str, search, old);
//        for (int i = 0; i < result.length; i++) {
//            System.out.print(result[i]);
//        }
//        System.out.println();
//
//        String origStr = "Roma tut, Roma kak dela? Roma poka";
//        origStr = origStr.replaceAll("Roma", ".");
//        System.out.println("Original >>" + origStr);
        //System.out.println(contains(str, search, 2));
        //System.out.println(countVhod(str, search));
        //System.out.println(IndexOf(str, search, 0 + search.length));


//        int startindex = 0;
//        while (true){
//            int index = indexOf(str, search, startindex);
//            if (index == -1){
//                System.out.println("the end");
//                break;
//            }else{
//                System.out.print("Word number == " + index + " >> ");
//
//                for (int i = index; i < index + search.length ; i++) {
//                    System.out.print(str[i]);
//                }
//                System.out.println();
//                startindex = index + search.length;
//            }
//        }



//    public static char[] replaceAll(char[] origStr, char[] oldStr, char[] newStr) {
//        int countEnter = countVhod(origStr, oldStr);
//
//        if (countEnter == 0){
//            return origStr;
//        }
//
//        int newSize = origStr.length - (oldStr.length * countEnter) + (newStr.length * countEnter);
//        char[] result = new char[newSize];
//
//        int startindex = 0;
//        int findindex = 0;
//        int resultindex = 0;
//
//        while((findindex = indexOf(origStr, oldStr, startindex)) != -1) {
//           // System.out.print("Word number == " + findindex + " >> ");
//            // findindex+=findindex;
//           result = arrayCopy(origStr, startindex, result, resultindex, findindex - startindex);
//           resultindex += findindex - startindex;
//
//            result = arrayCopy(newStr, 0, result, resultindex, newStr.length);
//            resultindex +=newStr.length;
//
//            startindex = findindex + oldStr.length;
//        }
//        result = arrayCopy(origStr, startindex, result, resultindex, origStr.length - startindex);
//
//        return result;
//    }
//
//    public static char[] arrayCopy(char[] str, int strIndex, char[] dest, int destIndex, int leng){
//        for (int i = 0; i < leng; i++) {
//            dest[destIndex + i] = str[strIndex + i];
//        }
//        return dest;
//    }




    /////////ТУТ БУДЕТ ДОМАШНЕЕ ЗАДАНИЕ С ЦИКЛОМ ВАЙЛ////////
    public static boolean contains(char[] arr, char[] search, int start) {
       int i = 0;
        while (i < search.length) {
            if (arr[i + start] != search[i]) {
                return false;
            }
            i++;
        }
        return true;
    }

    public static int countVhod(char[] arr, char[] search){
        int count = 0;
        int i = 0;
        while (i < arr.length - search.length){
            if (contains(arr, search, i)) {
                i+= search.length;
                count++;
            }else{
                i++;
            }
        }
        return count;
    }

    public static int indexOf(char[] arr, char[] search, int start){
        int i = start;
        while (i <= arr.length - search.length){
            if (contains(arr, search, i)){
                return i;
            }
            i++;
        }
        return -1;
    }


    public static char[] replaceAll(char[] origStr, char[] oldStr, char[] newStr) {
        int countEnter = countVhod(origStr, oldStr);

        if (countEnter == 0){
            return origStr;
        }

        int newSize = origStr.length - (oldStr.length * countEnter) + (newStr.length * countEnter);
        char[] result = new char[newSize];

        int startindex = 0;
        int findindex = 0;
        int resultindex = 0;

        while((findindex = indexOf(origStr, oldStr, startindex)) != -1) {
            result = arrayCopy(origStr, startindex, result, resultindex, findindex - startindex);
            resultindex += findindex - startindex;

            result = arrayCopy(newStr, 0, result, resultindex, newStr.length);
            resultindex +=newStr.length;

            startindex = findindex + oldStr.length;
        }
        result = arrayCopy(origStr, startindex, result, resultindex, origStr.length - startindex);

        return result;
    }

    public static char[] arrayCopy(char[] str, int strIndex, char[] dest, int destIndex, int leng){
        int i = 0;
        while (i < leng){
            dest[destIndex + i] = str[strIndex + i];
            i++;
        }
        return dest;
    }


public static void main(String[] args) {
    char[] str = "I will Roma create an ideal Roma world around me. Roma".toCharArray();
    char[] search = "Roma".toCharArray();
    char[] old = "++++".toCharArray();
    System.out.print("My >> ");
    char[] result = replaceAll(str, search, old);
    int i = 0;
    while (i < result.length) {
        System.out.print(result[i]);
        i++;
    }
    System.out.println();

    String origStr = "Roma tut, Roma kak dela? Roma poka";
    origStr = origStr.replaceAll("Roma", "==");
    System.out.println("Original >>" + origStr);
    }
}



