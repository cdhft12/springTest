package java142.todak.human.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java142.todak.etc.controller.EtcController;
import java142.todak.human.dao.HumanDao;
import java142.todak.human.vo.ApprVO;
import java142.todak.human.vo.ApptVO;
import java142.todak.human.vo.CommVO;
import java142.todak.human.vo.MemberVO;

@Service
@Transactional
public class HumanServiceImpl implements HumanService {
	Logger logger = Logger.getLogger(EtcController.class);
	@Autowired
	private HumanDao humanDao;
	@Override
	public ApprVO chaebunMemberAppr() {
		// TODO Auto-generated method stub
		ApprVO hvo=humanDao.chaebunMemberAppr();
		return hvo;
	}
	@Override
	public String chaebunMember(){
		String Chaenum=humanDao.chaebunMember();
		return Chaenum;
	}
	@Override
	public String chaebunApptRecord(){
		String Chaenum=humanDao.chaebunApptRecord();
		return Chaenum;
	}
	@Override
	public boolean insertMemberAppr(ApprVO avo){
		boolean flag=false;
		logger.info("인서트 플래그 >>>>>"+flag);
		
		
		int cnt=humanDao.insertMemberAppr(avo);
		if(cnt!=0){
			flag=true;
		}
		logger.info("인서트 플래그 >>>>>"+flag);
		return flag;
	}
	
	@Override
	public boolean insertMember(MemberVO mvo){
		boolean flag=false;
		logger.info("인서트 플래그 >>>>>"+flag);
		
		
		int cnt=humanDao.insertMember(mvo);
		if(cnt!=0){
			flag=true;
		}
		logger.info("인서트 플래그 >>>>>"+flag);
		return flag;
	}
	@Override
	public boolean refusedMemberAppr(ApprVO avo){
		boolean flag=false;
		logger.info("인서트 플래그 >>>>>"+flag);
		
		
		int cnt=humanDao.refusedMemberAppr(avo);
		if(cnt!=0){
			flag=true;
		}
		logger.info("인서트 플래그 >>>>>"+flag);
		return flag;
	}
	@Override
	public boolean acceptedMemberAppr(ApprVO avo){
		boolean flag=false;
		logger.info("인서트 플래그 >>>>>"+flag);
		
		
		int cnt=humanDao.refusedMemberAppr(avo);
		if(cnt!=0){
			flag=true;
		}
		logger.info("인서트 플래그 >>>>>"+flag);
		return flag;
	}
	@Override
	public boolean updateMember(MemberVO mvo){
		boolean flag=false;
		logger.info("인서트 플래그 >>>>>"+flag);
		
		
		int cnt=humanDao.updateMember(mvo);
		if(cnt!=0){
			flag=true;
		}
		logger.info("인서트 플래그 >>>>>"+flag);
		return flag;
	}
	@Override
	public boolean insertApptRecord(ApptVO apvo){
		boolean flag=false;
		logger.info("인서트 플래그 >>>>>"+flag);
		
		
		int cnt=humanDao.insertApptRecord(apvo);
		if(cnt!=0){
			flag=true;
		}
		logger.info("인서트 플래그 >>>>>"+flag);
		return flag;
	}
	@Override
	public List<MemberVO> selectMember(MemberVO mvo){
		List<MemberVO> memberList=null;
		memberList=humanDao.selectMember(mvo);
		return memberList;
	}
	@Override
	public List<ApptVO> apptRecordSelect(ApptVO apvo){
		List<ApptVO> apptList=null;
		apptList=humanDao.apptRecordSelect(apvo);
		return apptList;
	}
	@Override
	public List<MemberVO> selectPersonAppt(MemberVO mvo){
		List<MemberVO> memberList=null;
		memberList=humanDao.selectPersonAppt(mvo);
		return memberList;
	}
	@Override
	public List<CommVO> selectCommute(CommVO cvo){
		List<CommVO> memberList=null;
		memberList=humanDao.selectCommute(cvo);
		return memberList;
	}
	@Override
	public String selectTotal(MemberVO mvo){
		return humanDao.selectTotal(mvo);
	}
	@Override
	public MemberVO memberInfo(MemberVO mvo){
		return humanDao.memberInfo(mvo);
	}
	@Override
	public MemberVO selectPosition(MemberVO mvo){
		MemberVO pvo=null;
		pvo=humanDao.selectPosition(mvo);
		return pvo;
	}
	@Override
	public List<MemberVO> selectDeptMem(MemberVO mvo){
		List<MemberVO> memberList=null;
		memberList=humanDao.selectDeptMem(mvo);
		return memberList;
	}
	@Override
	public List<MemberVO> selectAllMem(MemberVO mvo){
		List<MemberVO> memberList=null;
		memberList=humanDao.selectAllMem(mvo);
		return memberList;
	}
	@Override
	public List<ApprVO> selectAppr(ApprVO avo){
		List<ApprVO> apprList=null;
		apprList=humanDao.selectAppr(avo);
		return apprList;
	}
	@Override
	public ApprVO selectApprMem(ApprVO avo){
		avo=humanDao.selectApprMem(avo);
		return avo;
	}
}
