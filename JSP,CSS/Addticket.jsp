<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Tickets</title>
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
    width: 400px;
    height: auto;
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
        .ticket {
            background-color: #f8f8f8;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .ticket h2 {
            color: #0073e6;
            font-size: 18px;
            margin-bottom: 10px;
        }
        .details {
            font-size: 16px;
            color: #666;
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <header>
        <img src="https://ca-cloud-bucket.s3.ap-northeast-2.amazonaws.com/%EA%B0%9C%EB%B0%9C%EC%9E%90%EB%A3%8C/CloudAir.png" alt="항공사 로고">
        <nav>
            <ul>
                <li><a href="/">메인</a></li>
                <li><a href="logout.jsp">로그아웃</a></li>
            </ul>
        </nav>
    </header>
    <div class="container">
        <h1 class="header">Your Purchased Tickets</h1>
        <div class="ticket">
            <h2>Flight KE112</h2>
            <p class="details"><strong>From:</strong> ICN Seoul/Incheon to HND Tokyo/Haneda</p>
            <p class="details"><strong>Date:</strong> 2024-09-08 (Sat)</p>
            <p class="details"><strong>Departure:</strong> 09:00, <strong>Arrival:</strong> 11:15</p>
            <p class="details"><strong>Class:</strong> Business (J)</p>
        </div>
        <!-- You can add more static ticket entries here if needed -->
    </div>
</body>
</html>
