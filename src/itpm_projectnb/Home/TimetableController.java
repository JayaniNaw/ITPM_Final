/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package itpm_projectnb.Home;

import helpers.DbConnect;
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
import javafx.collections.ObservableSet;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.print.Printer;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.Tab;
import javafx.scene.control.TabPane;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextArea;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;

/**
 *
 * @author user
 */
public class TimetableController implements Initializable {

    @FXML
    private ComboBox<String> T_lecture;

    @FXML
    private Button btngen_tab2;

    @FXML
    private TableColumn<TimeTable, String> colSlot_2;

    @FXML
    private Button btngen_tab3;

    @FXML
    private TableColumn<TimeTable, String> colSlot_tab3;

    @FXML
    private Button btngen_tab1;

    @FXML
    private TableView<TimeTable> tbltime_3;

    @FXML
    private TableView<TimeTable> tbltime_2;

    @FXML
    private TableColumn<TimeTable, String> colmon;

    String groups;
    String sessionID;
    String preferDay;
    String roomNumber;
    String sessionByLocation;
    String startT;
    String endT;
    String time;
    @FXML
    private ComboBox<String> ddGroup;
    @FXML
    private TableColumn<TimeTable, String> colMonday;
    @FXML
    private TableColumn<TimeTable, String> colTuesday;
    @FXML
    private TableColumn<TimeTable, String> colWednesday;
    @FXML
    private TableColumn<TimeTable, String> colFriday;
    @FXML
    private TableColumn<TimeTable, String> colThursday;
    @FXML
    private Button btnPrint;
    TextArea textArea = new TextArea();
    Connection conn = DbConnect.connectDB();
    PreparedStatement pst;

    /*PreparedStatement preState = null ;
    ResultSet rs = null;*/
    @Override
    public void initialize(URL location, ResourceBundle resources) {
//     labelslot.setText(generateSlot().toString());
        displayLecturers();//fill combobox tab1
        displayGroups();

    }

    @FXML
    private void handlebtnTimetable(ActionEvent event) {

        if (event.getSource() == btngen_tab1) {
            generateSlot();

        } else if (event.getSource() == btngen_tab2) {
            generateSlot_2();
            viewGroupSessions();
        } else if (event.getSource() == btngen_tab3) {
            generateSlot_3();
        } else if (event.getSource() == btnPrint) {
            ObservableSet<Printer> printer = Printer.getAllPrinters();
            for (Printer printers : printer) {
                textArea.appendText(printers.getName() + "\n");
            }
        }

    }

