<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>My Items</title>

<style>

body{
margin:0;
font-family:Arial;
background:linear-gradient(135deg,#000,#1a1a1a);
color:white;
}

/* HEADER */

.header{
padding:20px;
text-align:center;
font-size:28px;
font-weight:bold;
}

/* GRID */

.container{
display:grid;
grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
gap:20px;
padding:30px;
}

/* CARD */

.card{
background:rgba(255,255,255,0.05);
backdrop-filter:blur(10px);
padding:20px;
border-radius:12px;
box-shadow:0 0 15px rgba(0,0,0,0.5);
transition:0.3s;
}

.card:hover{
transform:scale(1.05);
}

/* STATUS COLORS */

.status{
padding:5px 10px;
border-radius:5px;
font-size:12px;
}

.pending{background:orange;}
.approved{background:green;}
.found{background:blue;}

</style>

</head>

<body>

<div class="header">? My Uploaded Items</div>

<div class="container">

<%
ResultSet rs = (ResultSet)request.getAttribute("items");

if(rs != null){
while(rs.next()){
String status = rs.getString("status");
%>

<div class="card">

<h3><%=rs.getString("title")%></h3>
<p><b>Location:</b> <%=rs.getString("location")%></p>
<p><b>Type:</b> <%=rs.getString("type")%></p>

<span class="status <%=status%>">
<%=status%>
</span>

</div>

<%
}
}else
%>

</div>

</body>
</html>