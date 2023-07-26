package whou.secproject.service;

import java.util.List;
import java.util.Map;

import whou.secproject.component.TestVoDTO;

public interface aptService {
	public TestVoDTO testCrawling(String testURL, String qnum);
	public void crawlingInsert(TestVoDTO dto);
	public List<String> crawlingSplit(TestVoDTO dto, String qnum);
	public List<String> crawlingSplitRank(TestVoDTO dto, String qnum);
	public List<String> crawlingSplitJob(TestVoDTO dto, String qnum);
}
