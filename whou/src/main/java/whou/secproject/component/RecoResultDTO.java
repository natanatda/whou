package whou.secproject.component;

import java.util.ArrayList;

import lombok.Data;

@Data
public class RecoResultDTO {
	private int job_cd;
	private String job_nm;
	private String description;
	private double total;
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
			if(i!=descriptionLi.size()-1) descriptions+="여하고,";
			else descriptions+="여 했습니다.";
		}
		return descriptions;
	}
	
}
