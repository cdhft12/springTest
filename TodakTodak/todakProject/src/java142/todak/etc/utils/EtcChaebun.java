package java142.todak.etc.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public abstract class EtcChaebun {
	public static String cNum(String cNum, String biz_gubun){
		String ChaeNum=cNum;
		if (1 == ChaeNum.length())
		{
			ChaeNum = "000" + ChaeNum;
		}
		if (2 == ChaeNum.length())
		{
			ChaeNum = "00" + ChaeNum;
		}
		if(3== ChaeNum.length())
		{
			ChaeNum = "0" + ChaeNum;
		}

		System.out.println(" 채번 확인 1 >>>>"+ChaeNum);
		Date d = new Date(); 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String date = sdf.format(d);

		System.out.println(" 채번 확인 2 >>>>"+ChaeNum);
		ChaeNum = date+ChaeNum;
		ChaeNum = biz_gubun + ChaeNum;
		System.out.println(" 채번 확인 3 >>>>"+ChaeNum);
		return ChaeNum;
	}
	
}
