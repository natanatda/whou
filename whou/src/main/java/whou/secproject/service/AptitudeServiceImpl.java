package whou.secproject.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import whou.secproject.component.AptitudeTestTemporarySaveDTO;
import whou.secproject.component.AptitudeTestValueDTO;
import whou.secproject.component.RecommandInfoDTO;
import whou.secproject.mapper.AptitudeMapper;

@Service
public class AptitudeServiceImpl implements AptitudeService{
	
	@Autowired
	private AptitudeMapper mapper;
	
	//크롤링 하기
	@Override
	public AptitudeTestValueDTO testCrawling(String testURL, String qnum) {
		AptitudeTestValueDTO dto = new AptitudeTestValueDTO();
        System.setProperty("webdriver.chrome.driver", "D:\\r\\selenium-server-standalone-master\\bin\\chromedriver.exe");

        WebDriver driver = new ChromeDriver();
        driver.get(testURL);
        
        // 역량
        if(qnum.equals("27")) {
        	List<WebElement> developElements = driver.findElements(By.cssSelector("div.develop-type > ul > li.on"));
        	StringBuilder developType = new StringBuilder();
            for (WebElement element : developElements) {
                developType.append(element.getText().replaceAll("\\n", "+"));
            }
            System.out.println(developType);

            // 개발 점수 정보 가져오기
            List<WebElement> scoreElements = driver.findElements(By.cssSelector("div.aptitude-result-content.cont_result > div:nth-child(2) > div:nth-child(5) > table > tbody"));
            StringBuilder developScore = new StringBuilder();
            for (WebElement element : scoreElements) {
                developScore.append(element.getText().replaceAll("\\n", " ").replaceAll("구분 점수 구분 점수 ", ""));
            }
            System.out.println(developScore);

            // 기획 유형 정보 가져오기
            StringBuilder planningSB = new StringBuilder();
            String planning ="";
            for (int i = 2; i <= 11; i += 3) {
                String selector = "div.aptitude-result-content.cont_result > div:nth-child(2) > div:nth-child(12) > table > tbody > tr:nth-child(" + i + ") > td";
                List<WebElement> planningElements = driver.findElements(By.cssSelector(selector));
                StringBuilder temp1 = new StringBuilder();
                for (WebElement element : planningElements) {
                	temp1.append(element.getText());
                }
                planningSB.append(temp1).append(" ");
            }
            planning = planningSB.toString().replaceAll("\\n", "+");
            System.out.println(planning);

         // 준비 유형 정보 가져오기
            List<WebElement> preparationElements = driver.findElements(By.cssSelector("div.aptitude-result-content.cont_result > div:nth-child(3) > div.box_graph > table > tbody"));
            StringBuilder preparation = new StringBuilder();
            String result = "";
            for (WebElement element : preparationElements) {
                preparation.append(element.getText());
            }
            String present=preparation.toString().replaceAll("\\n", "+");
            
            int startIndex = present.indexOf("검사결과+");
            int endIndex = present.substring(startIndex + 6).indexOf("+");
            
            while (present.contains("검사결과+")) {
                result += present.substring(startIndex, endIndex + startIndex + 6 + 1);
                present = present.substring(endIndex + startIndex + 6);
                startIndex = present.indexOf("검사결과+");
                endIndex = present.substring(startIndex + 6).indexOf("+");
            }
            String preparation2=result;
            String preparation3 = preparation2.substring(0,preparation2.length()/2);
            preparation2=result;
            String preparation4 = preparation2.substring(preparation2.length()/2);
            
            System.out.println(preparation2);
            driver.quit();  // WebDriver 종료
            
            
            //DB에 넣으려고 검사 크롤링 값 dto에 셋하기
            dto.setTest27_1(developType.toString());
    		dto.setTest27_2(developScore.toString());
    		dto.setTest27_3(planning);
    		dto.setTest27_4(preparation3);
    		dto.setTest27_5(preparation4);
        }
        
        
        // 가치관
        if(qnum.equals("25")) {
        	// 가치 요약 정보 가져오기
            List<WebElement> summaryElements = driver.findElements(By.cssSelector("div.aptitude-tbl-list.value.import > table > tbody > tr:nth-child(1) > td:nth-child(2)"));
            String valueSummary = "";
            for (WebElement element : summaryElements) {
                valueSummary += element.getText() + " + ";
            }
            List<WebElement> categoryElements = driver.findElements(By.cssSelector("div.aptitude-tbl-list.value.import > table > tbody > tr:nth-child(2) > td:nth-child(1)"));
            for (WebElement element : categoryElements) {
                valueSummary += element.getText() + " + ";
            }
            List<WebElement> typeElements = driver.findElements(By.cssSelector("div.aptitude-tbl-list.value.import > table > tbody > tr:nth-child(2) > td.left.center.me"));
            for (WebElement element : typeElements) {
                valueSummary += element.getText() + " + ";
            }
            System.out.println(valueSummary);

            // 가치 점수 정보 가져오기
            List<WebElement> scoreElements = driver.findElements(By.cssSelector("div.aptitude-result-content > div:nth-child(1) > div:nth-child(5) > table > tbody"));
            String valueScore = "";
            for (WebElement element : scoreElements) {
                valueScore += element.getText().replaceAll("\\n", " ");
            }
            System.out.println(valueScore);

            // 가치 유형 정보 가져오기
            List<WebElement> valueTypeElements = driver.findElements(By.cssSelector("div.aptitude-result-content > div:nth-child(1) > div:nth-child(8) > table > tbody > tr:nth-child(2) > th"));
            String valueType = "";
            for (WebElement element : valueTypeElements) {
                valueType += element.getText().replaceAll("\\n", "+");
            }
            System.out.println(valueType);
            
            // value_import 정보 가져오기
            List<WebElement> valueImportElements = null;
            String valueImport = "";
            for (int i = 1; i <= 3; i++) {
                String selector = "div.aptitude-tbl-list.value.best > table > tbody > tr:nth-child(2) > td:nth-child(" + i + ")";
                valueImportElements = driver.findElements(By.cssSelector(selector));
                for (WebElement element : valueImportElements) {
                    valueImport += element.getText() + " + ";
                }
            }
            System.out.println(valueImport);

            
            driver.quit();  // WebDriver 종료
            
            
            //DB에 넣으려고 검사 크롤링 값 dto에 셋하기
            dto.setTest25_1(valueSummary);
    		dto.setTest25_2(valueScore);
    		dto.setTest25_3(valueType);
    		dto.setTest25_4(valueImport);
        }
		
        // 적성
        if (qnum.equals("21")) {
		    // 페이지 로드가 코드 실행보다 느려서 지연 추가
		    try {
		        TimeUnit.SECONDS.sleep(1); // 3초 동안 대기
		    } catch (InterruptedException e) {
		        e.printStackTrace();
		    }
		    // TOP3
	         List<WebElement> developElements = driver.findElements(By.cssSelector(
	               "div.cont-wrap.page-break > ul > li > strong"));
	         String text ="";
	         for (WebElement element : developElements) {
	            text += element.getText() + "+";
	         }
	         // 백분위
	         List<WebElement> scoreElements = driver.findElements(By.cssSelector(
		               "div.cont-wrap.page-break > div:nth-child(5) > table > tbody > tr > td:nth-child(even)"));
		         String scoreText ="";
		         for (WebElement element : scoreElements) {
		        	 scoreText += element.getText() + "+";
		         }
		         
	         // 직업추천
	         List<WebElement> jobElements = driver.findElements(By.cssSelector(
		               "div.cont-wrap.page-break > div:nth-child(7) > table > tbody > tr > th"));
		         String jobText ="";
		         for (WebElement element : jobElements) {
		        	 jobText += element.getText() + "+";
		         }
		         
	         // 직업추천리스트1
	         List<WebElement> jobList1 = driver.findElements(By.cssSelector(
		               "div.aptitude-tbl-list.black-line.page-break > table > tbody:nth-child(4) > tr.line-top > td:nth-child(5)"));
		         String jobListText1 ="";
		         for (WebElement element : jobList1) {
		        	 jobListText1 += element.getText() + "+";
		         }
		         
	         // 직업추천리스트2
	         List<WebElement> jobList2 = driver.findElements(By.cssSelector(
		               "div.aptitude-tbl-list.black-line.page-break > table > tbody:nth-child(5) > tr.line-top > td:nth-child(5)"));
		         String jobListText2 ="";
		         for (WebElement element : jobList2) {
		        	 jobListText2 += element.getText() + "+";
		         }
		         
	         // 직업추천리스트2
	         List<WebElement> jobList3 = driver.findElements(By.cssSelector(
		               "div.aptitude-tbl-list.black-line.page-break > table > tbody:nth-child(6) > tr.line-top > td:nth-child(5)"));
		         String jobListText3 ="";
		         for (WebElement element : jobList3) {
		        	 jobListText3 += element.getText() + "+";
		         }
		         
		         
	         driver.quit(); // WebDriver 종료

	         // DB에 넣으려고 검사 크롤링 값 dto에 셋하기
	         dto.setTest21_1(text);
	         dto.setTest21_2(scoreText);
	         dto.setTest21_3(jobText);
	         dto.setTest21_4(jobListText1);
	         dto.setTest21_5(jobListText2);
	         dto.setTest21_6(jobListText3);
	      }
		
        // 흥미
		if (qnum.equals("31")) {
			 // TOP3
	         List<WebElement> developElements = driver.findElements(By.cssSelector(
	               "#ct > div:nth-child(1) > div.aptitude-result-content > div:nth-child(1) > ul > li > span"));
	         String text ="";
	         for (WebElement element : developElements) {
	            text += element.getText() + "+";
	         }
	         // 백분위
	         List<WebElement> scoreElements = driver.findElements(By.cssSelector(
		               "#ct > div:nth-child(2) > div > div > div > table > tbody > tr > td > div > div.scoreBar > span"));
	         String scoreText ="";
	         for (WebElement element : scoreElements) {
	        	 scoreText += element.getText() + "+";
	         }
		      // 직업추천
	         List<WebElement> jobElements = driver.findElements(By.cssSelector(
	               "#ct > div:nth-child(1) > div.aptitude-result-content > div:nth-child(2) > div > table > thead > tr > th"));
	         String jobText ="";
	         for (WebElement element : jobElements) {
	        	 jobText += element.getText() + "+";
	         }
	         
	         // 직업추천리스트1
	         List<WebElement> jobList1 = driver.findElements(By.cssSelector(
	               "#ct > div:nth-child(1) > div.aptitude-result-content > div:nth-child(2) > div > table > tbody > tr.td-background.span-block > td:nth-child(1) > span"));
	         String jobListText1 ="";
	         for (WebElement element : jobList1) {
	        	 jobListText1 += element.getText() + "+";
	         }
	         // 직업추천리스트2
	         List<WebElement> jobList2 = driver.findElements(By.cssSelector(
	               "#ct > div:nth-child(1) > div.aptitude-result-content > div:nth-child(2) > div > table > tbody > tr.td-background.span-block > td:nth-child(2) > span"));
	         String jobListText2 ="";
	         for (WebElement element : jobList2) {
	        	 jobListText2 += element.getText() + "+";
	         }
	         // 직업추천리스트3
	         List<WebElement> jobList3 = driver.findElements(By.cssSelector(
	               "#ct > div:nth-child(1) > div.aptitude-result-content > div:nth-child(2) > div > table > tbody > tr.td-background.span-block > td:nth-child(3) > span"));
	         String jobListText3 ="";
	         for (WebElement element : jobList3) {
	        	 jobListText3 += element.getText() + "+";
	         }

	         driver.quit(); // WebDriver 종료

	         // DB에 넣으려고 검사 크롤링 값 dto에 셋하기
	         dto.setTest31_1(text);
	         dto.setTest31_2(scoreText);
	         dto.setTest31_3(jobText);
	         dto.setTest31_4(jobListText1);
	         dto.setTest31_5(jobListText2);
	         dto.setTest31_6(jobListText3);
	      }
        
        return dto;
	}
	
	
	
