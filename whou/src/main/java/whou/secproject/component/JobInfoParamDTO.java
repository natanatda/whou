package whou.secproject.component;

import lombok.Data;

@Data
public class JobInfoParamDTO {
	
    // info
    private String svcType;
    private String svcCode;
    private String contentType;
    private String gubun;
    private String pgubn;
    private String category;
    private String thisPage;
    private String perPage;
    private String jobdicSeq;
}
