package whou.secproject.mapper;

import java.util.List;

import whou.secproject.component.AptitudeTestTemporarySaveDTO;
import whou.secproject.component.AptitudeTestValueDTOSJ;

public interface AptitudeMapperSJ {
	public void crawlingInsert(AptitudeTestValueDTOSJ dto); //크롤링 결과 DB에 넣기
	public void temporarySaveInsert(AptitudeTestTemporarySaveDTO dto); //임시저장 값 DB에 넣기
	public List<AptitudeTestValueDTOSJ> getRecentTest(AptitudeTestValueDTOSJ dto); // 검사 결과 회수와 최근일자
	public List<AptitudeTestTemporarySaveDTO> getTemporarySave(AptitudeTestTemporarySaveDTO dto); //임시저장한 값
}
