/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.dao.DataDAO;
import com.pojo.Airlines;
import com.pojo.Airports;
import com.pojo.FlightDetail;
import com.pojo.Gephi;
import com.pojo.Path;
import com.vo.BarDelay;
import com.vo.StarPlotVO;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Orling
 */
@Controller
@Scope("request")
public class DefaultController {

    @Autowired
    private DataDAO dataDao;

    @RequestMapping(value = {"/", "/welcome**"}, method = RequestMethod.GET)
    public ModelAndView defaultPage(HttpServletRequest request) {

        ModelAndView model = new ModelAndView();
        model.addObject("message", "This is default page!");
        HttpSession httpSession = request.getSession();

        
        
        List<BarDelay> bdlist = renderBar();
        List<StarPlotVO> starlist = renderHexList();
        StarPlotVO s1 = renderHex();
        httpSession.setAttribute("barchart", bdlist);
        httpSession.setAttribute("hex", s1);
        httpSession.setAttribute("starplot", starlist);
            
        model.setViewName("/home");
        return model;

    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home(HttpServletRequest request) {

        HttpSession httpSession = request.getSession();
        
        List<BarDelay> bdlist = renderBar();
        List<StarPlotVO> starlist = renderHexList();
        StarPlotVO s1 = renderHex();
        httpSession.setAttribute("barchart", bdlist);
        httpSession.setAttribute("hex", s1);
        httpSession.setAttribute("starplot", starlist);
        
        return "/home";

    }

    @RequestMapping(value = "/flowmap", method = RequestMethod.GET)
    public String flowmap(HttpServletRequest request) {

//        ModelAndView model = new ModelAndView();
//        model.setViewName("/analysis");
//        return model;
        HttpSession httpSession = request.getSession();
        return "/flowmap2";

    }
    @RequestMapping(value = "/sigma", method = RequestMethod.GET)
    public String signma(HttpServletRequest request) {

//        ModelAndView model = new ModelAndView();
//        model.setViewName("/analysis");
//        return model;
        HttpSession httpSession = request.getSession();
        return "/sigma";

    }

    @RequestMapping(value = "/hex", method = RequestMethod.GET)
    public String hex(HttpServletRequest request) {

        HttpSession httpSession = request.getSession();
        List<FlightDetail> fd = dataDao.getDelaysByMonth(4);
        StarPlotVO s = new StarPlotVO("all", 0, 0, 0, 0, 0);
        for (FlightDetail f : fd) {
            s.addAirSystemDelay(f.getAirSystemDelay());
            s.addAirlineDelay(f.getAirlineDelay());
            s.addSecurityDelay(f.getSecurityDelay());
            s.addLateAircraftDelay(f.getLateAircraftDelay());
            s.addWeatherDelay(f.getWeatherDelay());
        }
        System.out.println("abc " + s.getAirSystemDelay());
        httpSession.setAttribute("hex", s);
        return "/hex";

    }

    @RequestMapping(value = "/hex1", method = RequestMethod.GET)
    public String hex1(HttpServletRequest request) {

        HttpSession httpSession = request.getSession();
        List<FlightDetail> fd1 = dataDao.getDelaysByMonth(4);
        StarPlotVO s1 = new StarPlotVO("all", 0, 0, 0, 0, 0);
        for (FlightDetail f : fd1) {
            s1.addAirSystemDelay(f.getAirSystemDelay());
            s1.addAirlineDelay(f.getAirlineDelay());
            s1.addSecurityDelay(f.getSecurityDelay());
            s1.addLateAircraftDelay(f.getLateAircraftDelay());
            s1.addWeatherDelay(f.getWeatherDelay());
        }

        List<FlightDetail> fd = dataDao.getDelays();
        Map<String, StarPlotVO> maps = new HashMap<String, StarPlotVO>();
        for (FlightDetail f : fd) {
            if (maps.get(f.getAirline()) != null) {
                StarPlotVO s = maps.get(f.getAirline());
                s.addAirSystemDelay(f.getAirSystemDelay());
                s.addAirlineDelay(f.getAirlineDelay());
                s.addSecurityDelay(f.getSecurityDelay());
                s.addLateAircraftDelay(f.getLateAircraftDelay());
                s.addWeatherDelay(f.getWeatherDelay());
            } else {
                StarPlotVO s = new StarPlotVO(f.getAirline(), f.getAirSystemDelay(), f.getSecurityDelay(), f.getAirlineDelay(), f.getLateAircraftDelay(), f.getWeatherDelay());
                maps.put(f.getAirline(), s);
            }
        }
        List<StarPlotVO> starlist = new ArrayList<StarPlotVO>();
        for (Map.Entry<String, StarPlotVO> entry : maps.entrySet()) {
            starlist.add(entry.getValue());
        }
        httpSession.setAttribute("hex", s1);
        httpSession.setAttribute("starplot", starlist);

        return "/hex1";

    }

    @RequestMapping(value = "/starplot3", method = RequestMethod.GET)
    public String star2(HttpServletRequest request) {

//        ModelAndView model = new ModelAndView();
//        model.setViewName("/analysis");
//        return model;
        HttpSession httpSession = request.getSession();
        return "/starplot3";

    }

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String test(HttpServletRequest request) {

        HttpSession httpSession = request.getSession();
        return "/test";

    }

    @RequestMapping(value = "/bar", method = RequestMethod.GET)
    public String bar(HttpServletRequest request) {

        HttpSession httpSession = request.getSession();

        List<Airlines> airlines = dataDao.getAllAirlines();
        List<BarDelay> bdlist = new ArrayList<BarDelay>();
        for (Airlines a : airlines) {
            List<FlightDetail> fdlist = dataDao.getBarDelay(a.getIataCode(), 4);
            BarDelay bd = convertBar(fdlist);
            bdlist.add(bd);
        }
        httpSession.setAttribute("barchart", bdlist);
        return "/barChart";

    }

    @RequestMapping(value = "/starplot", method = RequestMethod.GET)
    public String starplot(HttpServletRequest request) {

//        ModelAndView model = new ModelAndView();
//        model.setViewName("/analysis");
//        return model;
        HttpSession httpSession = request.getSession();
        List<FlightDetail> fd = dataDao.getDelays();
        Map<String, StarPlotVO> maps = new HashMap<String, StarPlotVO>();
        for (FlightDetail f : fd) {
            if (maps.get(f.getAirline()) != null) {
                StarPlotVO s = maps.get(f.getAirline());
                s.addAirSystemDelay(f.getAirSystemDelay());
                s.addAirlineDelay(f.getAirlineDelay());
                s.addSecurityDelay(f.getSecurityDelay());
                s.addLateAircraftDelay(f.getLateAircraftDelay());
                s.addWeatherDelay(f.getWeatherDelay());
            } else {
                StarPlotVO s = new StarPlotVO(f.getAirline(), f.getAirSystemDelay(), f.getSecurityDelay(), f.getAirlineDelay(), f.getLateAircraftDelay(), f.getWeatherDelay());
                maps.put(f.getAirline(), s);
            }
        }
        List<StarPlotVO> starlist = new ArrayList<StarPlotVO>();
        for (Map.Entry<String, StarPlotVO> entry : maps.entrySet()) {
            starlist.add(entry.getValue());
        }
        for (StarPlotVO s : starlist) {
            System.out.println(s.printing());
        }
        httpSession.setAttribute("starplot", starlist);

        return "/starplot";

    }

    public BarDelay convertBar(List<FlightDetail> fd) {
        BarDelay bd = new BarDelay(fd.get(0).getAirline(), 0, 0);
        int total = 0;
        for (FlightDetail f : fd) {
            total += f.getArrivalDelay();
        }
        bd.setTotalDelay(total);
        bd.setAvgDelay(total / fd.size());
        return bd;
    }

    public List<BarDelay> renderBar() {
        List<Airlines> airlines = dataDao.getAllAirlines();
        List<BarDelay> bdlist = new ArrayList<BarDelay>();
        for (Airlines a : airlines) {
            List<FlightDetail> fdlist = dataDao.getBarDelay(a.getIataCode(), 4);
            BarDelay bd = convertBar(fdlist);
            bdlist.add(bd);
        }
        for(BarDelay b:bdlist){
           System.out.print("'"+b.getAirline()+"',");
        }
        for(BarDelay b:bdlist){
            System.out.print(b.getAvgDelay()+",");
        }
        for(BarDelay b:bdlist){
             System.out.print(b.getTotalDelay()+",");
        }
        return bdlist;
    }

    
    
    
    public List<StarPlotVO> renderHexList() {
        List<FlightDetail> fd = dataDao.getDelaysByMonth(4);
        Map<String, StarPlotVO> maps = new HashMap<String, StarPlotVO>();
        for (FlightDetail f : fd) {
            if (maps.get(f.getAirline()) != null) {
                StarPlotVO s = maps.get(f.getAirline());
                s.addAirSystemDelay(f.getAirSystemDelay());
                s.addAirlineDelay(f.getAirlineDelay());
                s.addSecurityDelay(f.getSecurityDelay());
                s.addLateAircraftDelay(f.getLateAircraftDelay());
                s.addWeatherDelay(f.getWeatherDelay());
            } else {
                StarPlotVO s = new StarPlotVO(f.getAirline(), f.getAirSystemDelay(), f.getSecurityDelay(), f.getAirlineDelay(), f.getLateAircraftDelay(), f.getWeatherDelay());
                maps.put(f.getAirline(), s);
            }
        }
        List<StarPlotVO> starlist = new ArrayList<StarPlotVO>();
        for (Map.Entry<String, StarPlotVO> entry : maps.entrySet()) {
            starlist.add(entry.getValue());
        }
        for(StarPlotVO s: starlist){
            System.out.println(s.printing());
        }
        return starlist;
    }

    public StarPlotVO renderHex() {
        List<FlightDetail> fd1 = dataDao.getDelaysByMonth(4);
        StarPlotVO s1 = new StarPlotVO("all", 0, 0, 0, 0, 0);
        for (FlightDetail f : fd1) {
            s1.addAirSystemDelay(f.getAirSystemDelay());
            s1.addAirlineDelay(f.getAirlineDelay());
            s1.addSecurityDelay(f.getSecurityDelay());
            s1.addLateAircraftDelay(f.getLateAircraftDelay());
            s1.addWeatherDelay(f.getWeatherDelay());
            
        }
        System.out.println(s1.printing());
        return s1;
    }

}
