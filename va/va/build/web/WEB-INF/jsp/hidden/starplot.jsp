<%-- 
    Document   : statplot
    Created on : 15 Nov, 2017, 1:18:07 AM
    Author     : Orling
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="com.vo.StarPlotVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="http://d3js.org/d3.v3.min.js"></script>
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="<c:url value='/ammap/d3-starPlot.js'/>"></script>
        <script src="<c:url value='/ammap/d3-star-plot-0.0.3.min.js'/>"></script>
    </head>
    <!DOCTYPE>
    <meta charset="utf-8">
    <style>

        body {
            width: 960px;
            margin: auto;
            font-family: Arial;
        }
        #target {
            margin: 40px 0;
        }
        .wrapper {
            position: relative;
            display: inline-block;
        }
        .chart {
            margin-bottom: 40px;
        }
        .star-title {
            font-size: 14px;
        }
        .star-label {
            font-size: 11px;
            pointer-events: none;
        }
        .star-origin {
            fill: #333;
        }
        .star-axis {
            stroke: #ccc;
            stroke-width: 2px;
            stroke-dasharray: 4 5;
        }
        .star-path {
            stroke: #444;
            stroke-width: 2px;
            fill: #709CB1;
            fill-opacity: 0.6;
        }
        .star-interaction {
            opacity: 0;
        }

        .interaction {
            pointer-events: none;
        }
        .interaction.label {
            position: absolute;
            font-size: 11px;
            text-shadow: 0 1px 0 #FFF, 0 -1px 0 #FFF, 1px 0 #FFF, -1px 0 #FFF;
        }
        .interaction.circle {
            fill: #444;
            fill-opacity: 0.6;
            stroke: #444;
        }

    </style>

    <body>


        <!--<script src="<c:url value='/ammap/maps/js/worldLow.js'/>"></script>-->

        <script>
            var margin = {
                top: 32,
                right: 50,
                bottom: 20,
                left: 50
            };
            var width = 240 - margin.left - margin.right;
            var height = 240 - margin.top - margin.bottom;
            var labelMargin = 8;

            var scale = d3.scale.linear()
                    .domain([0, 7])
                    .range([0, 100])






            d3.csv('<c:url value='/ammap/delayper.csv'/>')
                    .row(function (d) {
                        d.airSystemDelay = +d.airSystemDelay;
                        d.securityDelay = +d.securityDelay;
                        d.airlineDelay = +d.airlineDelay;
                        d.lateAircraftDelay = +d.lateAircraftDelay;
                        d.weatherDelay = +d.weatherDelay;
                        return d;
                    }).get(function (error, rows) {
                var star = d3.starPlot()
                        .width(width)
                        .properties([
                            'airSystemDelay',
                            'securityDelay',
                            'airlineDelay',
                            'lateAircraftDelay',
                            'weatherDelay'
                        ])
                        .scales(scale)
                        .labels([
                            'airSystemDelay',
                            'securityDelay',
                            'airlineDelay',
                            'lateAircraftDelay',
                            'weatherDelay'
                        ])
                        .title(function (d) {
                            return d.airline;
                        })
                        .margin(margin)
                        .labelMargin(labelMargin)

                rows.forEach(function (d, i) {
                    star.includeLabels(i % 4 === 0 ? true : false);

                    var wrapper = d3.select('#target').append('div')
                            .attr('class', 'wrapper')

                    var svg = wrapper.append('svg')
                            .attr('class', 'chart')
                            .attr('width', width + margin.left + margin.right)
                            .attr('height', width + margin.top + margin.bottom)

                    var starG = svg.append('g')
                            .datum(d)
                            .call(star)
                            .call(star.interaction)

                    var interactionLabel = wrapper.append('div')
                            .attr('class', 'interaction label')

                    var circle = svg.append('circle')
                            .attr('class', 'interaction circle')
                            .attr('r', 5)

                    var interaction = wrapper.selectAll('.interaction')
                            .style('display', 'none');

                    svg.selectAll('.star-interaction')
                            .on('mouseover', function (d) {
                                svg.selectAll('.star-label')
                                        .style('display', 'none')

                                interaction
                                        .style('display', 'block')

                                circle
                                        .attr('cx', d.x)
                                        .attr('cy', d.y)

                                $interactionLabel = $(interactionLabel.node());
                                interactionLabel
                                        .text(d.key + ': ' + d.datum[d.key])
                                        .style('left', d.xExtent - ($interactionLabel.width() / 2))
                                        .style('top', d.yExtent - ($interactionLabel.height() / 2))
                            })
                            .on('mouseout', function (d) {
                                interaction
                                        .style('display', 'none')

                                svg.selectAll('.star-label')
                                        .style('display', 'block')
                            })
                });
            });

        </script>
        <div id='target'></div>
    </body>
</html>
