public class NandM3_15651 {

    static int N = 0;
    static int M = 0;

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        N = scanner.nextInt();
        M = scanner.nextInt();

        // 순열을 저장할 배열, 재귀 전체가 공유한다.
        int[] sequence = new int[M];
        // 출력을 재귀 속에서 하지 않고 마지막에 출력하기 위한 버퍼
        // 출력을 재귀 속에서 할 경우 타임아웃이 난다..
        StringBuilder builder = new StringBuilder();
        for (int i = 1; i <= N; i++) {
            dfs(i, M, sequence, builder);
        }
        System.out.println(builder.toString());
    }

    private static void dfs(int num, int depth, int[] sequence, StringBuilder builder) {
        // 순열 현재 위치에 현재 값을 업데이트
        sequence[M - depth] = num;
        depth--;

        if (depth == 0) {
            // 현재 순열 정보를 출력 버퍼에 저장
            for (int seq : sequence) {
                builder.append(seq);
                builder.append(' ');
            }
            builder.append('\n');
        } else {
            for (int i = 1; i <= N; i++) {
                dfs(i, depth, sequence, builder);
            }
        }
    }
}
