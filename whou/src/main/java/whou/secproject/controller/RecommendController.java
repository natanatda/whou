package whou.secproject.controller;

import java.util.ArrayList;   
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import whou.secproject.component.CertiDTO;
import whou.secproject.component.RecommandInfoDTO;
import whou.secproject.component.SelectDTO;
import whou.secproject.repository.RecommendDAO;
import whou.secproject.service.RecommendService;

@Controller
@RequestMapping("reco")
public class RecommendController {

	int user = 66;
	
	@Autowired
	private RecommendDAO dao;

	@Autowired
	private RecommendService service;
	

	@RequestMapping("/main")
	public String main() {
		
		RecommandInfoDTO redto = service.getTestResult(user);
		
		List<String> valueCd = service.getValueCd("values_common"); // 가치 평균
		
		List<Integer> jList = service.allJobCd("job_info"); // 직업 일련번호
		
		List<String> scoreStrs = Arrays.asList(
				redto.getAptitude_score(),redto.getInterest_score()); 
		
		List<ArrayList<String>> jobNumList = Arrays.asList(
				redto.getAptitude_jobs(),redto.getInterest_jobs());
		
		List<String> limitStrs = Arrays.asList("\\+","\\+");
		List<Integer> importances = Arrays.asList(1,2,3);
		
		LinkedHashMap<ArrayList<Double>,Double> scores = dao.DoubleTokener(scoreStrs, limitStrs);
	    List<Double> jobScore = new ArrayList<>(Collections.nCopies(jList.size(), 1.0));
	    
		int i = 0;
		for (Map.Entry<ArrayList<Double>, Double> entry : scores.entrySet()) {
			List<String> jobNum = jobNumList.get(i);
            List<Double> normalize= dao.normalizePer(entry.getKey(), entry.getValue(), importances.get(i++)).subList(0, 3);
            for(int j = 0 ; j < normalize.size(); j++) {
            	double d = normalize.get(j); // 1.38~~
            	StringTokenizer st = new StringTokenizer(jobNum.get(j),",");
            	while(st.hasMoreTokens()) {
            		int f = Integer.parseInt(st.nextToken());
            		jobScore.set(jList.indexOf(f), jobScore.get(jList.indexOf(f))*d);
            	}
            }
            System.out.println(jobScore);
        }
		
		List<Integer> valueList = dao.valueTokenizer(redto.getValues_score(), ",");
		List<Double> defaultValue = Arrays.asList(50.82,52.89,45.83,48.52);
		List<Double> valueScore = dao.valueScore(defaultValue, valueList, importances.get(2));
		
		for(int k = 0 ; k < valueScore.size(); k++) {
			String str = valueCd.get(k);
			StringTokenizer st = new StringTokenizer(str,",");
        	while(st.hasMoreTokens()) {
        		int f = Integer.parseInt(st.nextToken());
        		jobScore.set(jList.indexOf(f), jobScore.get(jList.indexOf(f))*valueScore.get(k));
        	}
		}
		System.out.println(jobScore);
		
		CertiDTO certiDTO = new CertiDTO();
		certiDTO.setNum(user);
		ArrayList<String> certis = service.certiInfo(certiDTO);
		ArrayList<Integer> certisCD = new ArrayList<Integer>();
		for(String certi : certis) {
			SelectDTO selDTO = new SelectDTO();
			List<Integer> li = service.certiToCD(selDTO, certi);
			for(Integer l : li) certisCD.add(l);
		}
		System.out.println(certisCD);
		for(Integer c: certisCD) {
    		jobScore.set(jList.indexOf(c), jobScore.get(jList.indexOf(c))*1.1);
		}
		Map<Integer, Double> jcdToScore = new HashMap<>();
		for (int idx = 0; idx < jList.size(); idx++) 
			jcdToScore.put(jList.get(idx), jobScore.get(idx));
		
		List<Map.Entry<Integer, Double>> list = new ArrayList<>(jcdToScore.entrySet());
        Collections.sort(list, new Comparator<Map.Entry<Integer, Double>>() {
            public int compare(Map.Entry<Integer, Double> o1, Map.Entry<Integer, Double> o2) {
                return o2.getValue().compareTo(o1.getValue());
            }
        });
        
        // 결과 출력
        for (Map.Entry<Integer, Double> entry : list) {
            System.out.println(entry.getKey() + ": " + entry.getValue());
        }
        
        return "/main"; 
	}
}

