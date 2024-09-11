<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, redis.clients.jedis.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f7fa;
    color: #333;
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


main {
    padding: 40px 20px;
}

.search-fields {
    background-color: #e8eff5;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
}

.search-fields input[type="text"] {
    border: 2px solid #0073e6;
    border-radius: 5px;
    padding: 10px;
    width: calc(50% - 22px);
    margin-right: 10px;
}

.search-fields button {
    background-color: #0073e6;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
}

.flight-info p {
    padding: 20px;
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

footer {
    background-color: #003d66;
    color: white;
    text-align: center;
    padding: 10px;
    position: fixed;
    width: 100%;
    bottom: 0;
}
/* Recommended Destinations Cards */
.recommended-destinations {
    display: flex;
    justify-content: space-around;
    margin-bottom: 40px;
    flex-wrap: wrap; /* 화면 크기에 따라 카드를 줄바꿈 */
}

.destination-card {
    width: 30%;
    margin: 10px; /* 간격 조정 */
    box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    border-radius: 10px;
    overflow: hidden;
    text-align: center;
    background-color: #fff;
    transition: transform 0.3s, box-shadow 0.3s; /* 부드러운 변환 효과 */
    cursor: pointer; /* 호버 시 커서 변경 */
}

.destination-image {
    height: 200px;
    background-size: cover;
    background-position: center;
}

.destination-card p {
    padding: 10px;
    font-size: 16px;
    color: #333;
}

/* 호버 효과 추가 */
.destination-card:hover {
    transform: translateY(-5px); /* 카드를 약간 위로 이동 */
    box-shadow: 0 4px 8px rgba(0,0,0,0.3); /* 그림자 강조 */
}

.special-deals {
    padding: 40px 20px;
    background-color: #ffffff;
    text-align: center;
    margin-top: 20px;
}

.special-deals h2 {
    color: #003d66;
    margin-bottom: 25px;
    font-size: 24px;
}

.deal-container {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
}

.deal-card {
    width: 300px;
    margin: 10px;
    background-color: #f9f9f9;
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 6px 16px rgba(0,0,0,0.1);
    transition: transform 0.3s;
    cursor: pointer;
}

.deal-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 24px rgba(0,0,0,0.2);
}

.deal-image {
    height: 180px;
    background-size: cover;
    background-position: center;
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
}

.deal-content {
    padding: 15px;
    text-align: left;
}

.deal-content p {
    margin: 0;
    font-size: 18px;
    color: #333;
}

.price {
    font-size: 20px;
    font-weight: bold;
    color: #d44;
    float: right;
    background-color: rgba(255, 255, 255, 0.9);
    padding: 5px 10px;
    margin-top: 5px;
    border-radius: 5px;
}

.special-deals {
    background-color: #AED6F1; /* 파스텔 스카이 블루 */
    padding: 20px;
    margin-top: 20px;
    border-radius: 8px; /* 섹션 모서리를 둥글게 처리 */
    box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* 섬세한 그림자 효과 */
}

</style>

