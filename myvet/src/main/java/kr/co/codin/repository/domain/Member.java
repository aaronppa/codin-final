package kr.co.codin.repository.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Member {
	private int memberNo;
	private String memberEmail;
	private String password;
	private String memberGrade;
	private String memberName;
	private String memberPhone;
	private String memberNickname;
	private int hosCode;
	private String memberCareer;
	private String mailingOpt;
	private String memberOriName;
	private String memberSysName;
	private String memberFilePath;
	private int memberFileSize;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date memberFileRegDate;
}
