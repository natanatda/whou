package whou.secproject.component;

import lombok.Data;

@Data
public class AptitudeTestResultRequestDTO {
	
    private String qestrnSeq;
    private String trgetSe;
    private String name;
    private String gender;
    private String school;
    private String grade;
    private String email;
    private long startDtm;
    private String answers;
    
}
