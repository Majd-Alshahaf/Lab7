package services;

import dataaccess.RoleDB;
import java.util.*;
import models.Role;

public class RoleService {
    public List<Role> getAll() throws Exception{
        RoleDB roleDB = new RoleDB();
        List<Role> roles = roleDB.getAll();
        return roles;
    }
}