    //lectures combobox
    @FXML
    public void displayLecturers() {

        // conn = getConnection();
        try {
            ObservableList<String> leclist = FXCollections.observableArrayList();
            String sql = "select name from lecturers";
            pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                leclist.add(rs.getString("name"));
            }
            T_lecture.setItems(leclist);

        } catch (SQLException ex) {
            Logger.getLogger(ManageNotAvailableTimesController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    //variable declaration
    //Connection conn;
    //PreparedStatement pst;
    /*public Connection getConnection(){
    
        
        try{
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/itpm", "root","");
            return conn;
        }catch(Exception ex){
            System.out.println("Error: "+ex.getMessage());
            return null;
        }
    }*/
    @FXML
    private TableColumn<TimeTable, String> colSlot;

    @FXML
    private TableView<TimeTable> tbltime;

    String value = "";

    private String getStartTime() {

        //conn = getConnection();
        String timeValue = "Select* from ws where id= '" + getID() + "'";
        try {
            pst = conn.prepareStatement(timeValue);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                value = rs.getString(4);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TimetableController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return value;

    }

    private int getSlotcount() {
        int slot = 0;
        //conn = getConnection();

        String timeValue = "Select * from ws where id= '" + getID() + "'";
        try {
            pst = conn.prepareStatement(timeValue);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                slot = rs.getInt(6);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TimetableController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return slot;

    }

    private int getID() {
        int val = 0;
        //conn = getConnection();

        String timeValue = "Select * from ws ";
        try {
            pst = conn.prepareStatement(timeValue);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                val = rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TimetableController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return val;
    }

    private int getInterval() {
        int val = 0;
        //conn = getConnection();

        String sql = "Select * from ws where id= '" + getID() + "'";
        try {
            pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                val = rs.getInt(7);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TimetableController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return val;

    }

    private String getSession() {
        String val = "";
        //conn = getConnection();

        String sql = "Select * from sessions where Lecture1 = '" + T_lecture.getValue() + "'";
        try {
            pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                val = rs.getString(2);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TimetableController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return val;
    }

    private String gettstart() {
        String val = "";
        //conn = getConnection();

        String sql = "Select * from prefertime where sessionID = '" + getSession() + "'";
        try {
            pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                val = rs.getString(5);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TimetableController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return val;
    }

    //generate timeslot for tab1
    private void generateSlot() {
        ObservableList<TimeTable> slotlist = FXCollections.observableArrayList();
        String starttime = getStartTime();
        int slotcount = getSlotcount();

        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");

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
//                if(slotStartTime.equals(gettstart())){
//                    colmon.setCellValueFactory(value);
//                }
                startCalendar.add(Calendar.MINUTE, slotcount);
                String slotEndTime = slotTime.format(startCalendar.getTime());

                String day = slotStartTime + " - " + slotEndTime;
                if (i == getInterval()) {
                    day = "Interval";
                    tslot = new TimeTable(day);

                    slotlist.add(tslot);
                    colSlot.setCellValueFactory(new PropertyValueFactory<>("slot"));

                } else {
                    tslot = new TimeTable(day);

                    slotlist.add(tslot);
                    colSlot.setCellValueFactory(new PropertyValueFactory<>("slot"));
                    tbltime.setItems(slotlist);

                }

            }

        } catch (Exception e) {

            e.printStackTrace();
        }

    }

    @FXML
    public void displayGroups() {
        ObservableList<String> GroupList = FXCollections.observableArrayList();

        //conn = getConnection();
        try {
            String sql = "select GroupID from studentgroups";
            pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                GroupList.add(rs.getString("GroupID"));
            }
            ddGroup.setItems(GroupList);

        } catch (SQLException ex) {
            //Logger.getLogger(ManageNotAvailableTimesController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    //generate time slot for tab2
    private void generateSlot_2() {
        ObservableList<TimeTable> slotlist = FXCollections.observableArrayList();

        String starttime = getStartTime();
        int slotcount = getSlotcount();

        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");

        try {

            Calendar startCalendar = Calendar.getInstance();
            startCalendar.setTime(sdf.parse(starttime));

            Calendar endCalendar = Calendar.getInstance();
            endCalendar.setTime(startCalendar.getTime());

            endCalendar.add(Calendar.HOUR_OF_DAY, 24 - startCalendar.get(Calendar.HOUR_OF_DAY));

            SimpleDateFormat slotTime = new SimpleDateFormat("hh:mma");

            TimeTable tslot, lecsession;

            for (int i = 0; i < 9; i++) {
                String slotStartTime = slotTime.format(startCalendar.getTime());

                startCalendar.add(Calendar.MINUTE, slotcount);
                String slotEndTime = slotTime.format(startCalendar.getTime());

                String day = slotStartTime + " - " + slotEndTime;
                if (i == getInterval()) {
                    day = "Interval";
                    tslot = new TimeTable(day);

                    slotlist.add(tslot);
                    colSlot_2.setCellValueFactory(new PropertyValueFactory<>("slot"));

                } else {
                    tslot = new TimeTable(day);

                    slotlist.add(tslot);
                    colSlot_2.setCellValueFactory(new PropertyValueFactory<>("slot"));
                    //colMonday.setCellFactory(cellData -> new ReadOnlyStringWrapper(viewGroupSessions()));
                    tbltime_2.setItems(slotlist);

                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    //generate time slot for tab3
    private void generateSlot_3() {
        ObservableList<TimeTable> slotlist = FXCollections.observableArrayList();
        String starttime = getStartTime();
        int slotcount = getSlotcount();

        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");

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
                if (i == getInterval()) {
                    day = "Interval";
                    tslot = new TimeTable(day);

                    slotlist.add(tslot);
                    colSlot_tab3.setCellValueFactory(new PropertyValueFactory<>("slot"));

                } else {
                    tslot = new TimeTable(day);
                    slotlist.add(tslot);
                    colSlot_tab3.setCellValueFactory(new PropertyValueFactory<>("slot"));
                    tbltime_3.setItems(slotlist);
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

    }

    public ObservableList<TimeTable> generateGroupsTimetable() {
        ObservableList<TimeTable> sessionsList = FXCollections.observableArrayList();
        TimeTable session;
        String day1 = null;
        String day2 = null;
        String day3 = null;
        String day4 = null;
        String day5 = null;
        groups = ddGroup.getSelectionModel().getSelectedItem();

        String selectQuery = "SELECT  p.preferDay, p.startT, p.endT, p.sessionID FROM prefertime p INNER JOIN sessions s ON p.sessionID = s.sessionID where GroupID = '" + ddGroup.getValue() + "' ";

        try {
            // String sql="select preferDay from prefertime";
            pst = conn.prepareStatement(selectQuery);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                startT = rs.getTime("p.startT").toString();
                endT = rs.getTime("p.endT").toString();
                time = startT.substring(0, startT.length() - 3) + " - " + endT.substring(0, endT.length() - 3);
                sessionID = rs.getString("p.sessionID");

                preferDay = rs.getString("p.preferDay");
                sessionByLocation = sessionID + ", \n" + roomNumber;
                if (preferDay.equals("Monday")) {
                    day1 = sessionByLocation;
                }
                if (preferDay.equals("Tuesday")) {
                    day2 = sessionByLocation;
                }
                if (preferDay.equals("Wednesday")) {
                    day3 = sessionByLocation;
                }
                if (preferDay.equals("Thursday")) {
                    day4 = sessionByLocation;
                }
                if (preferDay.equals("Friday")) {
                    day5 = sessionByLocation;
                }

                session = new TimeTable(day1, day2, day3, day4, day5);
                sessionsList.add(session);

            }

        } catch (SQLException ex) {
            //Logger.getLogger(ManageNotAvailableTimesController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessionsList;
    }

    public void viewGroupSessions() {
        ObservableList<TimeTable> list = generateGroupsTimetable();
        colMonday.setCellValueFactory(new PropertyValueFactory("day1"));
        colTuesday.setCellValueFactory(new PropertyValueFactory("day2"));
        colWednesday.setCellValueFactory(new PropertyValueFactory("day3"));
        colThursday.setCellValueFactory(new PropertyValueFactory("day4"));
        colFriday.setCellValueFactory(new PropertyValueFactory("day5"));
        tbltime_2.setItems(list);

    }
    /* private void wtf(MouseEvent event) {
      if( getLecStdLoc.getSelectionModel().getSelectedItem().equals(locationTab))
      {
          displayLocations();
      }
      else if( getLecStdLoc.getSelectionModel().getSelectedItem().equals(lecturersTab))
      {
          displayLecturers();
      }else if(){
      
      }
    }*/
}
