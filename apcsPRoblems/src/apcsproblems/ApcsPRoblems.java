/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apcsproblems;
import java.util.Scanner;
/**
 *
 * @author Plotnw
 */
public class ApcsPRoblems {

    /**
     * @param x
     * @param args the command line arguments
     */
    
            
    public static void main(String[] args) {
        Scanner reader = new Scanner(System.in);
        int problem = Integer.parseInt(reader.nextLine());
        if (problem == 1) {
            int n = Integer.parseInt(reader.nextLine());
             int sum = problem1 (n);
             System.out.println(sum);
        } else if (problem == 2) {
            System.out.println("Put a character: ");
            char x = (reader.nextLine().charAt(0));
            System.out.println("Put a string: ");
            String y = reader.nextLine();
            problem2(x, y);
        } else if (problem == 3) {
            problem3;
        } else if (problem == 4) {
            problem4;
        } else if (problem == 5) {
            problem5;
        } else if (problem == 6) {
            problem6;
        } else {
            problem7;
        }
    }
    public static int problem1 (int x) {
        return x * (x + 1) / 2;
    }
  
    public static int problem2 (char x, String y) {
        int sum = 0;
        for (int z =0;z < y.length();z++) {
            if (y.charAt(z) == x) {
                sum++;
            }
    }
    }
    
}
