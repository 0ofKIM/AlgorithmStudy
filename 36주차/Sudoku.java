import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class sudoku_2580 {

    static int N;
    static int[][] board;

    public static void main(String[] args) throws IOException {
        N = 9;
        board = new int[N][N];

        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        for (int i = 0; i < N; i++) {
            String[] line = reader.readLine().split(" ");
            for (int j = 0; j < N; j++) {
                board[i][j] = Integer.parseInt(line[j]);
            }
        }

        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++) {
                // 빈칸인 경우 탐색 시작
                if (board[i][j] == 0) {
                    find(i, j);
                }
            }
        }
    }

    private static int find(int i, int j) {
        // 현재 칸은 계산 무시
        board[i][j] = -1;
        // 행에서 답을 찾을 수 있는지 확인
        int rowSum = 0;
        for (int k = 0; k < N; k++) {
            // 답을 찾으려는 칸과 같은 행은 skip
            if (k == j) {
                continue;
            }
            // 같은 행에 빈칸이 있으면 거기부터 다시 탐색
            if (board[i][k] == 0) {
                rowSum += find(i, k);
                // 같은 행에 아직 답을 찾지 못한 칸이 있으면 답을 구할 수 없다
            } else if (board[i][k] == -1) {
                rowSum = -1;
                break;
            } else {
                rowSum += board[i][k];
            }
        }
        // 행에서 답을 구할 수 있으면 칸을 채우고 반환
        if (rowSum != -1) {
            board[i][j] = 45 - rowSum;
            return 45 - rowSum;
        }

        // 위 내용을 열에 대해서 반복
        int colSum = 0;
        for (int k = 0; k < N; k++) {
            if (k == i) {
                continue;
            }
            if (board[k][j] == 0) {
                colSum += find(k, j);
            } else if (board[k][j] == -1) {
                colSum = -1;
                break;
            } else {
                colSum += board[k][j];
            }
        }
        if (colSum != -1) {
            board[i][j] = 45 - colSum;
            return 45 - colSum;
        }

        // 위 내용을 3*3 칸에 대해서 반복
        int blockSum = 0;
        int startRow = (i / 3) * 3;
        int startCol = (j / 3) * 3;
        for (int k = startRow; k < startRow + 3; k++) {
            for (int l = startCol; l < startCol + 3; l++) {
                if (k == i && l == j) {
                    continue;
                }
                if (board[k][l] == 0) {
                    blockSum += find(k, l);
                } else if (board[k][l] == -1) {
                    blockSum = -1;
                    break;
                } else {
                    blockSum += board[k][l];
                }
            }
        }
        if (blockSum != -1) {
            board[i][j] = 45 - blockSum;
            return 45 - blockSum;
        }

        return -1;
    }
}
