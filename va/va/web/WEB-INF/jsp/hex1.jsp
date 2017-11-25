<%-- 
    Document   : hex1
    Created on : 18 Nov, 2017, 3:17:45 PM
    Author     : Orling
--%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.vo.StarPlotVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="includes.jsp"%>
        <script src="<c:url value='/resource/utils.js'/>"></script>
    </head>
    <body>
        <div class="container">
            <div style="width:60%">
                <canvas id="canvas"></canvas>
            </div>
        </div>
        <script>
            <%
                StarPlotVO sp = (StarPlotVO) session.getAttribute("hex");
                List<StarPlotVO> list = (List<StarPlotVO>) session.getAttribute("starplot");
            %>
            var color = Chart.helpers.color;
            var presets = window.chartColors;
            var utils = Samples.utils;
            var config = {
                type: 'radar',
                data: {
                    labels: ["airSystemDelay", "securityDelay", "airlineDelay", "lateAircraftDelay", "weatherDelay"],
                    datasets: [{
                            label: "<%out.print(sp.getAirline()); %>",
                            backgroundColor: 'rgba(96, 4, 4, 0.2)', 
                            borderColor: 'rgba(96, 4, 4, 0.7)',
                            pointBackgroundColor: "red",
                            data: [
            <% out.print(sp.printNo());%>
                            ]
                        },
            <% for (StarPlotVO s : list) { %>

                        {
                            label: "<%out.print(s.getAirline()); %>",
                            backgroundColor: 'rgba(65, 65, 68, 0.2)', 
                            borderColor: 'rgba(65, 65, 68, 0.7)',
                            pointBackgroundColor: "white",
                            hidden: true,
                            data: [
            <% out.print(s.printNo());%>
                            ]
                        },

            <% }%>
                    ]
                },
                options: {
                    legend: {
                        position: 'top',
                    },
                    title: {
                        display: true,
                        text: "Dirline's Delays Drill Down "
                    },
                    scale: {
                        ticks: {
                            beginAtZero: true
                        }
                    }
                }
            };
            window.onload = function () {
                window.myRadar = new Chart(document.getElementById("canvas"), config);
            };
        </script>
    </body>
</html>