	@Override
	public List<String> crawlingSplit(AptitudeTestValueDTO dto, String qnum) {
	    // 결과를 저장할 리스트를 생성합니다.
	    List<String> resultList = new ArrayList<>();
	    
	    // qnum이 "21"인 경우 실행합니다.
	    if (qnum.equals("21")) {
	        // dto 객체의 Test31_2 필드 값을 "+"를 기준으로 나눕니다.
	        String[] array = dto.getTest21_2().toString().split("\\+");
	        
	        // 나눈 각 값을 반복하여 처리합니다.
	        for(String num : array) {
	            // 문자열을 실수로 변환하고 10을 곱합니다.
	            double value = Double.parseDouble(num.trim()) * 10;
	            
	            // 실수를 정수로 변환합니다.
	            int intValue = (int) value;
	            
	            // 변환한 정수 값을 resultList에 추가합니다.
	            resultList.add(String.valueOf(intValue));
	        }
	    }
	    
	    // qnum이 "31"인 경우 실행합니다.
	    if (qnum.equals("31")) {
	    	
	        // dto 객체의 Test31_2 필드 값을 "+"를 기준으로 나눕니다.
	        String[] array = dto.getTest31_2().toString().split("\\+");
	        
	        // 나눈 값을 resultList에 할당합니다.
	        resultList = Arrays.asList(array);
	       
	    }
	    
	    // 결과 리스트를 반환합니다.
	    return resultList;
	}
	
