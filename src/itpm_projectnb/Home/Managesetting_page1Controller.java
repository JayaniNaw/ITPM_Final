/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package itpm_projectnb.Home;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

/**
 * FXML Controller class
 *
 * @author user
 */
public class Managesetting_page1Controller implements Initializable {

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    
    @FXML
    private void handlebtnnotavailable(ActionEvent event) throws IOException {
           Parent root = FXMLLoader.load(getClass().getResource("ManageNotAvailableTimes.fxml"));//new fxml for a new window
           
        Stage stage = new Stage();//object for a new window
        stage.setTitle("Manage Not Available Settings");
        stage.setScene(new Scene(root, 1200, 662));
        //specifies modality for a new window
        
        //application_modal means you cannot interact with either window until this new window is closed.
       stage.initModality(Modality.APPLICATION_MODAL);//default is none
//       stage.initOwner(btnwshedule.getScene().getWindow());
//        stage.resizableProperty().setValue(Boolean.FALSE);
         stage.initStyle(StageStyle.UTILITY);//hides minimize and maximize
        stage.show();
        
    }
    
}
