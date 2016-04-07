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
     * @param args the command line arguments
     */
    public static 
    public static void main(String[] args) {
        Scanner reader = new Scanner(System.in);
        int problem = Integer.parseInt(reader.nextLine());
        if (problem == 1) {
            problem1;
        } else if (problem == 2) {
            problem2;
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
    
}