	//31번 문항의 직업흥미군을 리스트로 반환하기 위한 메소드
	@Override
	public List<String []> crawlingSplitArr(AptitudeTestValueDTO dto, String qnum) {
		List<String[]> arrList = new ArrayList<>();
		// qnum이 "31"인 경우 실행합니다.
	    if (qnum.equals("31")) {
	    	
	        // dto 객체의 Test31_2 필드 값을 "+"를 기준으로 나눕니다.
	        String[] array3 = dto.getTest31_4().toString().split("\\+"); //직업 흥미군1
	        String[] array4 = dto.getTest31_5().toString().split("\\+"); //직업 흥미군2
	        String[] array5 = dto.getTest31_6().toString().split("\\+"); //직업 흥미군3
	       
	        arrList.add(array3); //직업 흥미군1
	        arrList.add(array4); //직업 흥미군2
	        arrList.add(array5); //직업 흥미군3
	    }
	    return arrList;
	}
	

	@Override
	public List<String> crawlingSplitRank(AptitudeTestValueDTO dto, String qnum) {
	    // 결과를 저장할 리스트를 생성합니다.
	    List<String> resultRankList = new ArrayList<>();
	    
	    // qnum이 "31"인 경우 실행합니다.
	    if (qnum.equals("31")) {
	        // dto 객체의 Test31_1 필드 값을 "+"를 기준으로 나눕니다.
	        String[] array = dto.getTest31_1().toString().split("\\+");
	        
	        // 나눈 값을 resultRankList에 할당합니다.
	        resultRankList = Arrays.asList(array);
	    }
	    
	    // qnum이 "21"인 경우 실행합니다.
	    if (qnum.equals("21")) {
	        // dto 객체의 Test21_1 필드 값을 "+"를 기준으로 나눕니다.
	        String[] array = dto.getTest21_1().toString().split("\\+");
	        
	        // 나눈 값을 resultRankList에 할당합니다.
	        resultRankList = Arrays.asList(array);
	    }
	    
	    // 결과 리스트를 반환합니다.
	    return resultRankList;
	}

