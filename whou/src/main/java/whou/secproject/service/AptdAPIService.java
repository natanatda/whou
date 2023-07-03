package whou.secproject.service;

import whou.secproject.component.AptitudeTestResponseDTO;
import whou.secproject.component.AptitudeTestResultResponseDTO;

public interface AptdAPIService {
	public AptitudeTestResponseDTO getAptitudeTestByNum(String q);
	public AptitudeTestResultResponseDTO getAptitudeTestResult(String [] answers, String q) ;

}
