package kr.co.codin.repository.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Member {
	int memberNo;
	String memberEmail;
	String password;
	String memberGrade;
	String memberName;
	String memberPhone;
	String memberNickname;
	int hosCode;
	String memberCareer;
	String mailingOpt;
	String memberOriName;
	String memberSysName;
	String memberFilePath;
	int memberFileSize;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	Date memberFileRegDate;
}