	@Override
	public List<String> crawlingSplitJob(AptitudeTestValueDTO dto, String qnum) {
	    // 결과를 저장할 리스트를 생성합니다.
	    List<String> resultRankList = new ArrayList<>();
	    
	    // qnum이 "31"인 경우 실행합니다.
	    if (qnum.equals("31")) {
	        // dto 객체의 Test31_3 필드 값을 "+"를 기준으로 나눕니다.
	        String[] array = dto.getTest31_3().toString().split("\\+");
	        
	        // 나눈 값을 resultRankList에 할당합니다.
	        resultRankList = Arrays.asList(array);
	    }
	    
	    // qnum이 "21"인 경우 실행합니다.
	    if (qnum.equals("21")) {
	        // dto 객체의 Test21_3 필드 값을 "+"를 기준으로 나눕니다.
	        String[] array = dto.getTest21_3().toString().split("\\+");
	        
	        // 나눈 값을 resultRankList에 할당합니다.
	        resultRankList = Arrays.asList(array);
	    }
	    
	    // 결과 리스트를 반환합니다.
	    return resultRankList;
	}
	
	
	
	//크롤링한 거 DB에 넣기
	@Override
	public void crawlingInsert(AptitudeTestValueDTO dto) {
		mapper.crawlingInsert(dto);
	}
	
	
	//크롤링한 검사결과 화면에 출력하도록 가공
	@Override
	public List<String> reportView(String qnum, AptitudeTestValueDTO dto) {
		List<String> result = new ArrayList<>();
		AtomicInteger counter = new AtomicInteger(1);
		if (qnum.equals("27")) {
		    result = Stream.of(
		        dto.getTest27_1(),
		        dto.getTest27_2(),
		        dto.getTest27_3(),
		        dto.getTest27_4() + dto.getTest27_5()
		    )
		    .flatMap(value -> {
		        if (value.equals(dto.getTest27_2())) {
		            return Arrays.stream(value.split(" "));
		        } else {
		            return Arrays.stream(value.split("\\+"));
		        }
		    })
		    .map(value -> value.replace("검사결과", ""))
		    .map(String::trim) // 공백 제거
		    .filter(value -> value != null && !value.isEmpty())
		    .collect(Collectors.toList());
		    System.out.println("27의 결과 리스트" + result);
		}
		
		
		if (qnum.equals("25")) {
		    result = Stream.of(
		        dto.getTest25_1(),
		        dto.getTest25_2(),
		        dto.getTest25_3(),
		        dto.getTest25_4()
		    )
		    .flatMap(value -> {
		        if (value.equals(dto.getTest25_2())) {
		            return Arrays.stream(value.split(" "));
		        } else {
		            return Arrays.stream(value.split("\\+"));
		        }
		    })
		    .map(String::trim) // 공백 제거
		    .filter(value -> value != null && !value.isEmpty())
		    .collect(Collectors.toList());
		    System.out.println("25의 결과 리스트" + result);
		}
		
		return result;
	}
	
