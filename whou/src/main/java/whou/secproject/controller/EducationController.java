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
import whou.secproject.component.EducationMajorResponseDTO;
import whou.secproject.component.EducationMajorResponseDTO.MajorInfo;
import whou.secproject.repository.EducationApiDAO;

@Controller
@RequestMapping("/education")
public class EducationController {
	
	@Autowired
	private EducationApiDAO dao;
	
	@RequestMapping("/majorList")
	public String majorList(Model model, HttpServletRequest request, Integer univCount, 
			List<EducationMajorResponseDTO.MajorInfo> majorListDTO, EducationApiParamDTO paramDTO) throws IOException {
			
		
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
		String searchTitle = request.getParameter("searchTitle"); //검색어
		
		//파라미터 DTO에 set하기
		EducationApiParamDTO paramDTO= new EducationApiParamDTO();
		paramDTO.setUnivSe(univSe);
		paramDTO.setSubject(subject);
		paramDTO.setThisPage("1");
		paramDTO.setPerPage("510");
		paramDTO.setPerPageSet(perPage); //사용자 입력값 점검
		if(searchTitle.length() > 0) {
			paramDTO.setSearchTitle(searchTitle);
		}
		
		// 모든 결과 불러오기
		EducationMajorResponseDTO responseDTO = dao.getMajorApi(paramDTO);
		// 결과 총 개수 세기
		int univCount = 0;
		univCount = responseDTO.getDataSearch().getContent().size();
		
		
		//사용자 요청 값만큼의 결과만 불러오기
		paramDTO.setThisPage(thisPage);
		paramDTO.setPerPage(perPage);
		responseDTO = dao.getMajorApi(paramDTO);
		List<EducationMajorResponseDTO.MajorInfo> majorListDTO = new ArrayList<>();
		for(int i=0; i<responseDTO.getDataSearch().getContent().size(); i++) {
			majorListDTO.add(responseDTO.getDataSearch().getContent().get(i));
		}
		
		System.out.println("이게 머야 majorDetailLstResponseDTO "+majorListDTO);
		System.out.println();
		
		return majorList(model, request, univCount, majorListDTO, paramDTO);
	}
	
	
	@RequestMapping("/majorDetail")
	public String majorDetail() throws IOException {
	    return "/education/educationDetail";
	}
	
}
