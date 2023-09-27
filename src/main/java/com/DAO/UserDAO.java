package com.DAO;

import com.entity.User;

public interface UserDAO {
    public boolean userRegister(User us);
    public User login(String email,String password);
    public boolean checkPassword(int uid, String ps);
    public boolean updateProfile(User us ,String npass);
    public boolean checkUser(String email);

}
