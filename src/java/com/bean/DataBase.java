package com.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import oracle.jdbc.OracleStatement;

public class DataBase {

    public boolean update(String query) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "manager");
            Statement stmt = con.createStatement();
            int x = stmt.executeUpdate(query);
            if (x > 0) {
                return true;
            } else {
                return false;
            }

        } catch (Exception e) {
        }
        return false;
    }

    public ResultSet read(String query) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "manager");
            Statement stmt = con.createStatement();
            ResultSet x = stmt.executeQuery(query);
            return x;

        } catch (Exception e) {
        }

        return null;
    }
}
