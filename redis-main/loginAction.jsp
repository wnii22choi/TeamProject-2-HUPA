<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="redis.clients.jedis.Jedis" %>

<%
// 데이터베이스 연결 정보
String url = "jdbc:mariadb://ca-database1.cnok84amevre.ap-northeast-2.rds.amazonaws.com:3306/cloud_air";
String dbUsername = "admin";
String dbPassword = "password";

// 로그인 폼에서 전송된 데이터 받아오기
String inputUsername = request.getParameter("username");
String inputPassword = request.getParameter("password");

// 데이터베이스 연결
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    // JDBC 드라이버 로드
    Class.forName("org.mariadb.jdbc.Driver");

    // 데이터베이스 연결
    conn = DriverManager.getConnection(url, dbUsername, dbPassword);

    // SQL 쿼리 작성
    String sql = "SELECT * FROM register WHERE username = ? AND password = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, inputUsername);
    pstmt.setString(2, inputPassword);

    // 쿼리 실행
    rs = pstmt.executeQuery();

    // 결과 처리
    if (rs.next()) {
        // Redis에 세션 저장
        Jedis jedis = new Jedis("ca-redis.s1eqg1.clustercfg.apn2.cache.amazonaws.com", 6379);
        String sessionId = session.getId();
        jedis.set(inputUsername, sessionId);

        // 성공 페이지로 리디렉션
        response.sendRedirect("/?userId=" + inputUsername);
    } else {
        out.println("<script>alert('로그인에 실패했습니다. 아이디 또는 비밀번호를 확인하세요.'); history.back();</script>");
    }
} catch (Exception e) {
    out.println("<script>alert('시스템 오류가 발생하였습니다.');</script>");
    e.printStackTrace();
} finally {
    // 리소스 해제
    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
}
%>
