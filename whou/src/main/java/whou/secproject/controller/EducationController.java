package whou.secproject.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import whou.secproject.component.EducationApiParamDTO;
import whou.secproject.component.EducationMajorResponseDTO;
import whou.secproject.repository.EducationApiDAO;

@Controller
@RequestMapping("/education")
public class EducationController {
	
	@Autowired
	private EducationApiDAO dao;
	
	@RequestMapping("/majorList")
	public String educationList(Model model, HttpServletRequest request) throws IOException {
		String notFirst = request.getParameter("notFirst"); // jsp에서 폼제출 받았는지 체크
		
		if(notFirst != null && notFirst.equals("notFirst")) {
			
			//파라미터 가져오기
			String univSe="";
			String [] univSeArr = request.getParameterValues("univSe"); //대학 전문대학
			String subject="";
			String [] subjectArr = request.getParameterValues("subject"); // 학과 계열
			String thisPage = request.getParameter("thisPage"); //현재페이지
			String perPage = request.getParameter("perPage"); //한페이지당 건수
			String searchTitle = request.getParameter("searchTitle"); //검색어
			
			//파라미터 DTO에 set하기
			EducationApiParamDTO paramDTO= new EducationApiParamDTO();
			StringBuilder sb = null;
			if(univSeArr.length > 0) {
				sb = new StringBuilder(univSeArr[0]);
				for(int i=1; i<univSeArr.length; i++) {
					sb.append(",").append(univSeArr[i]);
				}
				univSe=sb.toString();
				paramDTO.setUnivSe(univSe);
			}
			if(subjectArr.length > 0) {
				sb = new StringBuilder(subjectArr[0]);
				for(int i=1; i<subjectArr.length; i++) {
					sb.append(",").append(subjectArr[i]);
				}
				subject=sb.toString();
				paramDTO.setSubject(subject);
			}
			paramDTO.setThisPage(thisPage != null ? thisPage:"1");
			paramDTO.setPerPage(perPage != null ? perPage:"10");
			if(searchTitle.length() > 0) {
				paramDTO.setSearchTitle(searchTitle);
			}
			
			EducationMajorResponseDTO responseDTO = dao.getMajorApi(paramDTO);
			System.out.println("이게 머야1111 "+responseDTO);
			
			model.addAttribute("RESULT", responseDTO);
		}
		
		
		model.addAttribute("notFirst", notFirst);
	    return "/education/education";
	}
	
	
	
}
