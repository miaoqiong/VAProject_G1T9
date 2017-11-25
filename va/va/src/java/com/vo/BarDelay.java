/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vo;

/**
 *
 * @author Orling
 */
public class BarDelay {
    private String airline;
    private double avgDelay;
    private int totalDelay;

    public BarDelay(String airline, double avgDelay, int totalDelay) {
        this.airline = airline;
        this.avgDelay = avgDelay;
        this.totalDelay = totalDelay;
    }

    public String getAirline() {
        return airline;
    }

    public double getAvgDelay() {
        return avgDelay;
    }

    public int getTotalDelay() {
        return totalDelay;
    }

    public void setAirline(String airline) {
        this.airline = airline;
    }

    public void setAvgDelay(double avgDelay) {
        this.avgDelay = avgDelay;
    }

    public void setTotalDelay(int totalDelay) {
        this.totalDelay = totalDelay;
    }
    public String print(){
        return airline+","+avgDelay+","+totalDelay;
    }
    
            
}
