<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Lost Items</title>

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

<div class="header">? Lost Items</div>

<div class="container">

<%
ResultSet rs = (ResultSet)request.getAttribute("items");

boolean hasData = false;

if(rs != null){
    while(rs.next()){
        hasData = true;
        String status = rs.getString("status");
        String title = rs.getString("title");
String location = rs.getString("location");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn2 = DriverManager.getConnection(
"jdbc:oracle:thin:@localhost:1521:XE",
"system",
"345678"
);

PreparedStatement ps2 = conn2.prepareStatement(
"SELECT * FROM items WHERE type='found' AND title=? AND location=? AND status='approved'"
);

ps2.setString(1, title);
ps2.setString(2, location);

ResultSet match = ps2.executeQuery();
%>


<div class="card">
<h3><%=rs.getString("title")%></h3>
<p>Location: <%=rs.getString("location")%></p>
<p>Type: <%=rs.getString("type")%></p>

<span class="status <%=status%>">
<%=status%>
</span>
</div>

<%
    }
}

if(!hasData){
%>

<h2 style="text-align:center;">No Lost Items ?</h2>

<%
}
%>

</div>

</body>
</html>
