package whou.secproject.component;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class AptitudeTestResponseDTO {
	@JsonProperty("SUCC_YN")
    private String SUCC_YN;
    
    @JsonProperty("ERROR_REASON")
    private String ERROR_REASON;
    
    @JsonProperty("RESULT")
    private List<ResultItem> RESULT;

    // Getters and Setters
    @Data
    public static class ResultItem {
    	private String relm;
    	private String qestn;
    	private String qestnrSeq;
    	
        private String question;
        private String answer01;
        private String answer02;
        private String answer03;
        private String answer04;
        private String answer05;
        private String answer06;
        private String answer07;
        private String answer08;
        private String answer09;
        private String answer10;
        private String answerScore01;
        private String answerScore02;
        private String answerScore03;
        private String answerScore04;
        private String answerScore05;
        private String answerScore06;
        private String answerScore07;
        private String answerScore08;
        private String answerScore09;
        private String answerScore10;
        private String tip1Score;
        private String tip2Score;
        private String tip3Score;
        private String tip1Desc;
        private String tip2Desc;
        private String tip3Desc;
        private int qitemNo;
    }
}
