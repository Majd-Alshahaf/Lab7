package services;

import dataaccess.UserDB;
import models.User;
import java.util.*;
import models.Role;

public class UserService {
    public User get(String email) throws Exception {
        UserDB userdb = new UserDB();
        User user = userdb.get(email);
        return user;
    }
    
    public List<User> getAll() throws Exception {
        UserDB userdb = new UserDB();
        List<User> users = userdb.getAll();
        return users;
    }
    
    public void insert(String email, boolean active, String first_name, String last_name, String password, int role) throws Exception {
        User user = new User(email, active, first_name, last_name, password, role);
        UserDB userdb = new UserDB();
        userdb.insert(user);
    }
    
    public void update(User user) throws Exception {
        UserDB userdb = new UserDB();
        userdb.update(user);
    }
    
    public void delete(String email) throws Exception {
        UserDB userdb = new UserDB();
        userdb.delete(email);
    }
}