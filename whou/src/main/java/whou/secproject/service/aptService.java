package whou.secproject.service;

import java.util.Map;

import whou.secproject.component.TestVoDTO;

public interface aptService {
	public TestVoDTO testCrawling(String testURL, String qnum);
	public void crawlingInsert(TestVoDTO dto);
	public Map<String,Object> crawlingSplit(TestVoDTO dto);
}
