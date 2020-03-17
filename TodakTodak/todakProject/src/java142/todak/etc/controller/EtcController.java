package java142.todak.etc.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import java142.todak.common.ChaebunUtils;
import java142.todak.common.FileUploadUtil;
import java142.todak.etc.service.EtcService;
import java142.todak.etc.utils.EtcChaebun;
import java142.todak.etc.utils.LoginSession;
import java142.todak.human.service.HumanService;
import java142.todak.human.vo.ApprVO;
import java142.todak.human.vo.MemberVO;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;









import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;




@Controller
@RequestMapping(value="/etc")
public class EtcController {
	Logger logger = Logger.getLogger(EtcController.class);
	
	@Autowired
	private HumanService humanService;
	
	@Autowired
	private EtcService etcService;
	
	@RequestMapping(value="/insertMember", method = RequestMethod.POST)
	public String registerMember(@ModelAttribute ApprVO param, HttpServletRequest request){
		logger.info("/c 컨트롤러 >>>>>>>>>>");
		String filePath=request.getSession().getServletContext().getRealPath("/upload");
	
		boolean flag=false;
		param=humanService.chaebunMemberAppr();
		System.out.println("+++++++"+param.getHmp_empnum());
		String cnum=param.getHmp_empnum();
		cnum=ChaebunUtils.cNum(cnum, "H");
		
		try{
			FileUploadUtil fuu = new FileUploadUtil();
			boolean bFlag = false;
			bFlag = fuu.fileUpload(request, filePath);
			logger.info("bFlag 사진 인서트 :  >>> : " + bFlag );
			
				Enumeration<String> en = fuu.getFileNames();
//				dbFileName="../"+"upload"+"/"+fileName;
				String hmp_picture =  en.nextElement();
				logger.info("picture >>> : " + hmp_picture);
				String test=fuu.getParameter("hmp_picture");
				System.out.println("test>>>>>>>>>>>"+test);
				
				
				String hmp_name=fuu.getParameter("hmp_name");
				String hmp_birth=fuu.getParameter("hmp_birth");
				String hmp_residentnum=fuu.getParameter("hmp_residentnum");
				String hmp_hpnum=fuu.getParameter("hmp_hpnum");
				String hmp_email=fuu.getParameter("hmp_email");
				String detailAddr=fuu.getParameter("cadress");
				String hmp_addr=fuu.getParameter("hmp_addr")+" "+detailAddr;
				String hmp_postcode=fuu.getParameter("hmp_postcode");
				String hmp_depositors=fuu.getParameter("hmp_depositors");
				String hmp_accountnum=fuu.getParameter("hmp_accountnum");
				String hmp_education=fuu.getParameter("hmp_education");
				String hmp_educontents=fuu.getParameter("hmp_educontents");
				String hmp_workexperience=fuu.getParameter("hmp_workexperience");
				String hmp_workcontents=fuu.getParameter("hmp_workcontents");
				String hmp_id=fuu.getParameter("hmp_id");
				String hmp_pw=fuu.getParameter("hmp_pw");
				
				param.setHmp_empnum(cnum);
				param.setHmp_name(hmp_name);
				param.setHmp_birth(hmp_birth);
				param.setHmp_residentnum(hmp_residentnum);
				param.setHmp_hpnum(hmp_hpnum);
				param.setHmp_email(hmp_email);
				param.setHmp_addr(hmp_addr);
				param.setHmp_postcode(hmp_postcode);
				param.setHmp_picture(hmp_picture);
				param.setHmp_bank("38");
				param.setHmp_depositors(hmp_depositors);
				param.setHmp_accountnum(hmp_accountnum);
				param.setHmp_education(hmp_education);
				param.setHmp_educontents(hmp_educontents);
				param.setHmp_workexperience(hmp_workexperience);
				param.setHmp_workcontents(hmp_workcontents);
				param.setHmp_id(hmp_id);
				param.setHmp_pw(hmp_pw);
				
			
				System.out.println("Hmp_empnum()"+param.getHmp_name());
				System.out.println("Hmp_empnum()"+param.getHmp_birth());
				System.out.println("Hmp_empnum()"+param.getHmp_residentnum());
				System.out.println("Hmp_empnum()"+param.getHmp_hpnum());
				System.out.println("Hmp_empnum()"+param.getHmp_email());
				System.out.println("Hmp_empnum()"+param.getHmp_addr());
				System.out.println("Hmp_empnum()"+param.getHmp_postcode());
				System.out.println("Hmp_empnum()"+param.getHmp_picture());
				System.out.println("Hmp_empnum()"+param.getHmp_bank());
				System.out.println("Hmp_empnum()"+param.getHmp_depositors());
				System.out.println("Hmp_empnum()"+param.getHmp_accountnum());
				System.out.println("Hmp_empnum()"+param.getHmp_education());
				System.out.println("Hmp_empnum()"+param.getHmp_educontents());
				System.out.println("Hmp_empnum()"+param.getHmp_workexperience());
				System.out.println("Hmp_empnum()"+param.getHmp_workcontents());
				
				
				
				
				flag=humanService.insertMemberAppr(param);
			}catch(Exception e){
			System.out.println("에러발생!"+e);
		}
		return "../../default";
	}
	
	@RequestMapping(value = "/moveSignup", method = RequestMethod.POST)
	public String movePage(){
		logger.info("moveSignup 페이지 이동>>>>>>>>>>");
		
		return "/human/signup";
	}


	@RequestMapping(value="/login")
	public String login(@ModelAttribute MemberVO hmvo,
						HttpServletRequest request,
						Model model){
		logger.info("(log) login entered");
		logger.info(" id >>> " + hmvo.getHm_id());
		logger.info(" pass >>> " + hmvo.getHm_pw());
		
		
		List<MemberVO> aList = etcService.login(hmvo);
		int nCnt = aList.size();
		logger.info(" nCnt >>> " + nCnt);
		
		String message = "";
		String url = "../../index";
		LoginSession sManager = LoginSession.getInstance();
		
		if (nCnt == 1){
			MemberVO hmvo2 = aList.get(0);
			String hm_empnum = hmvo2.getHm_empnum();
			if (!sManager.isUsing(hm_empnum)){
				sManager.setSession(request.getSession(), hm_empnum);
				url = "../../default";
			}else{
				message = "이미 사용중인 아이디입니다.";
				model.addAttribute("message", message);
			}
		}else{ 
			message = "아이디 또는 패스워드가 잘못 되었습니다.";
			model.addAttribute("message", message);
		}
		
		logger.info("(log) login left");
		return url;
	}
	
	@RequestMapping(value="logout")
	public String logout(HttpServletRequest request,
						 Model model){
		logger.info("(log) logout entered");
		
		request.getSession().invalidate();
		String message = "로그아웃 했습니다.";
		model.addAttribute("message", message);
		String url = "commons/test";
		
		logger.info("(log) logout left");
		return url;
	}
	
	@RequestMapping(value="moveSession")
	public String moveSession(){
		return "commons/bindSession";
	}
}
