<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Track lost</title>

<style>
body{
margin:0;
font-family:Arial;
background:linear-gradient(135deg,#000,#1a1a1a);
color:white;
}

.header{
padding:20px;
text-align:center;
font-size:28px;
font-weight:bold;
}

.container{
display:grid;
grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
gap:20px;
padding:30px;
}

.card{
background:rgba(255,255,255,0.05);
backdrop-filter:blur(10px);
padding:20px;
border-radius:12px;
box-shadow:0 0 15px rgba(0,0,0,0.5);
}

.status{
padding:5px 10px;
border-radius:5px;
font-size:12px;
}

.pending{background:orange;}
.approved{background:green;}
</style>

</head>

<body>

<div class="header"> Track lost</div>

<div class="container">

<%
ResultSet rs = (ResultSet)request.getAttribute("items");

boolean hasData = false;

if(rs != null){
    while(rs.next()){
        hasData = true;
        String status = rs.getString("status");
%>

<div class="card">
<h3><%=rs.getString("title")%></h3>
<p>Location: <%=rs.getString("location")%></p>
<p>Status: <%=status%></p>
</div>

<%
    }
}

if(!hasData){
%>

<h2 style="text-align:center;">No Lost Items </h2>

<%
}
%>

</div>

</body>
</html>