<script>
function searchFlights() {
    var from = document.getElementById('from').value;
    var to = document.getElementById('to').value;
    var displaySection = document.getElementById('flight-info');

    if (from === '서울' && to === '도쿄') {
        displaySection.innerHTML = `
            <a href='economyTicket.jsp' class="flight-card">
                <p>Date: 2024-09-01 - Economy - ₩328,000</p>
            </a>
            <a href='/ticket?userId=<%= userId %>&sessionId=<%= compareSessionId' class="flight-card">
                <p>Date: 2024-09-08 - Business - ₩458,000</p>
            </a>
            <a href='firstClassTicket.jsp' class="flight-card">
                <p>Date: 2024-09-03 - First Class - ₩828,000</p>
            </a>
        `;
    } else {
        displaySection.innerHTML = '검색 결과가 없습니다.';
    }
    return false; // 폼 제출 방지
}
</script>
</head>
<body>
    <header>
        <img src="https://ca-cloud-bucket.s3.ap-northeast-2.amazonaws.com/%EA%B0%9C%EB%B0%9C%EC%9E%90%EB%A3%8C/CloudAir.png" alt="항공사 로고">
        <nav>
            <ul>
                <%
                   
                    String RsessionId = request.getRequestedSessionId();
                    String compareSessionId = session.getId();
                    String sessionId = request.getParameter("sessionId");
                    String userId = request.getParameter("userId");
                    
                    Jedis jedis = new Jedis("ca-redis.s1eqg1.clustercfg.apn2.cache.amazonaws.com", 6379); 
                     String redisSessionId = null;

                     if (userId != null && !userId.equals("null")) {
                %> redisSessionId = jedis.get(userId);
                }

                     if (userId == null || userId.equals("null")) {
                %>
                    <li><a href="/">메인</a></li>
                    <li><a href="/login">로그인</a></li>
                <% 
                } else {
                    if (!userId.equals("null") && redisSessionId != null) {
                %>
                        <li><a href="/?userId=<%= userId %>">메인</a></li>
                        <li><a href="/board?userId=<%= userId %>">예약</a></li>
                        <li>
                            <span><%= userId %>님 환영합니다.</span>
                        <a href="/">로그아웃</a>
                        </li>
                    <% 
                    } else {
                    %>
                        <li><a href="/">HOME</a></li>
                        <li><a href="/login">Login</a></li>
                    <% 
                    }
                } 
                %>
            </ul>
        </nav>
    </header>
    <main>
        <section class="booking">
            <form onsubmit="return searchFlights();">
                <div class="search-fields">
                    <input type="text" placeholder="출발지" id="from">
                    <input type="text" placeholder="도착지" id="to">
                    <button type="submit">항공편 검색</button>
                </div>
            </form>
        </section>
        <section class="flight-info" id="flight-info">
            <p>여기에 항공편 정보를 표시합니다.</p>
        </section>
        <section class="recommended-destinations">
            <div class="destination-card" onclick="location.href='tokyo.jsp';">
                <div class="destination-image" style="background-image: url('https://ca-cloud-bucket.s3.ap-northeast-2.amazonaws.com/%EA%B0%9C%EB%B0%9C%EC%9E%90%EB%A3%8C/dokyo.png');"></div>
                <p>도쿄 - 일본의 현대적인 수도</p>
            </div>
            <div class="destination-card" onclick="location.href='bali.jsp';">
                <div class="destination-image" style="background-image: url('https://ca-cloud-bucket.s3.ap-northeast-2.amazonaws.com/%EA%B0%9C%EB%B0%9C%EC%9E%90%EB%A3%8C/bali.png');"></div>
                <p>발리 - 인도네시아의 천국</p>
            </div>
            <div class="destination-card" onclick="location.href='paris.jsp';">
                <div class="destination-image" style="background-image: url('https://ca-cloud-bucket.s3.ap-northeast-2.amazonaws.com/%EA%B0%9C%EB%B0%9C%EC%9E%90%EB%A3%8C/paris.png');"></div>
                <p>파리 - 사랑의 도시</p>
            </div>
        </section>
     <section class="special-deals">
    <h2>특가 티켓</h2>
    <div class="deal-container">
        <div class="deal-card" onclick="location.href='specialDealTokyo.jsp';">
            <div class="deal-image" style="background-image: url('https://ca-cloud-bucket.s3.ap-northeast-2.amazonaws.com/%EA%B0%9C%EB%B0%9C%EC%9E%90%EB%A3%8C/praha.png');"></div>
            <div class="deal-content">
                <p>프라하 - 한정 특가!</p>
                <span class="price">₩299,000</span>
            </div>
        </div>
        <div class="deal-card" onclick="location.href='specialDealBali.jsp';">
            <div class="deal-image" style="background-image: url('https://ca-cloud-bucket.s3.ap-northeast-2.amazonaws.com/%EA%B0%9C%EB%B0%9C%EC%9E%90%EB%A3%8C/sydney.png');"></div>
            <div class="deal-content">
                <p>시드니 - 초특가 세일!</p>
                <span class="price">₩399,000</span>
            </div>
        </div>
    </div>
</section>
    </main>
    <footer>
        <p>© 2023 항공 예매 사이트. 모든 권리 보유.</p>
    </footer>
</body>
</html>

