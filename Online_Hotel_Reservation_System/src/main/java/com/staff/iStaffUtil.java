package com.staff;

import java.util.List;
import com.Room.Room;
import com.user.User;

public interface iStaffUtil {

    // Staff-related methods
    List<Staff> validateStaff(String userName, String password);
    List<Integer> getNumberofObjectsAdmin();
    List<Staff> getStaffOverview();
    List<Staff> getAllStaff();
    List<Staff> getSingleStaff(int id);
    boolean updateStaffDetails(int id, String name, String username, String email, String password, String role);
    boolean deleteStaff(int id);
    boolean insertStaffDetails(String name, String userName, String email, String password, String role);
    boolean checkUsername(String username);

    // User-related methods
    List<User> getUserOverview();
    List<User> getAllUsers();
    List<User> getSingleUser(int id);
    boolean updateUserDetails(int id, String name, String username, String email, String password);
    boolean deleteUser(int id);

    // Room-related methods
    List<Room> getRoomOverview();

   
}
