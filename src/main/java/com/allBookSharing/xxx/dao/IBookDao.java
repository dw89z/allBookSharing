package com.allBookSharing.xxx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.allBookSharing.xxx.dto.Books;
import com.allBookSharing.xxx.dto.DeliveryReq;
import com.allBookSharing.xxx.dto.Library;
import com.allBookSharing.xxx.dto.Liked;
import com.allBookSharing.xxx.dto.Reservation;
import com.allBookSharing.xxx.dto.Review;
@Service
@Component
public interface IBookDao {
    
	List<Books> bookSearch(@Param("bk_search")String bk_search,@Param("selectval") String selectval);
	Books bookDetailPage(String bk_code);
	List<Review> bookReviewList(String bk_code);
	List<Books> bookSearch(String bk_search);
	
	Boolean reservationInsert(Reservation r);
	Integer reservationConfirm(Reservation r);
	Boolean reservationCancel(Reservation r);
	
	Boolean likeInsert(Liked lk);
	Boolean likeCancel(Liked lk);
	Integer likedConfirm(Liked lk);
	Integer likeCount(Liked lk);
	
	Integer deliCount(DeliveryReq dr);
	Boolean deliInsert(DeliveryReq dr);
	
	List<Books> myRegionSearch(@Param("bk_search")String bk_search, @Param("selectval")String selectval,@Param("region")String region);

	
	List<Library> myRegionLib(@Param("bk_search")String bk_search, @Param("selectval")String selectval, @Param("region")String region);
	
	
	

	
}
