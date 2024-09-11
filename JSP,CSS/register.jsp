<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* 회원가입 페이지 전용 스타일 */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f7fa;
        }
        .register-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
            width: 320px;
        }
        .register-form input,
        .register-form button {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .register-form button {
            background-color: #0073e6;
            color: white;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }
        .register-form h2 {
            text-align: center;
            color: #333;
        }
        .register-form label {
            display: block;
            margin-top: 20px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <form class="register-form" action="registerAction.jsp" method="post">
            <h2>Register</h2>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Choose a username" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Choose a password" required>
            
           
            
            <button type="submit">Register</button>
        </form>
    </div>
</body>
</html>
