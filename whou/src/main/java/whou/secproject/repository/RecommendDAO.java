package whou.secproject.repository;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.StringTokenizer;

public class RecommendDAO {

	public <T extends Number> List<Double> valueScore(List<Double> defaultValue, List<Integer> valueScore, int importance) {
		List<Double> answer = new ArrayList<>();
		double avgSum = 0, mySum = 0, sum = 0;

		for (int i = 0; i < 4; i++) {
			avgSum += defaultValue.get(i).doubleValue();
			for (int j = 0; j < 3; j++) mySum += valueScore.get(j + 3 * i).doubleValue();
		}

		double multi = avgSum / mySum;

		for (int i = 0; i < 4; i++) {
			for (int j = 0; j < 3; j++) sum += valueScore.get(j + 3 * i).doubleValue();
			answer.add(Math.pow(Math.sqrt(multi * sum / defaultValue.get(i).doubleValue()), importance));
			sum = 0;
		}
		return answer;
	}

	public LinkedHashMap<ArrayList<Double>,Double> DoubleTokener(List<String> input, List<String> limit) {
		LinkedHashMap<ArrayList<Double>,Double> result = new LinkedHashMap<ArrayList<Double>,Double>();
		for(int i = 0 ; i < input.size(); i++) {
			if(input.get(i)!=null) {
				ArrayList<Double> list= new ArrayList<Double>();
				StringTokenizer st = new StringTokenizer(input.get(i), limit.get(i));
				double avg = 0;
				while (st.hasMoreTokens()) {
					double d = Double.parseDouble(st.nextToken());
					list.add(d);
					avg+=d;
				}
				avg=avg/list.size();
				result.put(list, avg);
			}else {
				result.put(new ArrayList<Double>(Arrays.asList(i+1.0,i+1.0,i+1.0)),i+1.0);
			}
		}
		return result;
	}

	public List<Integer> valueTokenizer(String input, String limit) {
		List<Integer> answer = new ArrayList<Integer>();
		StringTokenizer st = new StringTokenizer(input, limit);
		while(st.hasMoreTokens()) answer.add(Integer.parseInt(st.nextToken()));
		return answer;
	}
	public List<Double> doubleTokenizer(String input, String limit) {
		List<Double> answer = new ArrayList<Double>();
		StringTokenizer st = new StringTokenizer(input, limit);
		while(st.hasMoreTokens()) answer.add(Double.parseDouble(st.nextToken()));
		return answer;
	}
	public List<String> Tokenizer(String input, String limit) {
		List<String> answer = new ArrayList<String>();
		StringTokenizer st = new StringTokenizer(input, limit);
		while(st.hasMoreTokens()) answer.add(st.nextToken());
		return answer;
	}
	public ArrayList<Double> normalizePer(ArrayList<Double> score, double total, int important){
		ArrayList<Double> result = new ArrayList<Double>();
		for(Double s : score) result.add(Math.pow(Math.sqrt(s/total), important));
        result.sort(Collections.reverseOrder());
		return result;
	}
	
	
	
}