	// 검사지 임시 저장
	@Override
	public void temporarySaveInsert(List<String> answers, AptitudeTestTemporarySaveDTO dto, String qnum) {
		StringBuilder answer = new StringBuilder();
		for(int i = 0; i<answers.size(); i++) {
	    	answer.append(i+1).append("=").append(answers.get(i)).append(" ");
	    	if(qnum.equals("25") && i==48)
	    		answer.append(i+1).append("=").append("");
	    }
	    answer.setLength(answer.length() - 1); 
	    System.out.println(answer);
	    dto.setTest_num(Integer.parseInt(qnum));
	    dto.setTest_answers(answer.toString());
	    
	    String testName="";
	    if(qnum.equals("21")) {
	    	testName="직업적성검사";
	    }
	    if(qnum.equals("25")) {
	    	testName="직업가치관검사";
	    }
	    if(qnum.equals("27")) {
	    	testName="진로개발역량검사";
	    }
	    if(qnum.equals("31")) {
	    	testName="진로개발역량검사";
	    }
	    dto.setTest_name(testName);
	    
	    mapper.temporarySaveInsert(dto);
	}

	
	// 최근 검사 회수와 일자 정보 DB에서 select
	@Override
	public List<AptitudeTestValueDTO> getRecentTest(AptitudeTestValueDTO dto) {
		return mapper.getRecentTest(dto);
	}

	// 임시저장한 값 DB에서 꺼내기
	@Override
	public List<AptitudeTestTemporarySaveDTO> getTemporarySave(AptitudeTestTemporarySaveDTO dto) {
		return mapper.getTemporarySave(dto);
	}

	//임시저장한 검사지를 제출하면 DB에서 삭제
	@Override
	public void temporarySaveDelete(int test_num) {
		mapper.temporarySaveDelete(test_num);		
	}
	
	//임시저장한 검사지를 다시 임시저장하면, DB 업데이트
	@Override
	public void temporarySaveUpdate(List<String> answers, AptitudeTestTemporarySaveDTO dto, String qnum) {
		StringBuilder answer = new StringBuilder();
	    for(int i = 0; i<answers.size(); i++) {
	    	answer.append(i+1).append("=").append(answers.get(i)).append(" ");
	    	if(qnum.equals("25") && i==48)
	    		answer.append(i+1).append("=").append("");
	    }
	    answer.setLength(answer.length() - 1); 
	    
	    
	    dto.setTest_num(Integer.parseInt(qnum));
	    dto.setTest_answers(answer.toString());
	    
		mapper.temporarySaveUpdate(dto);
	}
	
