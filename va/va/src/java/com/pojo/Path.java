package com.pojo;
// Generated 14 Nov, 2017 2:59:22 PM by Hibernate Tools 4.3.1



/**
 * Path generated by hbm2java
 */
public class Path  implements java.io.Serializable {


     private Integer id;
     private int date;
     private String pathId;
     private int pathOrder;
     private String origin;
     private String destination;

    public Path() {
    }

    public Path(int date, String pathId, int pathOrder, String origin, String destination) {
       this.date = date;
       this.pathId = pathId;
       this.pathOrder = pathOrder;
       this.origin = origin;
       this.destination = destination;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public int getDate() {
        return this.date;
    }
    
    public void setDate(int date) {
        this.date = date;
    }
    public String getPathId() {
        return this.pathId;
    }
    
    public void setPathId(String pathId) {
        this.pathId = pathId;
    }
    public int getPathOrder() {
        return this.pathOrder;
    }
    
    public void setPathOrder(int pathOrder) {
        this.pathOrder = pathOrder;
    }
    public String getOrigin() {
        return this.origin;
    }
    
    public void setOrigin(String origin) {
        this.origin = origin;
    }
    public String getDestination() {
        return this.destination;
    }
    
    public void setDestination(String destination) {
        this.destination = destination;
    }




}


