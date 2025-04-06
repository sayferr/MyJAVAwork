

import java.util.Scanner;
import java.util.Random; //используется для генерации случайных чисел, для ходов компьютера

    public class TicTacToe {
        private static final char empty = ' ';
        private static final char player = 'X';
        private static final char computer = '0';
        private static final int field = 3;
        private static char[][] board = new char[field][field];
        private static Scanner scanner = new Scanner(System.in);
        private static Random random = new Random();

        /**
         * Пересматривал видеоуроки по массивам и дополнительно их учил, потому что у меня сложности с ними
         * Также дополнительно учил в sololearn классы, массивы и условия
         */
        public static void main(String[] args) {
            initializeBoard();
            int mode = scanner.nextInt();
            System.out.println("Выберите режим : 1 - Человек против человека, 2 - Человек против компьютера, 3 - Человек против компьютера(Hard mode)");
            if (mode == 1) {
                PlayTwoPlayers();//игрок против игрока
            } else if (mode == 2) {
                PlayerVsComputer(false);//простой режим
            } else if (mode == 3) {
                PlayerVsComputer(true);//сложный режим
            } else {
                System.out.println("Некорректный выбор режима игры. Пожалуйста, выберите режим: 1, 2 или 3");
            }
        }

        private static void initializeBoard() {
            for (int i = 0; i < field; i++) { //наше игровое поле, высота и ширина
                for (int j = 0; j < field; j++) {
                    board[i][j] = empty;
                }
            }
        }

        private static void printBoard() {
            System.out.println("  0 1 2");  //вид нашего поля, согласно его высоте и ширине
            for (int i = 0; i < field; i++) {
                System.out.print(i + " ");
                for (int j = 0; j < field; j++) {
                    System.out.print(board[i][j]);
                    if (j < field - 1) System.out.print("|");
                }
                System.out.println();
                if (i < field - 1) System.out.println("  -------");
            }
        }

        private static boolean isFull() {
            for (int i = 0; i < field; i++) {
                for (int j = 0; j < field; j++) {
                    if (board[i][j] == empty) {
                        return false;
                    }
                }
            }
            return true;
        }


        private static boolean CheckWin(char player) {
            for (int i = 0; i < field; i++) {
                if (board[i][0] == player && board[i][1] == player && board[i][2] == player) return true;
                if (board[0][i] == player && board[1][i] == player && board[2][i] == player) return true;
            }
            if (board[0][0] == player && board[1][1] == player && board[2][2] == player) return true;
            if (board[0][2] == player && board[1][1] == player && board[2][0] == player) return true;
            return false;
        }

        private static void PlayTwoPlayers() {
            boolean Xplayer = true;
            while (true) {
                printBoard();
                System.out.print("Игрок " + (Xplayer ? "X" : "0") + ", введите координаты");
                int row = scanner.nextInt();//строка
                int col = scanner.nextInt();//стобец
                if (row < 0 || col < 0 || row >= field || col >= field || board[row][col] != empty) {
                    System.out.println("Некорректный ввод, пожалуйста выберите другое значение");//Если игрок выберет цифру больше 3 и меньше 0
                    continue;
                }
                board[row][col] = Xplayer ? player : computer;
                if (CheckWin(Xplayer ? player : computer)) {
                    printBoard();
                    System.out.println((Xplayer ? "X" : "0") + "Ура, победа!");
                    break;
                }
                if (isFull()) {
                    printBoard();
                    System.out.println("Ничья !");
                    break;
                }
                Xplayer = !Xplayer;
            }
        }

        private static void PlayerVsComputer(boolean hardMode) {
            boolean Xplayer = true;
            while (true) {
                printBoard();
                if (Xplayer) {
                    System.out.println("Ваш ход!");
                    int row = scanner.nextInt();//строка
                    int col = scanner.nextInt();//стобец
                    if (row < 0 || col < 0 || row >= field || col >= field || board[row][col] != empty) {
                        System.out.println("Некорректный ввод, пожалуйста выберите другое значение");
                        continue;
                    }
                    board[row][col] = player;
                } else {
                    System.out.println("Ход компьютера");
                    if (hardMode) {
                        SmartMove();
                    } else {
                        RandomMove();
                    }
                }
                if (CheckWin(Xplayer ? player : computer)) {
                    printBoard();
                    System.out.println((Xplayer ? "Игрок" : "Компьютер") + "Ура, победа!");
                    break;
                }
                if (isFull()) {
                    printBoard();
                    System.out.println("Ничья !");
                    break;
                }
                Xplayer = !Xplayer;

            }
        }

        private static void RandomMove(){
            int row;
            int col;
            do {
                 row = random.nextInt(field);
                 col = random.nextInt(field);
            } while (board[row][col] != empty);
            board[row][col] = computer;
        }

        private static void SmartMove(){
            for (int i = 0; i < field; i++) {
                for (int j = 0; j < field; j++) {
                    if (board[i][j] == empty){
                        board[i][j] = computer;
                        if(CheckWin(computer)) return;
                        board[i][j] = empty;
                    }
                }
            }

            for (int i = 0; i < field; i++) {
                for (int j = 0; j < field; j++) {
                    if (board[i][j] == empty){
                        board[i][j] = player;
                        if(CheckWin(player)){
                            board[i][j] = computer;
                            return;
                        }
                        board[i][j] = empty;
                    }
                }
            }
            RandomMove();
        }
    }
