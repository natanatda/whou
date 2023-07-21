package whou.secproject.component;

import lombok.Data;

@Data
public class WhouModelDTO {
	private int num; // 번호 
	private String name; // 커스텀 이름
	private int camera; // 카메라 값
	private String path_folder; // 폴더 이름
	private String path_gltf; // 파일명
	private String color; // 모델색
	private String scale_x; // 모델 크기
	private String scale_y;
	private String scale_z;
	private String position_x; // 모델 위치
	private String position_y;
	private String position_z;
	private String rotation_x; // 모델 회전
	private String rotation_y;
	private String rotation_z;
	private int motion; // 움직임
}
