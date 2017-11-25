/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.pojo.*;
import java.util.List;

/**
 *
 * @author Orling
 */
public interface DataDAO {
    public void addFlightDetail(FlightDetail fd);
    public void addPath(Path p);
    public List<FlightDetail> getFlightDetailMonth(int month);
    public List<Path> getPathMonth(int month);
    public void addAirport(Airports a);
    public void addAirline(Airlines a);
    public void addGephi(Gephi g);
    public List<Airports> getAllAirport();
    public List<Airlines> getAllAirlines();
    public Airports getAirport(String code);
    public Airlines getAirlines(String code);
    public List<Gephi> getGephi();
    public List<FlightDetail> getAllFlight();
    public List<FlightDetail> getDelays();
    public List<FlightDetail> getDelaysByMonth(int mon);
    public List<FlightDetail> getBarDelay(String airline, int mon);
   
    
    
}
