<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="register.css">
	<title></title>
</head>
<body>
	<div class="container">
        <h2>Register</h2>
        <div id="content">
	        <form method="post" action="registerpage">
	            <div class="input-group">
	                <label for="username">Username*:</label>
	                <input type="text" id="username" name="username">
	            </div>
	            <div class="input-group">
	                <label for="fname">First Name*:</label>
	                <input type="text" id="fname" name="fname">
	            </div>
	            <div class="input-group">
	                <label for="lname">Last Name:</label>
	                <input type="text" id="lname" name="lname">
	            </div>
	            <div class="input-group">
	                <label for="phone">Phone No.:</label>
	                <input type="number" id="phone" name="phone">
	            </div>
	            <div class="input-group">
	                <label for="email">Email Id*:</label>
	                <input type="email" id="email" name="email">
	            </div>
	            <div class="input-group">
	                <label for="password">Password*:</label>
	                <input type="password" id="password" name="password">
	            </div>
	            <div class="input-group">
	                <label for="Cpassword">Confirm Password*:</label>
	                <input type="password" id="Cpassword" name="Cpassword">
	            </div>

	            <button type="submit" class="signup-btn" name="btn" value="signup">Sign Up</button>
	            <button class="signup-btn" name="btn" value="signin">Login</button>
	        </form>
	        
    	</div>
    </div>
</body>
</html>