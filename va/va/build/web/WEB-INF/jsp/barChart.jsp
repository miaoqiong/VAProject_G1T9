<%-- 
    Document   : barChart
    Created on : 18 Nov, 2017, 6:35:57 PM
    Author     : Orling
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="com.vo.BarDelay"%>
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
        <div id="container" style="width: 75%;">
            <canvas id="canvas"></canvas>
        </div>
        <script>
            var color = Chart.helpers.color;
            <%
                List<BarDelay> bdlist = (List<BarDelay>) session.getAttribute("barchart");
            %>
            var horizontalBarChartData = {
            labels: [
            <% for (BarDelay bd : bdlist) { %>
            "<% out.print(bd.getAirline()); %>",
            <% } %>

            ],
                    datasets: [{
                    label: 'Average',
                            backgroundColor: 'rgba(35, 28, 109, 0.2)', 
                            borderColor: 'rgba(35, 28, 109, 0.7)',
                            borderWidth: 1,
                            data: [
            <% for (BarDelay bd : bdlist) { %>
            <% out.print(bd.getAvgDelay()); %>,
            <% } %>
                            ]
                    }, {
                    label: 'Total',
                            backgroundColor: 'rgba(65, 65, 68, 0.2)', 
                            borderColor: 'rgba(65, 65, 68, 0.7)',
                            hidden: true,
                            data: [
            <% for (BarDelay bd : bdlist) { %>
            <% out.print(bd.getTotalDelay()); %>,
            <% }%>
                            ]
                    }]

            };
            window.onload = function () {
            var ctx = document.getElementById("canvas").getContext("2d");
            window.myHorizontalBar = new Chart(ctx, {
            type: 'horizontalBar',
                    data: horizontalBarChartData,
                    options: {
                    // Elements options apply to all of the options unless overridden in a dataset
                    // In this case, we are setting the border of each horizontal bar to be 2px wide
                    elements: {
                    rectangle: {
                    borderWidth: 2,
                    }
                    },
                            responsive: true,
                            legend: {
                            position: 'right',
                            },
                            title: {
                            display: true,
                                    text: 'Airlines Overall Delays'
                            }
                    }
            });
            };
        </script>
    </body>
</html>
