<%@ page language="java" contentType="text/html;charset =utf-8"
pageEncoding="utf-8" %>
<%@page import="java.sql.*" %>

<html>
  <head>
    <meta charset="utf-8" />
    <title>jsp BASE</title>
  </head>

  <body>
    <% request.setCharacterEncoding("utf-8"); %>
    <% String id = request.getParameter("userID"); %> 

    <%
    Connection conn = null;
    Statement st = null;
    int idCheck = 0;


    try {
    	Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://13.209.21.167:3306/LOGODB?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false", "logouser", "1234");
        //localhost:3306/테이블 이름, root, 비밀번호

        if (conn == null) {
            throw new Exception("데베 연결 없음");
        }

        st = conn.createStatement();
        ResultSet rs = st.executeQuery("select u_id from u_information where u_id = '" + id + "';");
        if (!rs.next() && !id.equals("")) {
                out.println("사용 가능한 아이디 입니다.");
                idCheck = 1;
            }
            else if(id.equals("")){
                out.println("입력칸이 빈 칸 입니다.");
                idCheck = 0;
            }
            else{
                out.println("중복 아이디가 존재합니다.");
                idCheck = 0;
            }
        }
        
    finally {
        try {
            st.close();
        } catch (Exception ignored) {
        }
    } try {
        conn.close();
    } catch (Exception ignored) {
    }
    %>

    <%if(idCheck == 1){ %>
    <button onclick="javascript= self.close();
    window.opener.document.getElementById('userIDinput').value = '<%= id %>';
    window.opener.document.getElementById('userIDinput').readOnly = true;">확인</button>
    <%} else {%>
    <button onclick="javascript= self.close();
    window.opener.document.getElementById('userIDinput').value = '';">확인</button>
        
    <%}%>
  </body>
</html>