package whou.secproject.component;

import java.util.ArrayList;

import lombok.Data;

@Data
public class RecoResultDTO {
	private String job_nm;
	private String description;
	private ArrayList<String> descriptionLi = new ArrayList<String>();
	private String descriptions;
	public void setDescription(String description) {
		this.description= description;
		if(description!=null) descriptionLi.add(description);
	}
	public String getDescriptions() {
		descriptions="";
		for(int i = 0 ; i < descriptionLi.size(); i++) {
			descriptions+=descriptionLi.get(i);
			if(i!=descriptionLi.size()-1) descriptions+="고,";
			else descriptions+="게 나왔습니다.";
		}
		return descriptions;
	}
	
}
