<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>Delay Analysis</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.bundle.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.5/d3.min.js" charset="utf-8"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js"></script>

    </head>

    <body>
        <style>
            body{
                margin-top:5%; 
            }
            .popover {
                z-index: 9999; /* A value higher than 1010 that solves the problem */
            }
        </style>
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style = " background-color:white">
            <div class="container">
                <div class="navbar-header page-scroll">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand page-scroll" href="/web/index.html">Airlines Analyse Dashboard</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav pull-right">
                        <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                        <li class="hidden">
                            <a class="page-scroll" href="/web/index.html">Home</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="/web/network.html">Network Analysis</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="/web/bubble.html">Cancellation Analysis</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="/web/delay.html">Delay Analysis</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


        <div id="container">
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
        <script>
//    var utils = Samples.utils;
            var hexconfig = {
                type: 'radar',
                data: {
                    labels: ["airSystemDelay", "securityDelay", "airlineDelay", "lateAircraftDelay", "weatherDelay"],
                    datasets: [{
                            label: "all",
                            backgroundColor: 'rgba(35, 28, 109, 0.2)',
                            borderColor: 'rgba(35, 28, 109, 0.7)',
                            pointBackgroundColor: "purple",
                            data: [1118027, 3660, 1490594, 1785437, 221590]
                        },
                        {
                            label: "AA",
                            backgroundColor: 'rgba(65, 65, 68, 0.2)',
                            borderColor: 'rgba(65, 65, 68, 0.7)',
                            pointBackgroundColor: "white",
                            hidden: true,
                            data: [127282, 403, 170301, 216927, 46744]
                        },
                        {
                            label: "OO",
                            backgroundColor: 'rgba(65, 65, 68, 0.2)',
                            borderColor: 'rgba(65, 65, 68, 0.7)',
                            pointBackgroundColor: "white",
                            hidden: true,
                            data: [93113, 386, 143364, 192646, 11278]
                        },
                        {
                            label: "VX",
                            backgroundColor: 'rgba(65, 65, 68, 0.2)',
                            borderColor: 'rgba(65, 65, 68, 0.7)',
                            pointBackgroundColor: "white",
                            hidden: true,
                            data: [12807, 20, 8035, 14478, 4129]
                        },
                        {
                            label: "MQ",
                            backgroundColor: 'rgba(65, 65, 68, 0.2)',
                            borderColor: 'rgba(65, 65, 68, 0.7)',
                            pointBackgroundColor: "white",
                            hidden: true,
                            data: [84219, 884, 75888, 101354, 40783]
                        },
                        {
                            label: "DL",
                            backgroundColor: 'rgba(65, 65, 68, 0.2)',
                            borderColor: 'rgba(65, 65, 68, 0.7)',
                            pointBackgroundColor: "white",
                            hidden: true,
                            data: [140575, 236, 204474, 152249, 36066]
                        },
                        {
                            label: "UA",
                            backgroundColor: 'rgba(65, 65, 68, 0.2)',
                            borderColor: 'rgba(65, 65, 68, 0.7)',
                            pointBackgroundColor: "white",
                            hidden: true,
                            data: [112397, 0, 167650, 196042, 17630]
                        },
                        {
                            label: "EV",
                            backgroundColor: 'rgba(65, 65, 68, 0.2)',
                            borderColor: 'rgba(65, 65, 68, 0.7)',
                            pointBackgroundColor: "white",
                            hidden: true,
                            data: [132778, 0, 186479, 181811, 10306]
                        },
                        {
                            label: "AS",
                            backgroundColor: 'rgba(65, 65, 68, 0.2)',
                            borderColor: 'rgba(65, 65, 68, 0.7)',
                            pointBackgroundColor: "white",
                            hidden: true,
                            data: [16628, 291, 26035, 23267, 2386]
                        },
                        {
                            label: "F9",
                            backgroundColor: 'rgba(65, 65, 68, 0.2)',
                            borderColor: 'rgba(65, 65, 68, 0.7)',
                            pointBackgroundColor: "white",
                            hidden: true,
                            data: [49155, 0, 22398, 41468, 1221]
                        },
                        {
                            label: "B6",
                            backgroundColor: 'rgba(65, 65, 68, 0.2)',
                            borderColor: 'rgba(65, 65, 68, 0.7)',
                            pointBackgroundColor: "white",
                            hidden: true,
                            data: [75276, 348, 71786, 93349, 5421]
                        },
                        {
                            label: "WN",
                            backgroundColor: 'rgba(65, 65, 68, 0.2)',
                            borderColor: 'rgba(65, 65, 68, 0.7)',
                            pointBackgroundColor: "white",
                            hidden: true,
                            data: [128341, 367, 280584, 461689, 36403]
                        },
                        {
                            label: "HA",
                            backgroundColor: 'rgba(65, 65, 68, 0.2)',
                            borderColor: 'rgba(65, 65, 68, 0.7)',
                            pointBackgroundColor: "white",
                            hidden: true,
                            data: [108, 0, 10949, 3492, 424]
                        },
                        {
                            label: "NK",
                            backgroundColor: 'rgba(65, 65, 68, 0.2)',
                            borderColor: 'rgba(65, 65, 68, 0.7)',
                            pointBackgroundColor: "white",
                            hidden: true,
                            data: [59217, 189, 23243, 38999, 3972]
                        },
                        {
                            label: "US",
                            backgroundColor: 'rgba(65, 65, 68, 0.2)',
                            borderColor: 'rgba(65, 65, 68, 0.7)',
                            pointBackgroundColor: "white",
                            hidden: true,
                            data: [86131, 536, 99408, 67666, 4827]
                        }
                    ]
                },
                options: {
                    legend: {
                        position: 'right',
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
            };</script>
        <script>
            var horizontalBarChartData = {
                labels: ["UA", "AA", "US", "F9", "B6", "OO", "AS", "NK", "WN", "DL", "EV", "HA", "MQ", "VX"],
                datasets: [{
                        label: 'Average',
                        backgroundColor: 'rgba(96, 4, 4, 0.2)',
                        borderColor: 'rgba(96, 4, 4, 0.7)',
                        borderWidth: 1,
                        data: [32.0, 34.0, 21.0, 32.0, 33.0, 26.0, 18.0, 29.0, 24.0, 25.0, 27.0, 9.0, 31.0, 23.0]
                    }, {
                        label: 'Total',
                        backgroundColor: 'rgba(65, 65, 68, 0.2)',
                        borderColor: 'rgba(65, 65, 68, 0.7)',
                        hidden: true,
                        data: [538357, 610182, 304093, 125772, 266765, 498385, 84071, 138812, 1035321, 611529, 569612, 23891, 329141, 45659, 127282, 403, 170301, 216927, 46744]
                    }]

            };
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
        </script>


    </body>

</html>