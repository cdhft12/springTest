package java142.todak.common;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;

public abstract class ChaebunUtils {
	static Logger logger=Logger.getLogger(ChaebunUtils.class);
	
	public static String cNum(String cNum,String biz_gubun){
		logger.info("(log)ChaebunUtils ����");
		String ChaeNum=cNum;
		
		Date d= new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
		String date=sdf.format(d);
		ChaeNum=date+ChaeNum;
		ChaeNum=biz_gubun+ChaeNum;
		logger.info("ChaeNum >>> "+ChaeNum);
		
		logger.info("(log)ChaebunUtils ä�� ����");
		
		return ChaeNum;
	}
}
