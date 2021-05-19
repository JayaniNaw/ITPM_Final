/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package itpm_projectnb.Home;

/**
 *
 * @author user
 */
public class TimeTable {
    
    private String slot;
    private String day1;
  

    public TimeTable(String slot,String day1) {
        this.slot = slot;
        this.day1 = day1;
        
    }
    
 
    public TimeTable(String slot) {
        
        this.slot = slot;
    }
    
    public String getSlot() {
        return slot;
    }

    public String getDay1() {
        return day1;
    }
    
    
}
