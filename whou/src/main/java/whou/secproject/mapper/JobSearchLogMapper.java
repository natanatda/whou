package whou.secproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import whou.secproject.component.SearchLogDTO;

public interface JobSearchLogMapper {
	public int isSearchList(String keyWord);
	public int isCountJob();
	public int isCountKeyWord();
	public void insertSearchList(String keyWord);
	public void updateSearchList(String keyWord);
	public void insertSearchLog(SearchLogDTO dto);
	public List<SearchLogDTO> countJob(@Param("jobDateSelect")String jobDateSelect,
			@Param("nowDate") String nowDate, @Param("startDate")String start, @Param("endDate")String end,@Param("rownum")int rownum);
	
	public List<SearchLogDTO> countKeyWord(@Param("keyDateSelect")String keyDateSelect,
			@Param("nowDate") String nowDate, @Param("keyStartDate")String start, @Param("keyEndDate")String end,@Param("rownum")int rownum);
	
}
