<%-- 
    Document   : home
    Created on : 13 Nov, 2017, 2:03:52 PM
    Author     : Orling
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.vo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Same Same But DIfferent</title>
        <%@include file="includes.jsp"%>
        <!--<script src="<c:url value='/resource/utils.js'/>"></script>-->



    </head>
    <body>
        <%@include file="nav.jsp"%> 

        <div class="container" style="width:80%">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Flow Map</div>
                        <div class="panel-body">
                            <%@include file="FlowInclude.jsp"%> 
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <%@include file="bubble.jsp"%> 
                </div>
            </div>
            <!--airline delays-->
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">Airline Overall Delays</div>
                        <div class="panel-body" style ="width:60%; height:60%; ">
                            <center><canvas id="hex" ></canvas></center>  
                        </div>
                    </div>
                </div>
                <!--            </div>
                            <div class="row">-->
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">Airline Delays</div>
                        <div class="panel-body" >
                            <canvas id="bar"></canvas>
                        </div>
                    </div>
                </div>
            </div>




        </div>

        <%@include file="BarInclude.jsp"%>
        <%@include file="HexInclude.jsp"%> 
        <!--<script src="<c:url value='/resource/bubble.js'/>"></script>-->


        <script>
            window.onload = function () {
                var ctx = document.getElementById("bar").getContext("2d");
                window.myRadar = new Chart(document.getElementById("hex"), hexconfig);
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

            var width = 960,
                    height = 630;


            d3.select("#bubbleChart").append("svg")
                    .attr("width", width)
                    .attr("height", height)
                    .attr("id", "primarySVG");


            displayBubbleChart();

            $("label.cycleBtn").click(function () {
                displayBubbleChart();

            });


            function displayBubbleChart() {

                var dataSource = '<c:url value='/resource/bubbleChart20141.csv'/>';



                d3.csv(dataSource, function (error, data) {

                    data.sort(function (a, b) {
                        return b.ratingClassValue - a.ratingClassValue;
                    });


                    var svg = d3.select("#primarySVG");



//set bubble padding
                    var padding = 4;

                    for (var j = 0; j < data.length; j++) {
                        data[j].radius = 10;
                        data[j].x = Math.random() * width;
                        data[j].y = Math.random() * height;
                    }

                    var maxRadius = d3.max(_.pluck(data, 'radius'));


                    var getCenters = function (vname, size) {
                        var centers, map;
                        centers = _.uniq(_.pluck(data, vname)).map(function (d) {
                            return {
                                name: d,
                                value: 1
                            };
                        });

                        map = d3.layout.pack().size(size);
                        map.nodes({children: centers});

                        return centers;
                    };

                    var nodes = svg.selectAll("circle")
                            .data(data);

                    nodes.enter().append("circle")
                            //.attr("class", "node")
                            .attr("class", function (d) {
                                return d.ratingCategory;
                            })
                            .attr("cx", function (d) {
                                return d.x;
                            })
                            .attr("cy", function (d) {
                                return d.y;
                            })
                            .attr("r", 2)
                            .attr("id", function (d) {
                                return d.objectName;
                            })
                            .on("mouseover", function (d) {
                                showPopover.call(this, d);
                            })
                            .on("mouseout", function (d) {
                                removePopovers();
                            })
                            ;

                    var text = nodes.append("text")
                            .attr("dx", 12)
                            .attr("dy", ".35em")
                            .text(function (d) {
                                return d.objectName;
                            });



                    nodes.transition()
                            .duration(500)
                            .attr("r", function (d) {
                                return d.radius;
                            })
                            ;

                    var force = d3.layout.force();


                    draw('reset');

                    $("label.ratingBtn").click(function () {
                        draw(this.id);
                    });



                    function draw(varname) {
                        d3.selectAll("circle").attr("r", 10);
                        var centers = getCenters(varname, [width, height]);
                        force.on("tick", tick(centers, varname));
                        labels(centers);
                        nodes.attr("class", function (d) {
                            return d[varname];
                        });
                        force.start();
                        makeClickable();
                    }


                    function tick(centers, varname) {
                        var foci = {};
                        for (var i = 0; i < centers.length; i++) {
                            foci[centers[i].name] = centers[i];
                        }
                        return function (e) {
                            for (var i = 0; i < data.length; i++) {
                                var o = data[i];
                                var f = foci[o[varname]];
                                o.y += (f.y - o.y) * e.alpha;
                                o.x += (f.x - o.x) * e.alpha;
                            }
                            nodes.each(collide(.2))
                                    .attr("cx", function (d) {
                                        return d.x;
                                    })
                                    .attr("cy", function (d) {
                                        return d.y;
                                    });
                        }
                    }


                    function labels(centers) {
                        svg.selectAll(".label").remove();

                        svg.selectAll(".label")
                                .data(centers).enter().append("text")
                                .attr("class", "label")
                                .text(function (d) {
                                    return d.name;
                                })
                                .attr("transform", function (d) {
                                    return "translate(" + (d.x - ((d.name.length) * 3)) + ", " + (d.y + 15 - d.r) + ")";
                                });


                    }

                    function removePopovers() {
                        $('.popover').each(function () {
                            $(this).remove();
                        });
                    }

                    function showPopover(d) {
                        $(this).popover({
                            placement: 'auto top',
                            container: 'body',
                            trigger: 'manual',
                            html: true,
                            content: function () {
                                return "Airline: " + d.objectName + "</br>Cancel Reason: " + d.ratingCategory;
                            }
                        });
                        $(this).popover('show');
                    }

                    function collide(alpha) {
                        var quadtree = d3.geom.quadtree(data);
                        return function (d) {
                            var r = d.radius + maxRadius + padding,
                                    nx1 = d.x - r,
                                    nx2 = d.x + r,
                                    ny1 = d.y - r,
                                    ny2 = d.y + r;
                            quadtree.visit(function (quad, x1, y1, x2, y2) {
                                if (quad.point && (quad.point !== d)) {
                                    var x = d.x - quad.point.x,
                                            y = d.y - quad.point.y,
                                            l = Math.sqrt(x * x + y * y),
                                            r = d.radius + quad.point.radius + padding;
                                    if (l < r) {
                                        l = (l - r) / l * alpha;
                                        d.x -= x *= l;
                                        d.y -= y *= l;
                                        quad.point.x += x;
                                        quad.point.y += y;
                                    }
                                }
                                return x1 > nx2 || x2 < nx1 || y1 > ny2 || y2 < ny1;
                            });
                        };
                    }





                    function makeClickable() {


                        $("circle").click(function () {
                            console.log(this.id);
                        });

                        var nest = d3.nest()
                                .key(function (d) {
                                    return d.objectName;
                                })
                                .entries(data);


                    }
                    nodes.exit().remove();


                });
            }
        </script>

    </body>
</html>
