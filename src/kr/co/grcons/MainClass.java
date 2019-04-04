package kr.co.grcons;

import kr.co.grcons.control.UserController;
import kr.co.grcons.vo.Users;

public class MainClass {

	public static void main(String[] args) {
		UserController userCon = new UserController();
		// userCon.insert(new Users());
		Users user = Users.newInstance();
		user.setLogin("admin");
		user.setPassword("2449QWQW!!");
		Users result = userCon.login(user);
		
		if(result!=null) {
			System.out.println("login success " + result.toString());
		}
	}

}
