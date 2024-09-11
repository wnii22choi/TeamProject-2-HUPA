<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Purchase Complete</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
        }
        header {
            background-color: #0073e6;
            color: #ffffff;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header img {
            width: 400px;
            height: auto;
        }
        nav {
            display: flex;
        }
        nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            align-items: center;
        }
        nav ul li {
            margin-left: 20px;
        }
        nav ul li a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
        }
        .container {
            width: 90%;
            max-width: 800px;
            margin: 40px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            text-align: center;
        }
        .header {
            color: #0073e6;
            font-size: 24px;
            margin-bottom: 20px;
        }
        .message {
            font-size: 18px;
            color: #555;
            margin-bottom: 30px;
        }
        .details {
            font-size: 16px;
            color: #666;
            margin-bottom: 10px;
            text-align: left;
            line-height: 1.6;
        }
        .button {
            padding: 10px 20px;
            background-color: #0073e6;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
    </style>
</head>
<header>
    <img src="https://ca-cloud-bucket.s3.ap-northeast-2.amazonaws.com/%EA%B0%9C%EB%B0%9C%EC%9E%90%EB%A3%8C/CloudAir.png" alt="항공사 로고">
    <nav>
        <ul>
            <li><a href="index.jsp">메인</a></li>
            <li><a href="booking.jsp">예약</a></li>
            <li><a href="login.jsp">로그아웃</a></li>
        </ul>
    </nav>
</header>
<body>
    <div class="container">
        <h1 class="header">Purchase Complete</h1>
        <p class="message">Thank you for your purchase. Your flight tickets have been successfully booked.</p>
        <div>
            <p class="details"><strong>Flight:</strong> KE112</p>
            <p class="details"><strong>From:</strong> ICN Seoul/Incheon to HND Tokyo/Haneda</p>
            <p class="details"><strong>Date:</strong> 2024-09-08 (Sat)</p>
            <p class="details"><strong>Departure:</strong> 09:00, <strong>Arrival:</strong> 11:15</p>
            <p class="details"><strong>Class:</strong> Business (J)</p>
        </div>
        <button class="button" onclick="window.location.href='/?userId=" + inputUsername + "&sessionId=" + sessionId';">Return to Main Page</button>
    </div>
</body>
</html>
