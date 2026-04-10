<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Admin Panel</title>

<style>

body{
margin:0;
font-family:Arial;
background:black;
color:white;
}

.header{
padding:20px;
text-align:center;
font-size:28px;
font-weight:bold;
}

table{
width:90%;
margin:auto;
border-collapse:collapse;
background:#111;
}

th,td{
padding:12px;
border:1px solid #333;
text-align:center;
}

button{
padding:6px 12px;
border:none;
cursor:pointer;
}

.approve{
background:green;
color:white;
}

.reject{
background:red;
color:white;
}

</style>

</head>

<body>

<div class="header">? Admin Panel</div>

<table>

<tr>
<th>ID</th>
<th>Title</th>
<th>Type</th>
<th>Status</th>
<th>Action</th>
</tr>

<%
ResultSet rs = (ResultSet)request.getAttribute("items");

if(rs != null){
while(rs.next()){
%>

<tr>
<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("title")%></td>
<td><%=rs.getString("type")%></td>
<td><%=rs.getString("status")%></td>

<td>
<form action="ApproveServlet" method="post" style="display:inline;">
<input type="hidden" name="id" value="<%=rs.getInt("id")%>">
<button class="approve">Approve</button>
</form>

<form action="RejectServlet" method="post" style="display:inline;">
<input type="hidden" name="id" value="<%=rs.getInt("id")%>">
<button class="reject">Reject</button>
</form>
</td>

</tr>

<%
}
}
%>

</table>

</body>
</html>