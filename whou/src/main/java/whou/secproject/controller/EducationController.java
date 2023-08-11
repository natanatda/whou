package whou.secproject.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import whou.secproject.component.EducationApiParamDTO;
import whou.secproject.component.EducationHrdParamDTO;
import whou.secproject.component.EducationHrdResponseDTO;
import whou.secproject.component.EducationMajorResponseDTO;
import whou.secproject.repository.EducationApiDAO;

@Controller
@RequestMapping("/education")
public class EducationController {
	
	@Autowired
	private EducationApiDAO dao;
	
	@RequestMapping("/majorList")
	public String majorList(Model model, HttpServletRequest request, Integer univCount, 
			ArrayList<EducationMajorResponseDTO.MajorInfo> majorListDTO, EducationApiParamDTO paramDTO) throws IOException {
			
		
		model.addAttribute("paramDTO", paramDTO);
		model.addAttribute("univCount", univCount); //총 결과 수
		model.addAttribute("RESULT", majorListDTO);
	    return "/education/education";
	}
	
	
	@RequestMapping("/majorListSubmit")
	public String majorListSubmit(Model model, HttpServletRequest request) throws IOException {
		
		StringBuilder sb = null;
		
		//파라미터 가져오기
		String univSe="";
		String [] univSeArr = request.getParameterValues("univSe"); //대학 전문대학
		if(request.getParameterValues("univSe") != null) {
			sb = new StringBuilder(univSeArr[0]);
			for(int i=1; i<univSeArr.length; i++) {
				sb.append(",").append(univSeArr[i]);
			}
			univSe=sb.toString();
		}
		
		String subject="";
		String [] subjectArr = request.getParameterValues("subject"); // 학과 계열
		if(subjectArr != null) {
			sb = new StringBuilder(subjectArr[0]);
			for(int i=1; i<subjectArr.length; i++) {
				sb.append(",").append(subjectArr[i]);
			}
			subject=sb.toString();
		}
		
		String thisPage = request.getParameter("thisPage")!=null ? request.getParameter("thisPage"):"1"; //현재페이지
		String perPage = request.getParameter("perPage")!= null ? request.getParameter("perPage"):"10"; //한페이지당 건수
		String searchTitle = request.getParameter("searchTitle")!=null?request.getParameter("searchTitle"):""; //검색어
		
		//파라미터 DTO에 set하기
		EducationApiParamDTO paramDTO= new EducationApiParamDTO();
		paramDTO.setUnivSe(univSe);
		paramDTO.setSubject(subject);
		paramDTO.setThisPage("1");
		paramDTO.setPerPage("510");
		paramDTO.setPerPageSet(perPage); //사용자 입력값 점검
		paramDTO.setSearchTitle(searchTitle);
		
		// 모든 결과 불러오기
		EducationMajorResponseDTO responseDTO = dao.getMajorApi(paramDTO);
		
		
		// 결과 총 개수 세기
		int univCount = 0;
		univCount = responseDTO.getDataSearch().getContent().size();
		
		
		//사용자 요청 값만큼의 결과만 불러오기
		paramDTO.setThisPage(thisPage);
		paramDTO.setPerPage(perPage);
		responseDTO = dao.getMajorApi(paramDTO);
		ArrayList<EducationMajorResponseDTO.MajorInfo> majorListDTO = new ArrayList<>();
		for(int i=0; i<responseDTO.getDataSearch().getContent().size(); i++) {
			majorListDTO.add(responseDTO.getDataSearch().getContent().get(i));
		}
		
		return majorList(model, request, univCount, majorListDTO, paramDTO);
	}
	
	
	@RequestMapping("/majorDetail")
	public String majorDetail(Model model, HttpServletRequest request) throws IOException {
		
		if(request.getParameter("seq")!=null) {
			String majorSeq = request.getParameter("seq");
			EducationApiParamDTO paramDTO= new EducationApiParamDTO();
			paramDTO.setMajorSeq(majorSeq);
			
			EducationMajorResponseDTO responseDTO = dao.getMajorApi(paramDTO);
			
			List<String> fieldItemList = new ArrayList<>();
			List<String> fieldDataList = new ArrayList<>();
			for(int i=0; i<responseDTO.getDataSearch().getContent().get(0).getChartData().get(0).getFields().size(); i++) {
				fieldItemList.add(responseDTO.getDataSearch().getContent().get(0).getChartData().get(0).getFields().get(i).getItem());
				fieldDataList.add(responseDTO.getDataSearch().getContent().get(0).getChartData().get(0).getFields().get(i).getData());
			}
			List<String> salaryItemList = new ArrayList<>();
			List<String> salaryDataList = new ArrayList<>();
			for(int i=0; i<responseDTO.getDataSearch().getContent().get(0).getChartData().get(0).getAvgSalary().size(); i++) {
				salaryItemList.add(responseDTO.getDataSearch().getContent().get(0).getChartData().get(0).getAvgSalary().get(i).getItem());
				salaryDataList.add(responseDTO.getDataSearch().getContent().get(0).getChartData().get(0).getAvgSalary().get(i).getData());
			}
			List<String> applicantItemList = new ArrayList<>();
			List<String> applicantDataList = new ArrayList<>();
			for(int i=0; i<responseDTO.getDataSearch().getContent().get(0).getChartData().get(0).getApplicants().size(); i++) {
				applicantItemList.add(responseDTO.getDataSearch().getContent().get(0).getChartData().get(0).getApplicants().get(i).getItem());
				applicantDataList.add(responseDTO.getDataSearch().getContent().get(0).getChartData().get(0).getApplicants().get(i).getData());
			}
			
			model.addAttribute("RESULT", responseDTO.getDataSearch().getContent().get(0));
			model.addAttribute("seq", majorSeq);
			model.addAttribute("fieldItemList", fieldItemList);
			model.addAttribute("fieldDataList", fieldDataList);
			model.addAttribute("salaryItemList", salaryItemList);
			model.addAttribute("salaryDataList", salaryDataList);
			model.addAttribute("applicantItemList", applicantItemList);
			model.addAttribute("applicantDataList", applicantDataList);
		}
		
	    return "/education/educationDtail";
	}
	
