<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
// 데이터베이스 연결 정보
// 데이터베이스 연결 정보
String url = "jdbc:mariadb://ca-database1.cnok84amevre.ap-northeast-2.rds.amazonaws.com:3306/cloud_air"; // RDS 엔드포인트로 변경된 데이터베이스 URL
String dbUsername = "admin"; // RDS 설정 사용자 이름
String dbPassword = "password"; // RDS 설정 비밀번호


// 회원가입 폼에서 전송된 데이터 받아오기
String inputUsername = request.getParameter("username");
String inputPassword = request.getParameter("password");

// 데이터베이스 연결
Connection conn = null;
PreparedStatement pstmt = null;
try {
    Class.forName("org.mariadb.jdbc.Driver");
    conn = DriverManager.getConnection(url, dbUsername, dbPassword);

    // SQL 쿼리 작성
    String sql = "INSERT INTO register (username, password) VALUES (?, ?)";

    // PreparedStatement를 사용하여 SQL 쿼리 실행
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, inputUsername);
    pstmt.setString(2, inputPassword);

    // 쿼리 실행
    int rowsAffected = pstmt.executeUpdate();

    if (rowsAffected > 0) {
        // 회원가입 성공
        out.println("<script type='text/javascript'>alert('회원가입에 성공했습니다. 로그인 페이지로 이동합니다.');location.href='login.jsp';</script>");
    } else {
        // 회원가입 실패
        out.println("<script type='text/javascript'>alert('회원가입에 실패했습니다. 다시 시도해주세요.');location.href='register.jsp';</script>");
    }
} catch (SQLException e) {
    // 데이터베이스 연결 오류 발생
    out.println("<script type='text/javascript'>alert('데이터베이스 연결 오류 발생!');</script>");
    e.printStackTrace();
} catch (ClassNotFoundException e) {
    // JDBC 드라이버 클래스를 찾을 수 없음
    out.println("<script type='text/javascript'>alert('JDBC 드라이버 클래스를 찾을 수 없습니다!');</script>");
    e.printStackTrace();
} finally {
    // 리소스 해제
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
