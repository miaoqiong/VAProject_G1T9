<%-- 
    Document   : starplot
    Created on : 15 Nov, 2017, 3:48:24 AM
    Author     : Orling
--%>

<%@page import="com.vo.StarPlotVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Styles -->
        <style>
            #chartdiv {
                width: 100%;
                height: 500px;
            }				
        </style>

        <!-- Resources -->
        <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
        <script src="https://www.amcharts.com/lib/3/radar.js"></script>
        <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
        <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
        <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
        
        <%@include file="includes.jsp"%>

        <!-- Chart code -->
          <script>
            <%
                StarPlotVO sp = (StarPlotVO) session.getAttribute("hex");
            %>
            var chart = AmCharts.makeChart("chartdiv", {
                "type": "radar",
                "theme": "light",
                "dataProvider": [{
                        "delays": "airSystemDelay",
                        "minutes": <% out.print(sp.getAirSystemDelay()); %> 
                    }, {
                        "delays": "securityDelay",
                        "minutes": <% out.print(sp.getSecurityDelay()); %>
                    }, {
                        "delays": "airlineDelay",
                        "minutes": <% out.print(sp.getAirlineDelay()); %>
                    }, {
                        "delays": "lateAircraftDelay",
                        "minutes": <% out.print(sp.getLateAircraftDelay()); %>
                    }, {
                        "delays": "weatherDelay",
                        "minutes": <% out.print(sp.getWeatherDelay());%>
                    }],
                "valueAxes": [{
                        "axisTitleOffset": 20,
                        "minimum": 0,
                        "axisAlpha": 0.15
                    }],
                "startDuration": 2,
                "graphs": [{
                        "balloonText": "[[value]]",
                        "bullet": "round",
                        "lineThickness": 2,
                        "valueField": "minutes"
                    }],
                "categoryField": "delays",
                "export": {
                    "enabled": true
                }
            });
        </script>


        <!-- HTML -->
        <div id="chartdiv"></div>	
    </body>
</html>
