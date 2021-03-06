package com.allBookSharing.xxx.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;


import com.allBookSharing.xxx.dto.Member;

@Service
public interface IjoinMangementDao {
	@Select("select * from member where mb_id=#{id}")
	Member idfind(String id);

	boolean memberJoin(Member mb);

	
	@Select("SELECT * FROM USERS WHERE US_EMAIL=#{email}")  
	String getIdFind(String email);


	User findOneByEmail(String email);
	
	@Select("SELECT COUNT(*) FROM MEMBER WHERE MB_ID=#{mb_id}")
	int idCheck(String mb_id);

		
}




	
