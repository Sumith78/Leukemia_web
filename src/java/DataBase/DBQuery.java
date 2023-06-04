/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DataBase;

import Logic.DifferenceExample;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBQuery {

    Connection con = null;
    ResultSet rs = null;
    Statement st = null;

     public int add_user(String name, String email,String mobile, String dob, String gender, String password) throws ClassNotFoundException, SQLException {
        int i = 0;
        String q = "insert into user_details values ( '"+name+"','" + email + "','" + mobile + "','" + dob + "','" + gender + "','" + password + "' )";
         System.out.println(q);
        con = DBConnection.getConnection();
        st = con.createStatement();
        i = st.executeUpdate(q);
    
        
        return i;
    }
     
     
    public int loginInfo(String email, String password) throws ClassNotFoundException, SQLException {

        int i=0;
        con = DBConnection.getConnection();
        st = con.createStatement();
        String q = "select * from user_details where email='" + email + "' and password='" + password + "'";
        
        System.out.println("q = " + q);
        rs = st.executeQuery(q);

        if (rs.next()) {

           i=1;
        }//jhvhjvh

        return i;
    }



 
     public int add_report(String equipment_name, String equipment_description, String rfid_tag,String manufacturer, String vendor, String date_of_manufacturing, String date_of_introduction, String date_of_expiry,String status) throws ClassNotFoundException, SQLException {
        int i = 0;
        String q = "insert into equipment_details set equipment_name='" + equipment_name + "',equipment_description='" + equipment_description + "',rfid_tag='" + rfid_tag + "',status='" + status + "',manufacturer='" + manufacturer + "',vendor='" + vendor + "',date_of_manufacturing='" + date_of_manufacturing + "',date_of_introduction='" + date_of_introduction + "',date_of_expiry='" + date_of_expiry + "' ";
        con = DBConnection.getConnection();
        st = con.createStatement();
        i = st.executeUpdate(q);
        String q1="select MAX(eid) from equipment_details";
        rs=st.executeQuery(q1);
        if(rs.next())
        {
        i=rs.getInt(1);
        }
        
        return i;
    }
     
    
     
     public ArrayList  get_user_details(String email) throws ClassNotFoundException, SQLException {
        ArrayList al=new ArrayList();
        String q = "select * from user_details where  email='" + email + "' ";
        System.out.println(q);
        con = DBConnection.getConnection();
        st = con.createStatement();
        rs=st.executeQuery(q);
        if(rs.next())
        {
        
        al.add(rs.getString("name"));
        al.add(rs.getString("email"));
        al.add(rs.getString("mobile"));
        al.add(rs.getString("dob"));
        al.add(rs.getString("gender"));
//        al.add(rs.getString("address"));
      
        }
        
      
        return al;
    }
     
}
