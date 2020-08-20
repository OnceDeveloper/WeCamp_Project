package com.wecamp.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CampAndImg {
	//camp table 컬럼
	private long camp_idx;
	private String camp_name;
	private String address;
	private String camp_tel;
	private int site_num;
	private int full_num;
	private int parking;
	private String conv;
	private String sec_conv;
	private String etc_conv;
	private String agency_tel;
	private String agency_name;
	private long total_booking; // long 으로 바꿈
	private String intro;
	//img table 컬럼
	private long img_idx;
	private String fname;
	private String ofname;
	private long fsize;
	//sort table 컬럼
	private String division;
	//sort min 사용한 컬럼
	private long min_fee;
	//review average 사용한 컬럼
	private float avgStar;
	private int fullStarNum;
	private boolean isHalfStarExist;
	private int emptyStarNum;
}
