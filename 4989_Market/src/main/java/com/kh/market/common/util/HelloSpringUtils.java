
package com.kh.market.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class HelloSpringUtils {
	
	/*
	 * 사용자 업로드 파일에 대해
	 * 서버 저장용 파일명 생성메소드
	 * 
	 */
	

	public static String getRenamedFileName(String originalFileName) {
		//abcde.txt
		String ext = originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		int rndNum = new Random().nextInt(1000);
		String renamedFileName = sdf.format(new Date())+"_"+rndNum+"."+ext;
		
		return renamedFileName;
	}
	
	

}

