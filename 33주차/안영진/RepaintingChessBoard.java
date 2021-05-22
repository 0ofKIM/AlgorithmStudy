
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class RepaintingChessBoard_1018 {

    public static void main(String[] args) {
        int rowCount, colCount, int[][] chessBoard; // input 처리 생략

        int minFaultCount = Integer.MAX_VALUE;  // 다시 그려야 하는 칸 수
        int[] color = new int[]{66, 87};        // 66: B, 87: W

        // 주어진 영역 내 가능한 모든 체스판 영역 trace
        for (int startRow = 0; startRow <= rowCount - 8; startRow++) {
            for (int startCol = 0; startCol <= colCount - 8; startCol++) {
                int colorIdx = 0;               // 확인할 색깔이 B인지 W인지 정하는 index
                int[] faultCount = new int[2];  // 첫블록이 B인 경우와 W인 경우를 동시에 저장하기 위해 배열 사용

                // 정해진 체스판 영역 내부 trace
                for (int row = startRow; row < startRow + 8; row++) {
                    colorIdx = colorIdx == 0 ? 1 : 0;       // 행의 첫 column은 이전 행의 마지막 column과 같아 한번더 switch
                    for (int col = startCol; col < startCol + 8; col++) {
                        if (chessBoard[row][col] != color[colorIdx]) {
                            faultCount[0]++;
                        } else {
                            faultCount[1]++;
                        }
                        colorIdx = colorIdx == 0 ? 1 : 0;   // 한칸 체크 후 색깔 switch
                    }
                }
                // 첫 블록이 B인 경우와 W인 경우 중 작은 값 선택
                int currentMin = Math.min(faultCount[0], faultCount[1]);
                if (currentMin < minFaultCount) {
                    minFaultCount = currentMin;
                }
            }
        }

        System.out.println(minFaultCount);
    }
}
