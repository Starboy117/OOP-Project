package com.user;

import java.util.List;

public interface IUserDBUtil {
    List<User> validateUser(String userName, String password);
    boolean checkUsername(String username);
    boolean insertUserDetails(String name, String userName, String email, String password);
    boolean updateUserDetails(int id, String name, String username, String email);
    boolean changedPasswordUpdate(int id, String password);
}
