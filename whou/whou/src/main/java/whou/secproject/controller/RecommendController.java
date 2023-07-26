package whou.secproject.controller;

import java.math.BigDecimal;
import java.util.ArrayList;    
import java.util.Arrays;
import java.util.Collections;
//import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		public @ResponseBody LinkedHashMap<String,BigDecimal> main() {
			
			RecommandInfoDTO redto = service.getTestResult(user);
			
			List<String> valueCd = service.getValueCd("values_common"); // 가치 평균
			List<Integer> jList = service.allJobCd("job_info"); // 직업 일련번호
			int jC = jList.size(); // 직업 수
			
			List<String> scoreStrs = Arrays.asList( // 점수 리스트
					redto.getAptitude_score(),redto.getInterest_score()); 
			
			List<ArrayList<String>> jobNumList = Arrays.asList( // 해당 직업 리스트
					redto.getAptitude_jobs(),redto.getInterest_jobs());
			
			List<String> limitStrs = Arrays.asList("\\+","\\+"); // 구분자
			List<Integer> importances = Arrays.asList(1,2,3); // 중요도
			
			LinkedHashMap<ArrayList<Double>,Double> scores = dao.DoubleTokener(scoreStrs, limitStrs); 
		    List<Double> jobScore = new ArrayList<>(Collections.nCopies(jC, 1.0)); // 직업당 점수
		    
		    CertiDTO certiDTO = new CertiDTO();
			certiDTO.setNum(user);
			certiDTO.setCol("SCHOOL_MAJOR");
			ArrayList<String> majors = service.majorInfo(certiDTO);
			certiDTO.setCol("CERTIFICATE");
			ArrayList<String> certis= service.majorInfo(certiDTO);
			
			
			int majorC = 0;
			if(majors!=null) majorC = majors.size();
			int certiC = 0;
			if(certis!=null) certiC = certis.size();
			
			System.out.println(10+majorC+certiC);
		    double [][] jobScorePoint = new double [jC][10+majorC+certiC];
			//service.createJobPoint(user, majorC, certiC);
	
			int i = 0;
			for (Map.Entry<ArrayList<Double>, Double> entry : scores.entrySet()) {
				List<String> jobNum = jobNumList.get(i); // 해당하는 직업의 jcd
	            List<Double> normalize= dao.normalizePer(entry.getKey(), entry.getValue(), importances.get(i++)).subList(0, 3); // 3개만 적용
	            for(int j = 0 ; j < normalize.size(); j++) {
	            	double d = normalize.get(j); // 1.38~~
	            	StringTokenizer st = new StringTokenizer(jobNum.get(j),",");
	            	while(st.hasMoreTokens()) {
	            		int f = jList.indexOf(Integer.parseInt(st.nextToken()));
	            		jobScore.set(f, jobScore.get(f)*d);
	            		jobScorePoint[f][3*(i-1)+j] = normalize.get(j);
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
	        		int f = jList.indexOf(Integer.parseInt(st.nextToken()));
	        		jobScore.set(f, jobScore.get(f)*valueScore.get(k));
	        		jobScorePoint[f][6+k] = valueScore.get(k);
	        	}
			}
			System.out.println(jobScore);
			
			if(majors!=null) {
				SelectDTO selDTO = new SelectDTO();
				int h = 10;
				for(String major: majors) {
					List<Integer> li = service.majorToCD(selDTO, major);
					for(Integer l : li) {
						l = jList.indexOf(l);
						jobScore.set(l, jobScore.get(l)*1.1);
		        		jobScorePoint[l][h] = 1.1;
					}
					h++;
				}
			}
			if(certis!=null) {
				SelectDTO selDTO = new SelectDTO();
				int m = 10+majorC;
				for(String certi: certis) {
					List<Integer> li = service.majorToCD(selDTO, certi);
					for(Integer l : li) {
						l = jList.indexOf(l);
						jobScore.set(l, jobScore.get(l)*1.1);
		        		jobScorePoint[l][m] = 1.1;
					}
					m++;
				}
			}
			
			Map<Integer, Double> jcdToScore = new HashMap<>();
			for (int idx = 0; idx < jList.size(); idx++) {
				jcdToScore.put(jList.get(idx), jobScore.get(idx));
	//			System.out.print(jList.get(idx)+": "+jobScore.get(idx)+" ");
	//			for(int m = 0; m < 10+majorC+certiC; m++)
	//            	System.out.print(jobScorePoint[idx][m]+" ");
				//service.insertJobPoint(user,jList.get(idx),jobScore.get(idx), jobScorePoint[idx], majorC, certiC);
	//            System.out.println();
			}
			
	//		List<Map.Entry<Integer, Double>> list = new ArrayList<>(jcdToScore.entrySet());
	//        Collections.sort(list, new Comparator<Map.Entry<Integer, Double>>() {
	//            public int compare(Map.Entry<Integer, Double> o1, Map.Entry<Integer, Double> o2) {
	//                return o2.getValue().compareTo(o1.getValue());
	//            }
	//        });
	        
	        // 결과 출력
	//        for (Map.Entry<Integer, Double> entry : list) {
	//            System.out.println(entry.getKey() + ": " + entry.getValue()+" ");
	//        }
			SelectDTO selDTO = new SelectDTO();
			List<HashMap<String, BigDecimal>> recoLi= service.getJobPoint(selDTO, user, 1, 5);
			System.out.println(recoLi);
			SelectDTO selDTO2 = new SelectDTO();
			HashMap<String,String> top3NM = service.getRecoList(selDTO2, user);
			ArrayList <String> colNM = new ArrayList<String>(
					Arrays.asList("APTITUDE_NAME1","APTITUDE_NAME2",
							"APTITUDE_NAME3","INTEREST_NAME1",
							"INTEREST_NAME2","INTEREST_NAME3"));
			ArrayList <String> colNM2 = new ArrayList<String>(
					Arrays.asList("JOB_CD","TOTAL","APTITUDE1",
							"APTITUDE2","APTITUDE3","INTEREST1",
							"INTEREST2","INTEREST3","VALUE1","VALUE2",
							"VALUE3","VALUE4"));
			for(int c = 0 ; c < majorC; c++) colNM2.add("MAJOR"+(c+1));
			for(int c = 0 ; c < certiC; c++) colNM2.add("CERTI"+(c+1));
			System.out.println(colNM2);
			LinkedHashMap<String, BigDecimal> NMByPoint = new LinkedHashMap<String,BigDecimal>();
			
			for(int c = 0; c < 11+majorC+certiC; c++) {
				String factor = null;
				if(c == 0) factor = "직업 일련번호";
				else if(c == 1) factor = "총점";
				else if(c < 8) factor = top3NM.get(colNM.get(c-2));
				else if(c==8) factor = "안전지향";
				else if(c==9) factor = "의미지향";
				else if(c==10) factor = "변화지향";
				else if(c==11) factor = "성취지향";
				else if(c<11+majorC) factor = majors.get(c-11);
				else if(c<11+majorC+certiC) factor = certis.get(c-11-majorC);
				System.out.println(factor + " " +recoLi.get(0).get(colNM2.get(c)));
				NMByPoint.put(factor, recoLi.get(0).get(colNM2.get(c)));
			}
			return NMByPoint;
		}
	
}

