/**
Implement the function findRoots to find the roots of the quadratic equation: ax2 + bx + c = 0. If the equation has only one solution, the function should return that solution as both elements of the Roots. The equation will always have at least one solution.

The roots of the quadratic equation can be found with the following formula: A quadratic equation.

For example, the roots of the equation 2x2 + 10x + 8 = 0 are -1 and -4.
**/  

import static java.lang.Math.sqrt;

public class QuadraticEquation {
    public static Roots findRoots(double a, double b, double c) {
        double d = b * b - (4 * a * c);
		double sqrt_val = sqrt(d);

		if (d > 0) {
            System.out.println("deleta est positif donc 2 racines possibles : ");
			double x = (-b + sqrt_val) / (2 * a);
			double y = (-b + -sqrt_val) / (2 * a);
			return new Roots(x, y);
		}

		if (d == 0) {
            System.out.println("Delta nul donc 1 racine possible : ");
			double x = -b / (2 * a);
			return new Roots(x, x);
		}

        System.out.println("Delta négatif donc aucune racine");
		return new Roots(0, 0);
    }
    
    public static void main(String[] args) {
        Roots roots = QuadraticEquation.findRoots(2, 10, 8);
        System.out.println("Roots: " + roots.x1 + ", " + roots.x2);
    }
}

class Roots {
    public final double x1, x2;

    public Roots(double x1, double x2) {         
        this.x1 = x1;
        this.x2 = x2;
    }
}
