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
public class StarPlotVO {

    private String airline;
    private int airSystemDelay;
    private int securityDelay;
    private int airlineDelay;
    private int lateAircraftDelay;
    private int weatherDelay;

    public StarPlotVO(String airline, int airSystemDelay, int securityDelay, int airlineDelay, int lateAircraftDelay, int weatherDelay) {
        this.airline = airline;
        this.airSystemDelay = airSystemDelay;
        this.securityDelay = securityDelay;
        this.airlineDelay = airlineDelay;
        this.lateAircraftDelay = lateAircraftDelay;
        this.weatherDelay = weatherDelay;
    }
    public StarPlotVO(String airline) {
        this.airline = airline;
        this.airSystemDelay = 0;
        this.securityDelay = 0;
        this.airlineDelay = 0;
        this.lateAircraftDelay = 0;
        this.weatherDelay = 0;
    }

    public String getAirline() {
        return airline;
    }

    public int getAirSystemDelay() {
        return airSystemDelay;
    }

    public int getSecurityDelay() {
        return securityDelay;
    }

    public int getAirlineDelay() {
        return airlineDelay;
    }

    public int getLateAircraftDelay() {
        return lateAircraftDelay;
    }

    public int getWeatherDelay() {
        return weatherDelay;
    }

    public void setAirline(String airline) {
        this.airline = airline;
    }

    public void setAirSystemDelay(int airSystemDelay) {
        this.airSystemDelay = airSystemDelay;
    }

    public void setSecurityDelay(int securityDelay) {
        this.securityDelay = securityDelay;
    }

    public void setAirlineDelay(int airlineDelay) {
        this.airlineDelay = airlineDelay;
    }

    public void setLateAircraftDelay(int lateAircraftDelay) {
        this.lateAircraftDelay = lateAircraftDelay;
    }

    public void setWeatherDelay(int weatherDelay) {
        this.weatherDelay = weatherDelay;
    }
    public void addAirSystemDelay(int airSystemDelay) {
        this.airSystemDelay += airSystemDelay;
    }

    public void addSecurityDelay(int securityDelay) {
        this.securityDelay += securityDelay;
    }

    public void addAirlineDelay(int airlineDelay) {
        this.airlineDelay += airlineDelay;
    }

    public void addLateAircraftDelay(int lateAircraftDelay) {
        this.lateAircraftDelay += lateAircraftDelay;
    }

    public void addWeatherDelay(int weatherDelay) {
        this.weatherDelay += weatherDelay;
    }
    public String printing(){
        return airline+","+this.airSystemDelay+","+this.securityDelay+","+this.airlineDelay+","+this.lateAircraftDelay+","+this.weatherDelay;
    }
    public String printNo(){
        return airSystemDelay+","+securityDelay+","+airlineDelay+","+lateAircraftDelay+","+weatherDelay;
    }
}
