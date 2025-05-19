package com.reservation;

public class Guest {
	private int cID;
	private String gName;
	private String gPhn;
	private String email;
	private String idType;
	private String idNo;
	private String roomNo;
	private int guestNo;
	private String cInDate;
	private String cOutDate;
	private String sr;
	public Guest(int cID, String gName, String gPhn, String email, String idType, String idNo, String roomNo,
			int guestNo, String cInDate, String cOutDate, String sr) {
		
		this.cID = cID;
		this.gName = gName;
		this.gPhn = gPhn;
		this.email = email;
		this.idType = idType;
		this.idNo = idNo;
		this.roomNo = roomNo;
		this.guestNo = guestNo;
		this.cInDate = cInDate;
		this.cOutDate = cOutDate;
		this.sr = sr;
		
	}
	
	
	public Guest(int cID, String gName, String gPhn, String roomNo, String cInDate) {
		
		this.cID = cID;
		this.gName = gName;
		this.gPhn = gPhn;
		this.roomNo = roomNo;
		this.cInDate = cInDate;
	}
	
	


	public Guest(String gName, String gPhn, String email, String idNo, String cOutDate) {
		
		this.gName = gName;
		this.gPhn = gPhn;
		this.email = email;
		this.idNo = idNo;
		this.cOutDate = cOutDate;
	}


	public int getcID() {
		return cID;
	}
	public String getgName() {
		return gName;
	}
	public String getgPhn() {
		return gPhn;
	}
	public String getEmail() {
		return email;
	}
	public String getIdType() {
		return idType;
	}
	public String getIdNo() {
		return idNo;
	}
	public String getRoomNo() {
		return roomNo;
	}
	public int getGuestNo() {
		return guestNo;
	}
	public String getcInDate() {
		return cInDate;
	}
	public String getcOutDate() {
		return cOutDate;
	}
	public String getSr() {
		return sr;
	}
	
	

}
