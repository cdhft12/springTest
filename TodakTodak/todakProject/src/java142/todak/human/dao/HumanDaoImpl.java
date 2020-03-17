package java142.todak.human.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java142.todak.human.controller.HumanController;
import java142.todak.human.vo.ApprVO;
import java142.todak.human.vo.ApptVO;
import java142.todak.human.vo.CommVO;
import java142.todak.human.vo.MemberVO;

@Repository
public class HumanDaoImpl implements HumanDao {
//	public class HumanDaoImpl extends SqlSessionDaoSupport implements HumanDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public ApprVO chaebunMemberAppr() {
		// TODO Auto-generated method stub
		return session.selectOne("chaebunMemberAppr");
//		return getSqlSession().selectOne("HumanMemberApprovalVO");
	}
	@Override
	public String chaebunMember(){
		return session.selectOne("chaebunMember");
	}
	@Override
	public String chaebunApptRecord(){
		return session.selectOne("chaebunApptRecord");
	}
	@Override
	public int insertMemberAppr(ApprVO avo) {
		// TODO Auto-generated method stub
		
		return (int)session.insert("insertMemberAppr");
	}
	@Override
	public int insertMember(MemberVO mvo){
		return (int)session.insert("insertMember");
	}
	@Override
	public int refusedMemberAppr(ApprVO avo){
		return (int)session.insert("refusedMemberAppr");
	}
	@Override
	public int acceptedMemberAppr(ApprVO avo){
		return (int)session.insert("acceptedMemberAppr");
	}
	@Override
	public int insertApptRecord(ApptVO avo){
		return (int)session.insert("insertApptRecord");
	}
	@Override
	public int updateMember(MemberVO mvo){
		return (int)session.update("updateMember");
	}
	@Override
	public List<MemberVO> selectMember(MemberVO mvo){
		return session.selectList("selectMember");
	}
	@Override
	public List<MemberVO> selectPersonAppt(MemberVO mvo){
		return session.selectList("selectPersonAppt");
	}
	@Override
	public List<ApptVO> apptRecordSelect(ApptVO apvo){
		return session.selectList("apptRecordSelect");
	}
	@Override
	public List<CommVO> selectCommute(CommVO cvo){
		return session.selectList("selectCommute");
	}
	@Override
	public String selectTotal(MemberVO mvo){
		return session.selectOne("selectTotal");
	}
	@Override
	public MemberVO memberInfo(MemberVO mvo){
		return session.selectOne("memberInfo");
	}
	@Override
	public MemberVO selectPosition(MemberVO mvo){
		return session.selectOne("selectPosition");
	}
	@Override
	public List<MemberVO> selectDeptMem(MemberVO mvo){
		return session.selectList("selectDeptMem");
	}
	@Override
	public List<MemberVO> selectAllMem(MemberVO mvo){
		return session.selectList("selectAllMem");
	}
	@Override
	public List<ApprVO> selectAppr(ApprVO avo){
		return session.selectList("selectAppr");
	}
	@Override
	public ApprVO selectApprMem(ApprVO avo){
		return session.selectOne("selectApprMem");
	}
}
