<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="login.css">
	<title>Project Management Tool</title>
</head>
<body>

    <div class="parent">
    	<form class="container" method="post" action="loginpage">
    	  <h2>Login</h2>
            <div>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username">
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password">
                </div>
                <button tupe="submit" name="btn" value="login_btn">Login</button><br><br>
            </div>
            <button id="register" name="btn" value="register_btn">Sign up</button>
        </form>
    </div>
</body>
</html>