	@RequestMapping("/training")
	public String educationTrain(Model model, HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("UTF-8");
		
		//파라미터 set하기
		EducationHrdParamDTO hrdParam = new EducationHrdParamDTO();
		String trainGb = request.getParameter("trainGb");
		String urlParam = "";
		if(trainGb != null) {
			
			hrdParam.setTrainGb(trainGb);
			String setSrchNcs1 = request.getParameter("setSrchNcs1"); //setSrchNcs1와 setSrchKeco1에 사용
			String sort = request.getParameter("sort");
			String srchTraStDt = request.getParameter("srchTraStDt");
			String srchTraEndDt = request.getParameter("srchTraEndDt");
			String srchTraArea1 = request.getParameter("srchTraArea1");
			String srchTraOrganNm =  request.getParameter("srchTraOrganNm");
			String srchTraProcessNm = request.getParameter("srchTraProcessNm");
			String pageNum = request.getParameter("pageNum");
			
			hrdParam.setSrchNcs1(null);
			hrdParam.setSrchKeco1(null);
			if(trainGb.equals("11")) {
				urlParam="HRDPOA60/HRDPOA60_1.jsp";
				hrdParam.setSrchNcs1(setSrchNcs1!=null && !(setSrchNcs1.equals(""))?setSrchNcs1:"");
			}else {
				if(trainGb.equals("12")) urlParam="HRDPOA62/HRDPOA62_1.jsp";
				if(trainGb.equals("13")) urlParam="HRDPOA68/HRDPOA68_1.jsp";
				if(trainGb.equals("14")) urlParam="HRDPOA69/HRDPOA69_1.jsp";
				hrdParam.setSrchKeco1(setSrchNcs1!=null && !(setSrchNcs1.equals(""))?setSrchNcs1:"");
			}
			
			hrdParam.setSort(sort != null && !sort.equals("") ? sort : "ASC");
			
			hrdParam.setSrchTraStDt(srchTraStDt != null && !srchTraStDt.equals("") ? srchTraStDt.replace("-","") : "");
			hrdParam.setSrchTraEndDt(srchTraEndDt!=null && !(srchTraEndDt.equals(""))? srchTraEndDt.replace("-",""):"");
			hrdParam.setSrchTraArea1(srchTraArea1!=null && !(srchTraArea1.equals(""))? srchTraArea1:"");
			hrdParam.setSrchTraOrganNm(srchTraOrganNm!=null && !(srchTraOrganNm.equals(""))? srchTraOrganNm:"");
			hrdParam.setSrchTraProcessNm(srchTraProcessNm!=null && !(srchTraProcessNm.equals(""))? srchTraProcessNm:"");
			hrdParam.setPageSize("100");
			hrdParam.setPageNum("1");
			
			List<EducationHrdResponseDTO> responseDTO = dao.getHrdApi(urlParam, hrdParam);
			model.addAttribute("hrdCount", responseDTO.size());
			
			hrdParam.setPageNum(pageNum!=null && !(pageNum.equals(""))?pageNum:"1");
			hrdParam.setPageSize("20");
			responseDTO = dao.getHrdApi(urlParam, hrdParam);
			model.addAttribute("responseDTO", responseDTO);
			
			hrdParam.setSrchTraStDt(srchTraStDt);
			hrdParam.setSrchTraEndDt(srchTraEndDt);
			model.addAttribute("hrdParam", hrdParam);
			
		}
		return "/education/educationTrain";
	}
	
}
