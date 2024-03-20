/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class DAOView extends DBContext {

    //doc cac bang ghi tu table
    public int getView() {
        String sql = "select * from CountView";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("viewed");
            }
        } catch (SQLException e) {
            System.out.println("e");
        }
        return 0;
    }

    public void IncreateView() {
        try {
            String sql = "update CountView\n"
                    + "set viewed = viewed + 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();
        } catch (SQLException ex) {
            
        }
    }
//    public static void main(String[] args) {
//        DatabaseAccessObject object= new DatabaseAccessObject();
//        List<Product> list = object.getAll();
//        for(Product iProduct:list)
//        {
//            System.out.println(iProduct.getId());
//        }
//    }
}
