<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>

<%
// 데이터베이스 연결 정보
String url = "jdbc:mariadb://ca-database1.cnok84amevre.ap-northeast-2.rds.amazonaws.com:3306/cloud_air"; // 데이터베이스 URL
String dbUsername = "admin"; // 데이터베이스 사용자 이름
String dbPassword = "password"; // 데이터베이스 비밀번호

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

    // PreparedStatement를 사용하여 SQL 쿼리 실행 준비
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, inputUsername);
    pstmt.setString(2, inputPassword);

    // 쿼리 실행
    rs = pstmt.executeQuery();

    // 결과 처리
    if (rs.next()) {
        // 로그인 성공
        out.println("<script>alert('로그인에 성공했습니다. 홈페이지로 이동합니다.'); location.href='index.jsp';</script>");
    } else {
        // 로그인 실패
        out.println("<script>alert('로그인에 실패했습니다. 아이디 또는 비밀번호를 확인하세요.'); history.back();</script>");
    }
} catch (SQLException e) {
    // 데이터베이스 연결 오류 발생
    out.println("<h1>데이터베이스 연결 오류 발생!</h1>");
    e.printStackTrace();
} catch (ClassNotFoundException e) {
    // JDBC 드라이버 클래스를 찾을 수 없음
    out.println("<h1>JDBC 드라이버 클래스를 찾을 수 없습니다!</h1>");
    e.printStackTrace();
} finally {
    // 리소스 해제
    if (rs != null) {
        try {
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    if (pstmt != null) {
        try {
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    if (conn != null) {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
%>
