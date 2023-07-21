package whou.secproject.repository;

import org.apache.commons.math3.distribution.NormalDistribution;

public class RecommendDAO {
	
    public static double calculatePercentileValue(double percentile, double mean, double stdDev) {
        NormalDistribution normalDistribution = new NormalDistribution(mean, stdDev);
        double zScore = normalDistribution.inverseCumulativeProbability(percentile / 100);
        double value = zScore * stdDev + mean;
        return value;
    }
    public double[] valueScore(double [] avgArr, double [] myArr, int importance) {
        double[] answer = new double[4];
        double sum=0;
        double avgSum=0, mySum=0;
        for(int i = 0 ; i <4; i++) {
        	avgSum+=avgArr[i];
        	for(int j=0; j <3; j++) mySum+=myArr[j+3*i];
        }
        double multi = avgSum/mySum;
        for(int i = 0 ; i <4; i++,sum=0) {
        	for(int j=0; j <3; j++) sum+=myArr[j+3*i];
        	answer[i]=Math.pow(Math.sqrt(multi*sum/avgArr[i]),importance);
        }
        return answer;
    }
}