	// 추천 테이블을 위한 작업
	// 가치관 결과지 - 관련 직업명 추출
	@Override
	public String valuesJob() {
		String job_cd="";
		// 성취지향
		String theme3=
				"GIS전문가\r\n"
				+ "건축공학기술자\r\n"
				+ "건축사\r\n"
				+ "금융자산운용가(펀드매니저)\r\n"
				+ "기계공학 기술자ㆍ연구원\r\n"
				+ "기업고위임원\r\n"
				+ "네트워크엔지니어\r\n"
				+ "데이터베이스관리자\r\n"
				+ "번역가\r\n"
				+ "변호사\r\n"
				+ "보험계리인\r\n"
				+ "부동산중개인\r\n"
				+ "사회학연구원\r\n"
				+ "상점판매원\r\n"
				+ "파티플래너\r\n"
				+ "상품중개인\r\n"
				+ "생물학연구원\r\n"
				+ "생활설계사\r\n"
				+ "섬유공학기술자\r\n"
				+ "시스템소프트웨어개발자\r\n"
				+ "정보시스템운영자\r\n"
				+ "식품공학기술자\r\n"
				+ "언어학연구원\r\n"
				+ "에너지공학기술자\r\n"
				+ "영업원\r\n"
				+ "외환딜러\r\n"
				+ "운동감독\r\n"
				+ "웹프로듀서\r\n"
				+ "인문사회계열교수\r\n"
				+ "일반의사\r\n"
				+ "재료공학기술자\r\n"
				+ "전기공학기술자\r\n"
				+ "전자공학기술자\r\n"
				+ "정보보호전문가\r\n"
				+ "조경기술자\r\n"
				+ "운동선수\r\n"
				+ "출판물기획전문가\r\n"
				+ "치과의사\r\n"
				+ "컴퓨터하드웨어 기술자 및 연구원\r\n"
				+ "텔레마케터\r\n"
				+ "토목공학기술자\r\n"
				+ "통신공학 기술자 및 연구원\r\n"
				+ "투자분석가(애널리스트)\r\n"
				+ "판사\r\n"
				+ "검사\r\n"
				+ "한의사\r\n"
				+ "행사기획자\r\n"
				+ "화학공학기술자\r\n"
				+ "환경공학기술자 및 연구원";
		// 변화지향
		String theme2 =
				"경영컨설턴트\r\n"
				+ "경찰관\r\n"
				+ "광고 및 홍보전문가\r\n"
				+ "기자\r\n"
				+ "도시 및 교통설계전문가\r\n"
				+ "사회단체활동가\r\n"
				+ "사회복지사\r\n"
				+ "상담전문가\r\n"
				+ "소방관\r\n"
				+ "수의사\r\n"
				+ "시각디자이너\r\n"
				+ "의복수선원\r\n"
				+ "인테리어디자이너\r\n"
				+ "정밀 농업기술자\r\n"
				+ "제품디자이너\r\n"
				+ "패션디자이너\r\n"
				+ "홍보도우미";
		// 의미지향
		String theme1 ="가수\r\n"
				+ "간병인\r\n"
				+ "간호사\r\n"
				+ "간호조무사\r\n"
				+ "경호원\r\n"
				+ "공예원\r\n"
				+ "교도관\r\n"
				+ "국악인\r\n"
				+ "귀금속 및 보석세공원\r\n"
				+ "만화가\r\n"
				+ "메이크업아티스트\r\n"
				+ "무용가\r\n"
				+ "바텐더\r\n"
				+ "보육교사\r\n"
				+ "사진작가\r\n"
				+ "스포츠강사\r\n"
				+ "아나운서\r\n"
				+ "악기제조원\r\n"
				+ "애완동물미용사\r\n"
				+ "여행상품개발원\r\n"
				+ "연기자\r\n"
				+ "연예인매니저\r\n"
				+ "웨딩플래너\r\n"
				+ "웹디자이너\r\n"
				+ "유치원교사\r\n"
				+ "응급구조사\r\n"
				+ "이용사\r\n"
				+ "미용사\r\n"
				+ "임상심리사\r\n"
				+ "작가\r\n"
				+ "제과사 및 제빵사\r\n"
				+ "조리사 및 주방장\r\n"
				+ "직업상담 및 취업알선원\r\n"
				+ "촬영기사\r\n"
				+ "통역가\r\n"
				+ "특수교사\r\n"
				+ "피부관리사\r\n"
				+ "학예사(큐레이터)\r\n"
				+ "화가";
		
		// 안전지향
		String theme = "가전제품 설치 및 수리원\r\n"
				+ "가축사육자\r\n"
				+ "간판제작원\r\n"
				+ "감정평가사\r\n"
				+ "건설기계운전원\r\n"
				+ "경비원\r\n"
				+ "계산원 및 매표원\r\n"
				+ "곡식작물재배자\r\n"
				+ "공업기계설치 및 정비원\r\n"
				+ "관세사\r\n"
				+ "국제무역사무원\r\n"
				+ "금속가공장치조작원\r\n"
				+ "금형원\r\n"
				+ "노무사\r\n"
				+ "단순노무자\r\n"
				+ "단열원\r\n"
				+ "단조원\r\n"
				+ "대형트럭 및 특수차운전원\r\n"
				+ "도장원\r\n"
				+ "목공\r\n"
				+ "물리치료사\r\n"
				+ "미장원\r\n"
				+ "방사선사\r\n"
				+ "방송장비(H/W)설치 및 수리원\r\n"
				+ "배관원\r\n"
				+ "버스운전기사\r\n"
				+ "법률사무원\r\n"
				+ "법무사\r\n"
				+ "변리사\r\n"
				+ "보건의료정보관리사\r\n"
				+ "비파괴검사원\r\n"
				+ "비행기조종사\r\n"
				+ "사무보조원\r\n"
				+ "사서\r\n"
				+ "산업안전관리원\r\n"
				+ "상ㆍ하수도 처리장치 조작원\r\n"
				+ "석유화학기술자\r\n"
				+ "선장 및 항해사\r\n"
				+ "세무사\r\n"
				+ "세탁원\r\n"
				+ "손해사정사\r\n"
				+ "식품가공검사원\r\n"
				+ "안경사\r\n"
				+ "약사 및 한약사\r\n"
				+ "연근해 어부 및 해녀\r\n"
				+ "영양사\r\n"
				+ "용접원\r\n"
				+ "유리부착원\r\n"
				+ "음료제조관련조작원\r\n"
				+ "인문계중등학교교사\r\n"
				+ "인쇄기조작원\r\n"
				+ "임상병리사\r\n"
				+ "자동차정비원\r\n"
				+ "자동차조립원\r\n"
				+ "장례지도사\r\n"
				+ "전공\r\n"
				+ "전기설비조작원\r\n"
				+ "전문비서\r\n"
				+ "조림 영림 및 벌목원\r\n"
				+ "시장 및 여론조사전문가\r\n"
				+ "조적공\r\n"
				+ "주조원\r\n"
				+ "철골공\r\n"
				+ "철도 및 지하철기관사\r\n"
				+ "청소원\r\n"
				+ "청원경찰\r\n"
				+ "초등학교교사\r\n"
				+ "치과기공사\r\n"
				+ "치과위생사\r\n"
				+ "캐드원\r\n"
				+ "콘크리트공\r\n"
				+ "크레인 및 호이스트운전원\r\n"
				+ "택배원\r\n"
				+ "택시운전기사\r\n"
				+ "통신장비기사\r\n"
				+ "판금원\r\n"
				+ "학원강사\r\n"
				+ "항공교통관제사\r\n"
				+ "비행기승무원\r\n"
				+ "항공기정비원\r\n"
				+ "회계사\r\n"
				+ "회계사무원";
	
		  String[] list = theme3.split("\\r\\n");
		  
		  StringBuilder sb = new StringBuilder();
		  
		  for(int i=0; i<list.length; i++) {
			  job_cd = list[i];
			  
			  if(i==0) {
				  sb.append(mapper.valuesJob(job_cd));
			  }else{
				  sb.append(",").append(mapper.valuesJob(job_cd));
			  }
		  }		  
		  System.out.println(sb.toString());
		  return sb.toString();
	}

	// 가치관 결과지 - 관련 직업 번호 저장
	@Override
	public void valuesInsert(String result) {
		mapper.valuesInsert(result);		
	}
	
	@Override
	public String jobSelect(String jobListItem) {
		return mapper.jobSelect(jobListItem);	
	}
	
	// 적성 결과지 능력에 해당하는 sortValues 검색
	@Override
	public String aptdSelect(String sortName) {
		return mapper.aptdSelect(sortName);	
	}
	
	// 흥미 검사지 - 직업 번호 저장
	@Override
	public String interesteInsert(RecommandInfoDTO dtoRe) {
		return mapper.interesteInsert(dtoRe);	
	}
	

}
