<%-- 
    Document   : dashboard
    Created on : 4 Mar 2026, 7:03:31 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String user = (String) session.getAttribute("user");
if(user == null){
    response.sendRedirect("login.html");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>QuickSeek Dashboard</title>

<style>

body{
margin:0;
font-family:Arial;
background:#f5f5f5;
}

/* NAVBAR */

.navbar{
height:60px;
background:white;
display:flex;
align-items:center;
padding:0 20px;
box-shadow:0 2px 8px rgba(0,0,0,0.1);
}

.menu-btn{
font-size:28px;
cursor:pointer;
margin-right:20px;
}

.logo{
font-size:24px;
font-weight:bold;
color:#ff6600;
}

/* SIDEBAR */

.sidebar{
position:fixed;
left:-250px;
top:0;
width:250px;
height:100%;
background:#222;
color:white;
padding-top:60px;
transition:0.3s;
}

.sidebar a{
display:block;
padding:15px 25px;
color:white;
text-decoration:none;
}

.sidebar a:hover{
background:#ff6600;
}

/* PROFILE */

.profile{
text-align:center;
margin-bottom:10px;
}

.profile img{
width:80px;
border-radius:50%;
}

/* HERO IMAGE */

.hero{
height:120vh;
margin:0;

background:url("pic2/bg3.jpeg");
background-size:cover;
background-position:center;
display:flex;
align-items:center;
justify-content:center;
color:white;
font-size:40px;
font-weight:bold;
}

/* CONTENT */

.main{
padding:40px;
margin:0;
background:transparent;
min-height:200px;
}

.card-container{
display:flex;
gap:90px;
margin-top:-508px;
}

.card{
background:#FFD700;
width:190px;
padding:110px;
flex:1;
border-radius:65px;
box-shadow:0 4px 10px rgba(0,0,0,0.3);
text-align:center;
cursor:pointer;
transition:0.3s;
color:black;
font-weight:bold;
}

.card:hover{
transform:scale(1.05);
background:#FFC107;
}

</style>

<script>

function toggleMenu(){
var sidebar=document.getElementById("sidebar");

if(sidebar.style.left==="0px"){
sidebar.style.left="-250px";
}else{
sidebar.style.left="0px";
}

}

</script>

</head>

<body>

<!-- SIDEBAR -->

<div id="sidebar" class="sidebar">

<div class="profile">
<img src="images/profile.png">
<h3><%=user%></h3>
</div>

<a href="OverviewServlet">Overview</a>
<a href="MyItemServlet">My Item</a>
<a href="TrackLostServlet">TrackLost</a>
<a href="TrackFoundServlet">TrackFound</a>
<a href="AdminServlet">Admin Panel</a>
<a href="LogoutServlet">Logout</a>

</div>

<!-- NAVBAR -->

<div class="navbar">

<div class="menu-btn" onclick="toggleMenu()">☰</div>

<div class="logo">QuickSeek</div>

</div>

<!-- HERO IMAGE -->

<div class="hero">

</div>

<!-- MAIN CONTENT -->

<div class="main">

<div class="card-container">

<a href="uploaditem.jsp">
<div class="card">
<h3>Upload Items</h3>
<p>Upload item you found</p>
</div>
</a>

<a href="LostItemServlet">
<div class="card">
<h3>Lost Items</h3>
<p>Reported lost items</p>
</div>
</a>

<a href="FoundItemServlet">
<div class="card">
<h3>Found Items</h3>
<p>Reported found items</p>
</div>
</a>

</div>

</div>

</body>
</html>
