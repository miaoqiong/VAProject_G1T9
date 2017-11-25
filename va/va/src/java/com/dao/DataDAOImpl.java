/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.pojo.Airlines;
import com.pojo.Airports;
import com.pojo.FlightDetail;
import com.pojo.Gephi;
import com.pojo.Path;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Restrictions;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Orling
 */
public class DataDAOImpl extends BaseDAO implements DataDAO {

    private SessionFactory sessionFactory;

    public DataDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
        super.setSessionFactory(sessionFactory);
    }

    @Override
    @Transactional
    public void addFlightDetail(FlightDetail fd) {
        save(fd);
    }

    @Override
    @Transactional
    public void addPath(Path p) {
        save(p);
    }

    @Override
    @Transactional
    public List<FlightDetail> getFlightDetailMonth(int month) {
        List<FlightDetail> list = new ArrayList<FlightDetail>();
        List<Criterion> cr = new ArrayList<Criterion>();
        Criterion rq = Restrictions.eq("month", month);
        cr.add(rq);
        list = findByCriteria(FlightDetail.class, cr);
        return list;
    }

    @Override
    @Transactional
    public List<Path> getPathMonth(int month) {
        List<Path> list = new ArrayList<Path>();
        List<Criterion> cr = new ArrayList<Criterion>();
        Criterion rq = Restrictions.eq("month", month);
        cr.add(rq);
        list = findByCriteria(FlightDetail.class, cr);
        return list;
    }

    @Override
    @Transactional
    public void addAirport(Airports a) {
        save(a);
    }

    @Override
    @Transactional
    public void addAirline(Airlines a) {
        save(a);
    }

    @Override
    @Transactional
    public void addGephi(Gephi g) {
        save(g);
    }

    @Override
    @Transactional
    public List<Airports> getAllAirport() {
        List<Airports> list = new ArrayList<Airports>();
        list = findAll(Airports.class);
        return list;
    }

    @Override
    @Transactional
    public List<Airlines> getAllAirlines() {
        List<Airlines> list = new ArrayList<Airlines>();
        list = findAll(Airlines.class);
        return list;
    }

    @Override
    @Transactional
    public Airports getAirport(String code) {
        Airports a = null;
        List<Criterion> criterias = new ArrayList<Criterion>();
        Criterion aid = Restrictions.eq("IATA_code", code);
        criterias.add(aid);
        a = (Airports) findUniqueByCriteria(Airports.class, criterias);
        return a;
    }

    @Override
    @Transactional
    public Airlines getAirlines(String code) {
        Airlines a = null;
        List<Criterion> criterias = new ArrayList<Criterion>();
        Criterion aid = Restrictions.eq("IATA_code", code);
        criterias.add(aid);
        a = (Airlines) findUniqueByCriteria(Airlines.class, criterias);
        return a;
    }

    @Override
    @Transactional
    public List<Gephi> getGephi() {
        List<Gephi> list = new ArrayList<Gephi>();
        list = findAll(Gephi.class);
        return list;
    }

    @Override
    @Transactional
    public List<FlightDetail> getAllFlight() {
        List<FlightDetail> list = new ArrayList<FlightDetail>();
        list = findAll(FlightDetail.class);
        return list;
    }

    @Override
    @Transactional
    public List<FlightDetail> getDelays() {
        List<FlightDetail> list = new ArrayList<FlightDetail>();
        List<Criterion> cr = new ArrayList<Criterion>();
        Disjunction or = Restrictions.disjunction();
        Criterion rq1 = Restrictions.ge("airSystemDelay", 0);
        Criterion rq2 = Restrictions.ge("securityDelay", 0);
        Criterion rq3 = Restrictions.ge("airlineDelay", 0);
        Criterion rq4 = Restrictions.ge("lateAircraftDelay", 0);
        Criterion rq5 = Restrictions.ge("weatherDelay", 0);
        or.add(rq1);
        or.add(rq2);
        or.add(rq3);
        or.add(rq4);
        or.add(rq5);
        cr.add(or);
        list = findByCriteria(FlightDetail.class, cr);
        return list;
    }

    @Override
    @Transactional
    public List<FlightDetail> getDelaysByMonth(int mon) {
        List<FlightDetail> list = new ArrayList<FlightDetail>();
        List<Criterion> cr = new ArrayList<Criterion>();
        Disjunction or = Restrictions.disjunction();
        Criterion rq1 = Restrictions.ge("airSystemDelay", 0);
        Criterion rq2 = Restrictions.ge("securityDelay", 0);
        Criterion rq3 = Restrictions.ge("airlineDelay", 0);
        Criterion rq4 = Restrictions.ge("lateAircraftDelay", 0);
        Criterion rq5 = Restrictions.ge("weatherDelay", 0);
        Criterion rq6 = Restrictions.eq("month", mon);
        
        or.add(rq1);
        or.add(rq2);
        or.add(rq3);
        or.add(rq4);
        or.add(rq5);
        cr.add(or);
        cr.add(rq6);
        list = findByCriteria(FlightDetail.class, cr);
        return list;
    }

    @Override
    @Transactional
    public List<FlightDetail> getBarDelay(String airline, int mon) {
        List<FlightDetail> list = new ArrayList<FlightDetail>();
        List<Criterion> cr = new ArrayList<Criterion>();
        Criterion rq6 = Restrictions.eq("month", mon);
        Criterion rq7 = Restrictions.eq("airline", airline);
        Criterion rq8 = Restrictions.ge("arrivalDelay", 0);
        cr.add(rq6);
        cr.add(rq7);
        cr.add(rq8);
        list = findByCriteria(FlightDetail.class, cr);
        return list;
    }
}
