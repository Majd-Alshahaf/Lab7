<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Users</title>
    </head>
    <body>
        <div>
            <form method="post" action="">
                <h3>Add User</h3>
                <input type="text" name="email" placeholder="Email" value="">
                <br>
                <label>Active</label>
                <input type="checkbox" name="active" value="true">
                <br>
                <input type="text" name="first_name" placeholder="First Name" value="">
                <br>
                <input type="text" name="last_name" placeholder="Last Name" value="">
                <br>
                <input type="password" name="password" placeholder="Password" value="" required>
                <br>
                <select name="roles_id">
                    <c:forEach items="${roles}" var="roles">
                        <option value="${roles.role_id}">${roles.role_name}</option>
                    </c:forEach>
                </select>
                <br>
                <input type="submit" value="Save">
                <input type="hidden" name="action" value="add">
            </form>
        </div>
           
        <div>
            <h2>Manage Users</h2>
            <table>
                <tr>
                    <th>Email</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Role</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            <c:forEach items="${users}" var="users">
                <tr>
                    <td>${users.email}</td>
                    <td>${users.first_name}</td>
                    <td>${users.last_name}</td>
                    <td>${users.role}</td>
                    
                    <c:url value="user" var="editEmail">
                        <c:param name="action" value="edit"/>
                        <c:param name="email" value="${users.email}"/>
                    </c:url>
                    <td><a href="${editEmail}">Edit</a></td>
                    
                    <c:url value="user" var="deleteEmail">
                        <c:param name="action" value="delete"/>
                        <c:param name="email" value="${users.email}"/>
                    </c:url>
                    <td><a href="${deleteEmail}">Delete</a></td>
                </tr>
            </c:forEach>
            </table>
        </div>
            
        <div>
            <form method="post" action="user">
                <h3>Edit User</h3>
                <input type="text" name="email" placeholder="Email" value="${editUser.email}">
                <br>
                <input type="text" name="first_name" placeholder="First Name" value="${editUser.first_name}">
                <br>
                <input type="text" name="last_name" placeholder="Last Name" value="${editUser.last_name}">
                <br>
                <input type="password" name="password" value="${editUser.password}">
                <br>
                <select name="roles_id">
                    <c:forEach items="${roles}" var="roles">
                        <option value="${roles.role_id}">${roles.role_name}</option>
                    </c:forEach>
                </select>
                <br>
                <input type="submit" value="Update">
                <input type="hidden" name="action" value="edit">
                
                <input type="hidden" name="active" value="true">
            </form>
        </div>
    </body>
</html>