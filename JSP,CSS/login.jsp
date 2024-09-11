<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        /* 로그인 페이지 전용 스타일 */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f7fa;
            font-family: Arial, sans-serif;
        }
        .login-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 6px 16px rgba(0,0,0,0.2);
            width: 340px;
        }
        .login-form input,
        .login-form button {
            width: 100%;
            padding: 12px;
            margin-top: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            box-sizing: border-box; /* 추가된 스타일 */
        }
        .login-form button {
            background-color: #0056b3;
            color: white;
            font-size: 16px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .login-form button:hover {
            background-color: #004494;
        }
        .login-form h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .login-form label { /* 레이블 스타일 추가 */
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .action-buttons a {
            text-decoration: none;
            color: #0056b3;
            font-weight: bold;
        }
        .action-buttons a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <form class="login-form" action="loginAction.jsp" method="post">
            <h2>Login</h2>
            <div>
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" placeholder="Username" required>
            </div>
            <div>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Password" required>
            </div>
            <button type="submit">Login</button>
            <div class="action-buttons">
                <p><a href="register.jsp">Register</a> | <a href="index.jsp">Home</a></p>
            </div>
        </form>
    </div>
</body>
</html>
