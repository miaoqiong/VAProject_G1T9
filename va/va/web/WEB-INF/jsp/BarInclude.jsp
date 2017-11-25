<script>
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
                    backgroundColor: 'rgba(96, 4, 4, 0.2)',
                    borderColor: 'rgba(96, 4, 4, 0.7)',
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
//    window.onload = function () {
//    var ctx = document.getElementById("bar").getContext("2d");
//    window.myHorizontalBar = new Chart(ctx, {
//    type: 'horizontalBar',
//            data: horizontalBarChartData,
//            options: {
//            // Elements options apply to all of the options unless overridden in a dataset
//            // In this case, we are setting the border of each horizontal bar to be 2px wide
//            elements: {
//            rectangle: {
//            borderWidth: 2,
//            }
//            },
//                    responsive: true,
//                    legend: {
//                    position: 'right',
//                    },
//                    title: {
//                    display: true,
//                            text: 'Airlines Overall Delays'
//                    }
//            }
//    });
//    };
</script>