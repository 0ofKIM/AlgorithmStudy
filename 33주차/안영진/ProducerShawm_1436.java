import java.util.Scanner;

public class ProducerShawm_1436 {

    public static void main(String[] args) {
        int N; // input 처리 생략

        int matchCount = 0;
        final String MATCH_KEY = "666";

        int number = 665;
        while (matchCount < N) {
            number++;
            if (String.valueOf(number).contains(MATCH_KEY)) {
                matchCount++;
            }
        }

        System.out.println(number);
    }
}
