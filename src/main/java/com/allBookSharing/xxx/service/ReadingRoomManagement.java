package com.allBookSharing.xxx.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import com.allBookSharing.xxx.dao.IReadingRoomManagementDao;
import com.allBookSharing.xxx.dto.ReadingRoom;
import com.allBookSharing.xxx.dto.Seats;
import com.google.gson.Gson;

@Service
public class ReadingRoomManagement {

	@Autowired
	IReadingRoomManagementDao rDao;
	
	@Autowired
	UserReadingRoomManagement rm;
	
	ModelAndView mav;
	
	//열람실 등록 메소드
	@Transactional
	public String readingRoomInsert(ReadingRoom readingRoom) {
		int result=rDao.readingRoomInsert(readingRoom);
		
		List<Seats> seats=readingRoom.getSeats();		
		result+=rDao.seatInsert(seats);
		
		if(result!=0) {
			return "성공";
		}else {
			return "실패";
		}
		
	}
	//열람실 목록 가져오는 메소드
	public List<ReadingRoom> getReadingRoomList(int lb_code) {
		
		List<ReadingRoom> rList=rDao.getReadingRoomList(lb_code);
		
		return rList;
	}
	//열람실 삭제하는 메소드
	@Transactional
	public String ReadingRoomDelete(Integer rm_code) {
		int result=0;
		
		result=rDao.ReadingRoomDelete(rm_code);
		
		if(result!=0) {
			return "성공";
		}else {
			return "실패";
		}
		
	}
	//열람실 수정 페이지로 이동하는 메소드, 이동하면서 해당 열람실의 정보를 가져온다
	public ModelAndView readingRoomModifyMove(String rm_code) {
		ReadingRoom readingRoom=rDao.getReadingRoomInfo(rm_code);
		List<Seats> seats=rDao.getSeatInfo(rm_code);
		readingRoom.setSeats(seats);
		Gson gson=new Gson();
		
		mav=new ModelAndView();
		mav.addObject("readingRoom", gson.toJson(readingRoom));
		mav.setViewName("librarian/readingRoomModify");
		
		return mav;
	}
	
	//열람실 수정하는 메소드
	public String readingRoomModify(ReadingRoom readingRoom) {
		int result=rDao.readingRoomModify(readingRoom);
		
		List<Seats> seats=readingRoom.getSeats();		
		result= rDao.seatModify(seats, readingRoom.getRm_code());
		
		if(result!=0) {
			return "성공";
		}else {
			return "실패";
		}
	}
	//매일 6시에 열람실 초기화하는 메소드, 스케줄러에서 사용
	public void readingRoomInitialize() {
		rDao.readingRoomInitialize();
		
	}
	
	//열람실 좌석관리목록 가져오는 메소드
	public List<ReadingRoom> readingRoomSeatList(int lb_code) {
		List<ReadingRoom> rList=rDao.getReadingRoomList(lb_code);
		
		for(int i=0;i<rList.size();i++) {
			Map<String, Integer> temp=rm.numberOfSeatsInUse(String.valueOf(rList.get(i).getRm_code()));
			rList.get(i).setNumberOfSeatsAvailable(temp.get("numberOfSeatsAvailable"));
			rList.get(i).setNumberOfSeatsInUse(temp.get("numberOfSeatsInUse"));
		}
		
		return rList;
	}
	public ModelAndView readingRoomSeatManagement(String rm_code) {
		ReadingRoom readingRoom = rDao.getReadingRoomInfo(rm_code);
		List<Seats> seats=rDao.getSeatInfo(rm_code);
		readingRoom.setSeats(seats);
		Gson gson=new Gson();
		mav=new ModelAndView();
		mav.addObject("readingRoom", gson.toJson(readingRoom));
		
		mav.setViewName("librarian/readingRoomSeatManagement");
		return mav;
	}
	public String readingRoomCancel(Seats seat) {
		boolean result = rDao.readingRoomCancel(seat);
		if(result) {
			return "예약을 취소했습니다.";
		}else {
			return "실패";
		}
		
	}
	public String readingRoomAllCancel(String rm_code) {
		
		boolean result = rDao.readingRoomAllCancel(Integer.parseInt(rm_code));
		if(result) {
			return "예약을 취소했습니다.";
		}else {
			return "실패";
		}
	}
	
}
