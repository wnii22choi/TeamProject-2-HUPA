<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Flights</title>
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
    justify-content: space-between; /* 로고와 네비게이션을 양쪽 끝으로 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
}

header img {
    width: 120px;
    height: auto;
}
        .flight-card {
            background-color: #ffffff;
            padding: 20px;
            margin: 20px auto;
            width: 90%;
            max-width: 600px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            display: flex;
            align-items: center;
        }
        .time-part {
            width: 50%;
            text-align: center;
            font-weight: bold;
            position: relative;
        }
        .details-part {
            width: 50%;
            text-align: left;
            padding-left: 20px;
        }
        .flight-time {
            font-size: 18px;
            display: inline-block;
            margin-right: 10px;
        }
        .flight-airport {
            display: inline-block;
            font-size: 16px;
            color: #555;
        }
        .arrow {
            display: inline-block;
            margin: 0 20px;
        }
        .flight-price {
            font-size: 18px;
            color: #0073e6;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .book-button {
            padding: 10px 20px;
            background-color: #0073e6;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 14px;
            text-align: center;
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
    </style>
</head>
<body>
    <header>
        <img src="logo.png" alt="항공사 로고">
        <nav>
            <ul>
                <li><a href="#home">메인</a></li>
                <li><a href="#booking">예약</a></li>
                <li><a href="login.jsp">로그인</a></li>
            </ul>
        </nav>
    </header>
    <div class="flight-card">
        <div class="time-part">
            <span class="flight-time">09:00</span><span class="flight-airport">GMP</span>
            <span class="arrow">&#8594;</span>
            <span class="flight-time">10:45</span><span class="flight-airport">KIX</span>
        </div>
        <div class="details-part">
            <p class="flight-price">₩328,000</p>
            <p>Economy Class - KE2117</p>
            <button class="book-button" onclick="location.href='purchase.jsp';">Book Now</button>
        </div>
    </div>
    <div class="flight-card">
        <div class="time-part">
            <span class="flight-time">12:00</span><span class="flight-airport">GMP</span>
            <span class="arrow">&#8594;</span>
            <span class="flight-time">13:45</span><span class="flight-airport">KIX</span>
        </div>
        <div class="details-part">
            <p class="flight-price">₩358,000</p>
            <p>Business Class - KE2119</p>
            <button class="book-button" onclick="location.href='purchase.jsp';">Book Now</button>
        </div>
    </div>
</body>
</html>
