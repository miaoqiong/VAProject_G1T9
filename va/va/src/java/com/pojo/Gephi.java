package com.pojo;
// Generated 14 Nov, 2017 3:27:50 PM by Hibernate Tools 4.3.1



/**
 * Gephi generated by hbm2java
 */
public class Gephi  implements java.io.Serializable {


     private Integer id;
     private String iataCode;
     private String airport;
     private String city;
     private String state;
     private String country;
     private long latitude;
     private long longitude;
     private int indegree;
     private int outdegree;
     private int degree;
     private int eccentricity;
     private long closnesscentrality;
     private long harmonicclosnesscentrality;
     private long betweenesscentrality;

    public Gephi() {
    }

    public Gephi(String iataCode, String airport, String city, String state, String country, long latitude, long longitude, int indegree, int outdegree, int degree, int eccentricity, long closnesscentrality, long harmonicclosnesscentrality, long betweenesscentrality) {
       this.iataCode = iataCode;
       this.airport = airport;
       this.city = city;
       this.state = state;
       this.country = country;
       this.latitude = latitude;
       this.longitude = longitude;
       this.indegree = indegree;
       this.outdegree = outdegree;
       this.degree = degree;
       this.eccentricity = eccentricity;
       this.closnesscentrality = closnesscentrality;
       this.harmonicclosnesscentrality = harmonicclosnesscentrality;
       this.betweenesscentrality = betweenesscentrality;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getIataCode() {
        return this.iataCode;
    }
    
    public void setIataCode(String iataCode) {
        this.iataCode = iataCode;
    }
    public String getAirport() {
        return this.airport;
    }
    
    public void setAirport(String airport) {
        this.airport = airport;
    }
    public String getCity() {
        return this.city;
    }
    
    public void setCity(String city) {
        this.city = city;
    }
    public String getState() {
        return this.state;
    }
    
    public void setState(String state) {
        this.state = state;
    }
    public String getCountry() {
        return this.country;
    }
    
    public void setCountry(String country) {
        this.country = country;
    }
    public long getLatitude() {
        return this.latitude;
    }
    
    public void setLatitude(long latitude) {
        this.latitude = latitude;
    }
    public long getLongitude() {
        return this.longitude;
    }
    
    public void setLongitude(long longitude) {
        this.longitude = longitude;
    }
    public int getIndegree() {
        return this.indegree;
    }
    
    public void setIndegree(int indegree) {
        this.indegree = indegree;
    }
    public int getOutdegree() {
        return this.outdegree;
    }
    
    public void setOutdegree(int outdegree) {
        this.outdegree = outdegree;
    }
    public int getDegree() {
        return this.degree;
    }
    
    public void setDegree(int degree) {
        this.degree = degree;
    }
    public int getEccentricity() {
        return this.eccentricity;
    }
    
    public void setEccentricity(int eccentricity) {
        this.eccentricity = eccentricity;
    }
    public long getClosnesscentrality() {
        return this.closnesscentrality;
    }
    
    public void setClosnesscentrality(long closnesscentrality) {
        this.closnesscentrality = closnesscentrality;
    }
    public long getHarmonicclosnesscentrality() {
        return this.harmonicclosnesscentrality;
    }
    
    public void setHarmonicclosnesscentrality(long harmonicclosnesscentrality) {
        this.harmonicclosnesscentrality = harmonicclosnesscentrality;
    }
    public long getBetweenesscentrality() {
        return this.betweenesscentrality;
    }
    
    public void setBetweenesscentrality(long betweenesscentrality) {
        this.betweenesscentrality = betweenesscentrality;
    }




}

