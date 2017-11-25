<script>
    <%
        StarPlotVO sp = (StarPlotVO) session.getAttribute("hex");
        List<StarPlotVO> list = (List<StarPlotVO>) session.getAttribute("starplot");
    %>
//    var utils = Samples.utils;
    var hexconfig = {
        type: 'radar',
        data: {
            labels: ["airSystemDelay", "securityDelay", "airlineDelay", "lateAircraftDelay", "weatherDelay"],
            datasets: [{
                    label: "<%out.print(sp.getAirline()); %>",
                    backgroundColor: 'rgba(35, 28, 109, 0.2)',
                    borderColor: 'rgba(35, 28, 109, 0.7)',
                    pointBackgroundColor: "purple",
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
    };
//    window.onload = function () {
//        window.myRadar = new Chart(document.getElementById("hex"), hexconfig);
//    };
</script>