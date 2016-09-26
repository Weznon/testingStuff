/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testinggit;
import java.util.Scanner;
/**
 *
 * @author Plotnw
 */
public class TestingGit {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner reader = new Scanner(System.in);
        System.out.println("Problem 1");
        int sumTo = Integer.parseInt(reader.nextLine());
        System.out.println((sumTo * (sumTo + 1)) / 2);
    }
    
}
