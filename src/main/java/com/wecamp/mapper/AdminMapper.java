package com.wecamp.mapper;

import java.util.HashMap;

public interface AdminMapper {
	int selectAdmin(HashMap<String, Object> query);
	Integer selectCountMember();
	Integer selectCountLeaveMember();
	Integer selectCountCamp();
	Integer selectCountBooking();
	Integer selectCountCurrentBooking(); 
	Integer selectCountInquiry();
	Integer selectCountInquiryUnchecked();
}
