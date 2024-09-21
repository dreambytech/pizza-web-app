package com.bean;

import java.sql.ResultSet;
import java.util.List;

public class User {

    private String username;
    private String useremail;
    private String userpassword;
    private String usercontactno;
    private String userstatus1;
    private String userstatus2;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUseremail() {
        return useremail;
    }

    public void setUseremail(String useremail) {
        this.useremail = useremail;
    }

    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }

    public String getUsercontactno() {
        return usercontactno;
    }

    public void setUsercontactno(String usercontactno) {
        this.usercontactno = usercontactno;
    }

    public String getUserstatus1() {
        return userstatus1;
    }

    public void setUserstatus1(String userstatus1) {
        this.userstatus1 = userstatus1;
    }

    public String getUserstatus2() {
        return userstatus2;
    }

    public void setUserstatus2(String userstatus2) {
        this.userstatus2 = userstatus2;
    }

    public boolean signUp() {
        DataBase up = new DataBase();
        boolean result = up.update("insert into pizzauser values('" + username + "','" + useremail + "','" + userpassword + "','" + usercontactno + "','" + userstatus1 + "','" + userstatus2 + "')");
        return result;
    }

    public boolean signIn() {
        DataBase in = new DataBase();
        ResultSet result = in.read("select * from pizzauser where useremail='" + useremail + "' and userpassword='" + userpassword + "' and userstatus1=userstatus2");
        try {
            if (result.next()) {
                this.username = result.getString(1);
                this.useremail = result.getString(2);
                this.usercontactno = result.getString(4);
                this.userstatus1=result.getString(5);
                this.userstatus2=result.getString(6);
                
                return true;
            }
        }
        catch(Exception e){}
        return false;
    }

}
