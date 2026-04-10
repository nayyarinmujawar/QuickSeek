<%-- 
    Document   : overview
    Created on : 10 Apr 2026, 12:52:11?am
    Author     : HP
--%>

<%@ page contentType="text/html" %>

<!DOCTYPE html>
<html>
<head>
<title>Overview</title>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>

body{
margin:0;
font-family:Arial;
background:linear-gradient(135deg,#000,#1a1a1a);
color:white;
text-align:center;
}

h2{
margin-top:20px;
}

.chart-box{
width:60%;
margin:auto;
margin-top:40px;
background:rgba(255,255,255,0.05);
padding:20px;
border-radius:12px;
box-shadow:0 0 15px rgba(0,0,0,0.5);
}

</style>

</head>

<body>

<h2> Overview Dashboard</h2>

<div class="chart-box">
<canvas id="myChart"></canvas>
</div>

<script>

var total = <%=request.getAttribute("total")%>;
var found = <%=request.getAttribute("found")%>;
var lost = <%=request.getAttribute("lost")%>;

var ctx = document.getElementById('myChart').getContext('2d');

new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Total Items', 'Found Items', 'Lost Items'],
        datasets: [{
            label: 'Items Data',
            data: [total, found, lost],
            backgroundColor: [
                'orange',
                'blue',
                'red'
            ]
        }]
    },
    options: {
        plugins: {
            legend: {
                labels: {
                    color: 'white'
                }
            }
        },
        scales: {
            x: {
                ticks: { color: 'white' }
            },
            y: {
                ticks: { color: 'white' }
            }
        }
    }
});

</script>

</body>
</html>