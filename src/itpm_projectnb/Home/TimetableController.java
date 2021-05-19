/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package itpm_projectnb.Home;

import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.beans.property.ReadOnlyStringWrapper;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;


/**
 *
 * @author user
 */
public class TimetableController implements Initializable{
    
    @FXML
    private ComboBox<String> T_lecture;
    
    @FXML
    private Button btngen_tab2;

    @FXML
    private TableColumn<TimeTable,String> colSlot_2;

    @FXML
    private Button btngen_tab3;

    @FXML
    private TableColumn<TimeTable,String> colSlot_tab3;
    
    @FXML
    private Button btngen_tab1;
    
    @FXML
    private TableView<TimeTable> tbltime_3;
    
    @FXML
    private TableView<TimeTable> tbltime_2;
    
    @FXML
    private TableColumn<TimeTable, String> colmon;
    
    @FXML
    private TableColumn<TimeTable, String> colltue;

    @FXML
    private TableColumn<TimeTable, String> colwed;

    @FXML
    private TableColumn<TimeTable, String> colthur;

    @FXML
    private TableColumn<TimeTable, String> colfri;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
//     labelslot.setText(generateSlot().toString());
       displayLecturers();//fill combobox tab1
       
        
       
//           colmon.setCellValueFactory(cellData -> new ReadOnlyStringWrapper(getSession()));
           
    }
    
    @FXML
    private void handlebtnTimetable(ActionEvent event){
        
            if(event.getSource() == btngen_tab1){
                generateSlot();
              
            }
            else if(event.getSource() == btngen_tab2){
                generateSlot_2();
            }
            
            else if(event.getSource() == btngen_tab3){
                generateSlot_3();
            }
           
    }
    
    //lectures combobox
    public void displayLecturers(){
        
      conn = getConnection();
      try {
          ObservableList<String> leclist = FXCollections.observableArrayList();
          String sql="select name from lecturers";
          pst=conn.prepareStatement(sql);
          ResultSet rs = pst.executeQuery();
          
          while(rs.next()){
              leclist.add(rs.getString("name"));
          }
          T_lecture.setItems(leclist);
          
        } catch (SQLException ex) {
            Logger.getLogger(ManageNotAvailableTimesController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }  
    
    //variable declaration
    Connection conn;
    PreparedStatement pst;
    
    public Connection getConnection(){
    
        
        try{
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/itpm", "root","");
            return conn;
        }catch(Exception ex){
            System.out.println("Error: "+ex.getMessage());
            return null;
        }
    }
    
    @FXML
    private TableColumn<TimeTable,String> colSlot;
    
  
     @FXML
    private TableView<TimeTable> tbltime;
    
    String value = "";
    private String getStartTime(){
        
        conn = getConnection();
        
        String timeValue = "Select* from ws where id= '"+getID()+"'";
        try {
            pst=conn.prepareStatement(timeValue);
            ResultSet rs = pst.executeQuery();
          
          while(rs.next()){
              value = rs.getString(4);
          }
          
        } catch (SQLException ex) {
            Logger.getLogger(TimetableController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return value;
          
    }
    
    
    private int getSlotcount(){
        int slot = 0;
        conn = getConnection();
        
        String timeValue = "Select * from ws where id= '"+getID()+"'";
        try {
            pst=conn.prepareStatement(timeValue);
            ResultSet rs = pst.executeQuery();
          
          while(rs.next()){
              slot = rs.getInt(6);
          }
          
        } catch (SQLException ex) {
            Logger.getLogger(TimetableController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return slot;
          
    }
    
    private int getID(){
        int val = 0;
        conn = getConnection();
        
        String timeValue = "Select * from ws ";
        try {
            pst=conn.prepareStatement(timeValue);
            ResultSet rs = pst.executeQuery();
          
          while(rs.next()){
              val = rs.getInt(1);
          }
          
        } catch (SQLException ex) {
            Logger.getLogger(TimetableController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return val;
    }
    
    private int getInterval(){
        int val = 0;
        conn = getConnection();
        
        String sql = "Select * from ws where id= '"+getID()+"'";
        try {
            pst=conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
          
          while(rs.next()){
              val = rs.getInt(7);
          }
          
        } catch (SQLException ex) {
            Logger.getLogger(TimetableController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return val;
          
    }
    
    private String getSession(){
        String val = "";
        conn = getConnection();
        
        String sql = "Select * from sessions where Lecturer1 = '"+T_lecture.getValue()+"'";
        try {
            pst=conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
          
          while(rs.next()){
              val = rs.getString(12);
          }
          
        } catch (SQLException ex) {
            Logger.getLogger(TimetableController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return val;
    }
    
//    public ObservableList<TimeTable> getSession(){
//    
//        ObservableList<TimeTable> sesslist = FXCollections.observableArrayList();
//        conn = getConnection();
//        String query = "Select * from sessions where Lecturer1 = '"+T_lecture.getValue()+"'";
//        Statement st ;
//        ResultSet rs;
//        
//        try{
//        
//        st = conn.createStatement();
//        rs = st.executeQuery(query);
//        //sessions sess;
//        
//        while(rs.next()){
////            sess =  new sessions(rs.getInt("ID"),rs.getString("Lecturer1"),rs.getString("Lecturer2"),rs.getString("AdditionalLecturer1"),rs.getString("AdditionalLecturer2"),
////                    
////                    rs.getString("Tag"),rs.getString("GroupID"),rs.getString("SubjectCode"),rs.getString("Subject"),rs.getString("NoOfStudents"),rs.getString("Duration"),rs.getString("sessionID"));
////            sesslist.add(sess);
//
//           TimeTable e= new TimeTable(rs.getString(12));
//           sesslist.add(e);
//        }
//        }catch(Exception ex){
//        ex.printStackTrace();
//        
//        }
//        return sesslist;
//    }
    
    private String gettstart(){
        String val= "";
        conn = getConnection();
        
        String sql = "Select * from prefertime where sessionID = '"+getSession()+"'";
        try {
            pst=conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
          
          while(rs.next()){
              val = rs.getString(5);
          }
          
        } catch (SQLException ex) {
            Logger.getLogger(TimetableController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return val;
    }
    
    private String getpday(){
        String val= "";
        conn = getConnection();
        
        String sql = "Select * from prefertime where sessionID = '"+getSession()+"'";
        try {
            pst=conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
          
          while(rs.next()){
              val = rs.getString(3);
          }
          
        } catch (SQLException ex) {
            Logger.getLogger(TimetableController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return val;
    }
    
    //generate timeslot for tab1
    private void generateSlot(){    
        ObservableList<TimeTable> slotlist = FXCollections.observableArrayList();
       // ObservableList<TimeTable> sessionlist = getSession();
        String starttime = getStartTime();
        int slotcount = getSlotcount();

        SimpleDateFormat sdf= new SimpleDateFormat("HH:mm");

        try {

            Calendar startCalendar = Calendar.getInstance();
            startCalendar.setTime(sdf.parse(starttime));

            Calendar endCalendar = Calendar.getInstance();
            endCalendar.setTime(startCalendar.getTime());

            endCalendar.add(Calendar.HOUR_OF_DAY, 24 - startCalendar.get(Calendar.HOUR_OF_DAY));

            SimpleDateFormat slotTime = new SimpleDateFormat("hh:mma");
            
            TimeTable tslot;
            
                for (int i = 0; i < 9; i++) {
                
                String slotStartTime = slotTime.format(startCalendar.getTime());
                
                startCalendar.add(Calendar.MINUTE, slotcount);
                String slotEndTime = slotTime.format(startCalendar.getTime());
                
                String day = slotStartTime + " - " + slotEndTime;
                
                
                if(i == getInterval()){
                     day = "Interval";
                     tslot=new TimeTable(day);
                  
                 
               slotlist.add(tslot);
               colSlot.setCellValueFactory(new PropertyValueFactory<>("slot")); 
               
                }
                
                else{
               tslot=new TimeTable(day);
                  
               
               slotlist.add(tslot);
               colSlot.setCellValueFactory(new PropertyValueFactory<>("slot"));
              
               tbltime.setItems(slotlist);
                }
                }
               switch(colSlot.getCellData(1)){
                  case "08:30AM - 09:30AM":
                  {switch (getpday()) {
                        case "Monday":
                            colmon.setCellValueFactory(cellData -> new ReadOnlyStringWrapper(getSession()));
                            break;
                        case "Tuesday":
                            colltue.setCellValueFactory(cellData -> new ReadOnlyStringWrapper(getSession()));
                            break;
                        case "Wednesday":
                            colwed.setCellValueFactory(cellData -> new ReadOnlyStringWrapper(getSession()));
                            break;
                        case "Thursday":
                            colthur.setCellValueFactory(cellData -> new ReadOnlyStringWrapper(getSession()));
                            break;
                        case "Friday":
                            colfri.setCellValueFactory(cellData -> new ReadOnlyStringWrapper(getSession()));
                            break;
                    }};
              
              }
        } catch (Exception e) {
            
            e.printStackTrace();
        }
        
    }
    
    
    
    //generate time slot for tab2
     private void generateSlot_2(){    
        ObservableList<TimeTable> slotlist = FXCollections.observableArrayList();
       
        String starttime = getStartTime();
        int slotcount = getSlotcount();

        SimpleDateFormat sdf= new SimpleDateFormat("HH:mm");

        try {

            Calendar startCalendar = Calendar.getInstance();
            startCalendar.setTime(sdf.parse(starttime));

            Calendar endCalendar = Calendar.getInstance();
            endCalendar.setTime(startCalendar.getTime());

            endCalendar.add(Calendar.HOUR_OF_DAY, 24 - startCalendar.get(Calendar.HOUR_OF_DAY));

            SimpleDateFormat slotTime = new SimpleDateFormat("hh:mma");
            
            TimeTable tslot,lecsession;
            
                for (int i = 0; i < 9; i++) {
                String slotStartTime = slotTime.format(startCalendar.getTime());
                
                startCalendar.add(Calendar.MINUTE, slotcount);
                String slotEndTime = slotTime.format(startCalendar.getTime());

                String day = slotStartTime + " - " + slotEndTime;
                if(i == getInterval()){
                     day = "Interval";
                     tslot=new TimeTable(day);
                  
                 
               slotlist.add(tslot);
               colSlot_2.setCellValueFactory(new PropertyValueFactory<>("slot")); 

                }
                
                else{
               tslot=new TimeTable(day);
               
               slotlist.add(tslot);
               colSlot_2.setCellValueFactory(new PropertyValueFactory<>("slot")); 
               tbltime_2.setItems(slotlist);
                }
                }
           
        } catch (Exception e) {
            
            e.printStackTrace();
        }
    }
     
     //generate time slot for tab3
      private void generateSlot_3(){    
        ObservableList<TimeTable> slotlist = FXCollections.observableArrayList();
        String starttime = getStartTime();
        int slotcount = getSlotcount();
   

        SimpleDateFormat sdf= new SimpleDateFormat("HH:mm");

        try {

            Calendar startCalendar = Calendar.getInstance();
            startCalendar.setTime(sdf.parse(starttime));

            Calendar endCalendar = Calendar.getInstance();
            endCalendar.setTime(startCalendar.getTime());

            endCalendar.add(Calendar.HOUR_OF_DAY, 24 - startCalendar.get(Calendar.HOUR_OF_DAY));

            SimpleDateFormat slotTime = new SimpleDateFormat("hh:mma");
            
            TimeTable tslot;
            
                for (int i = 0; i < 9; i++) {
                String slotStartTime = slotTime.format(startCalendar.getTime());
    
                startCalendar.add(Calendar.MINUTE, slotcount);
                String slotEndTime = slotTime.format(startCalendar.getTime());

                String day = slotStartTime + " - " + slotEndTime;
                if(i == getInterval()){
                     day = "Interval";
                     tslot=new TimeTable(day);
                  
                 
               slotlist.add(tslot);
               colSlot_tab3.setCellValueFactory(new PropertyValueFactory<>("slot")); 
               
                }
                
                else{
               tslot=new TimeTable(day);
               slotlist.add(tslot);
               colSlot_tab3.setCellValueFactory(new PropertyValueFactory<>("slot")); 
               tbltime_3.setItems(slotlist);
                }
                }
            
        } catch (Exception e) {
          
            e.printStackTrace();
        }
        
    }
}
