<!DOCTYPE html>
<html>
<head>
<title>Upload Item</title>

<style>

body{
margin:0;
height:100vh;
display:flex;
justify-content:center;
align-items:center;
font-family:Arial;

/* Gradient background */
background: linear-gradient(135deg, #000000, #1a1a1a, #000000);
}

/* GLASS CARD */

.form-container{
width:350px;
padding:35px;
border-radius:15px;

/* glass effect */
background: rgba(255,255,255,0.05);
backdrop-filter: blur(10px);

box-shadow:0 0 25px rgba(0,0,0,0.6);
}

/* TITLE */

h2{
color:white;
text-align:center;
margin-bottom:25px;
}

/* INPUT */

input, select{
width:100%;
padding:12px;
margin-bottom:15px;
border:none;
border-radius:8px;

background:rgba(255,255,255,0.1);
color:white;
outline:none;
}

/* INPUT FOCUS EFFECT */

input:focus, select:focus{
border:1px solid #FFD700;
}

/* BUTTON */

button{
width:100%;
padding:12px;
border:none;
border-radius:8px;
font-weight:bold;
cursor:pointer;

/* gradient yellow */
background: linear-gradient(45deg, #FFD700, #ffae00);
color:black;

/* glow */
box-shadow:0 0 15px rgba(255,215,0,0.6);
transition:0.3s;
}

button:hover{
transform:scale(1.05);
box-shadow:0 0 25px rgba(255,215,0,1);
}

/* LABEL */

label{
color:#ccc;
font-size:14px;
}

</style>

</head>

<body>

<div class="form-container">

<h2>? Upload Item</h2>

<form action="UploadItemServlet" method="post">

<label>Title</label>
<input type="text" name="title" placeholder="Enter item name" required>

<label>Description</label>
<input type="text" name="description" placeholder="Enter details" required>

<label>Location</label>
<input type="text" name="location" placeholder="Where did you find it?" required>

<label>Phone</label>
<input type="tel" name="phone" placeholder="Enter contact number" required>


<label>Type</label>
<select name="type">
<option value="found">Found</option>
<option value="lost">Lost</option>
</select>

<button type="submit">Upload Item</button>

</form>

</div>

</body>
</html>