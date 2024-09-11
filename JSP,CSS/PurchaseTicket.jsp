<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Purchase Ticket</title>
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
            max-width: 1000px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .ticket-info, .passenger-form {
            background-color: #f8f8f8;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 10px;
            border: 1px solid #ccc;
        }
        .ticket-details {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
        }
        .details {
            flex-basis: 20%;
            min-width: 160px;
            margin: 5px 0;
        }
        .flight-icon {
            font-size: 20px;
            color: #0073e6;
            margin-right: 10px;
        }
        .book-button, .submit-button {
            padding: 10px 20px;
            background-color: #0073e6;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 14px;
            text-align: center;
        }
        .form-field {
            margin: 10px 0;
        }
        .form-input, select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <header>
        <img src="https://ca-cloud-bucket.s3.ap-northeast-2.amazonaws.com/%EA%B0%9C%EB%B0%9C%EC%9E%90%EB%A3%8C/CloudAir.png" alt="항공사 로고">
        <nav>
            <ul>
                <li><a href="#home">메인</a></li>
                <li><a href="#booking">예약</a></li>
              <li><a href="login.jsp">로그아웃</a></li>
            </ul>
        </nav>
    </header>
    <div class="container">
        <div class="ticket-info">
            <div class="ticket-details">
                <span class="flight-icon">&#9992;</span>
                <span class="details"><strong>Flight:</strong> KE112</span>
                <span class="details"><strong>From:</strong> ICN Seoul/Incheon → HND Tokyo/Haneda</span>
                <span class="details"><strong>Date:</strong> 2024-09-08 </span>
                <span class="details"><strong>Time:</strong> 09:00 - 11:15</span>
                <span class="details"><strong>Class:</strong> Business (J)</span>
            </div>
        </div>
        <div class="passenger-form">
            <div class="section-header">Passenger Information</div>
            <div class="form-field">
                <label>User ID</label>
                <input type="text" class="form-input" placeholder="e.g., KIMYUNBI">
            </div>
            <div class="form-field">
                <label>Gender:</label>
                <select class="form-input">
                    <option>Male</option>
                    <option>Female</option>
                    <option>Other</option>
                </select>
            </div>
            
          <button class="submit-button" onclick="location.href='/purchaseAction.jsp';">Complete Purchase</button>
        </div>
    </div>
</body>
</html>
