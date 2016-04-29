package demo;

import entity.User;

public interface UserDao {
	//根据用户进行查找，返回用户列表
	public boolean findUser(User user);
}
