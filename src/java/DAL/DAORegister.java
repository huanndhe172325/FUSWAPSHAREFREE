/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.User;
/**
 *
 * @author admin
 */
public class DAORegister extends DBContext{
    public void insertAccount(String user, String pass){
        try{
            String sql = "INSERT INTO [User]\n"
                    + " ([UserID]\n"
                    + ",[Email]\n"
                    +",[Phone]\n"
                    +",[AvatarUrl]\n"
                    +",[PassWord]\n"
                    +",[JoidDate]\n"
                    +",[UserName]\n"
                    +",[Full_Name]\n"
                    +",[District]\n"
                    +",[Commune]\n"
                    +",[StreetNumber]\n"
                    +",[Point]\n"
                    +",[RoleID]\n"
                    +",[StatusID]"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           (?\n"
                    + "           ,1\n"
                    + "           ,1\n";
             PreparedStatement stm = connect.prepareStatement(sql);
            stm.setString(1, user);
            stm.setString(2, pass);
            stm.executeUpdate();
        }catch (SQLException ex) {
            Logger.getLogger(DAORegister.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    public User checkAccountExist(String user) {
        try {
            String sql = "SELECT * FROM Account where [user] = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setString(1, user);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                 User u = new User();
                u.setUserID(rs.getInt(1));
                u.setEmail(rs.getString(2));
                u.setPhone(rs.getString(3));
                u.setAvatarURL(rs.getString(4));
                u.setPassWord(rs.getString(5));
                u.setJoinDate(rs.getString(6));
                u.setUserName(rs.getString(7));
                u.setFull_Name(rs.getString(8));
                u.setDistrict(rs.getString(9));
                u.setCommune(rs.getString(10));
                u.setStreetNumber(rs.getString(11));
                u.setPoint(rs.getInt(12));
                u.setRoleID(rs.getInt(13));
                u.setStatusID(rs.getInt(14));
                return u;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOLoginSystem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
