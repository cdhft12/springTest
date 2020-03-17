package java142.todak.etc.utils;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingListener;
import javax.servlet.http.HttpSessionBindingEvent;
import java.util.Hashtable;
import java.util.Enumeration;

public class LoginSession implements HttpSessionBindingListener{
	
	private static LoginSession sManager = null;
	
	// ����� id�� ������ �� Hashtable
	private static Hashtable hashManager = new Hashtable();
	
	// ������
	private LoginSession(){
		super();
	}
	
	/**
	*
	*	�̱��� ��� 
	*
	*/
	public static synchronized LoginSession getInstance(){
		
		if(sManager == null){
			sManager = new LoginSession();
		}
		
		return sManager;
	}
	
	// �ش� ���ǿ��� �̹� �α����� �ߴ��� Ȯ�� 
	// ���Ǿ��̵� �޾Ƽ� �ش� ������ �α��� �����̸� true��, �ƴϸ� false�� ����.
	public boolean isLogin(String sessionID){
		
		boolean isLogin = false;
		
		Enumeration e = hashManager.keys();
		String key = "";
		
		while(e.hasMoreElements()){
			
			key = (String)e.nextElement();
			
			if (sessionID.equals(key)){
				isLogin = true;
			}
		}
		
		return isLogin;
	}
	
	// �ش� ���̵��� ���� ����� �������� 
	// �̹� ������� ���̵����� Ȯ��
	// �������̵� �޾Ƽ� �ش� ������ ������ ��� ���̸� true, �ƴϸ� false�� ����.
	public boolean isUsing(String userNum)
	{
		boolean isFlag = false;
		
		Enumeration e = hashManager.keys();
		String key = "";
		
		while(e.hasMoreElements()){
			
			key = (String)e.nextElement();
			
			if (userNum.equals(hashManager.get(key))){
				isFlag = true;
			}
		}
		
		return isFlag;
	}
	
	// Hashtable�� ���Ǿ��̵� �������̵� ¦���� �ֱ�.
	//   ==> ���Ǿ��̵�� �������̵� ã�� �� �ְ���.
	// Hashtable�� ���ǿ� �ֱ�
	//   ==> ������ ���� Hashtable�� ������ �� �ְ���.
	public void setSession(HttpSession hSession, String userNum)
	{
		hashManager.put(hSession.getId(), userNum);
		hSession.setAttribute("login", this.getInstance());
	}
	
	// ������ �����Ǿ��� �� �ڵ����� ȣ��Ǵ� �޼ҵ�
	public void valueBound(HttpSessionBindingEvent event)
	{
		// nothing
	}
	
	// ������ ������ �� �ڵ����� ȣ��Ǵ� �޼ҵ�
	// ������ �������� Hashtable���� �ش� ������ ������ �����Ѵ�.
	public void valueUnbound(HttpSessionBindingEvent event)
	{
		hashManager.remove(event.getSession().getId());
	}
	
	// ���� ID�� ���� �α����� ID�� ������ ��
	public String getUserID(String sessionID)
	{
		return (String)hashManager.get(sessionID);
	}
	
	// ���� ������ ��
	public int getUserCount()
	{
		return hashManager.size();
	}
}
