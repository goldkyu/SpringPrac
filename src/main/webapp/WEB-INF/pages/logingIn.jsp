<%@ page language="java" contentType="text/html;charset =utf-8"
pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@page import="java.sql.*" %>
<% 
        String id = request.getParameter("inputID");
        String pw = request.getParameter("inputPW");


        Connection conn = null;
        Statement st = null;

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://13.209.21.167:3306/LOGODB?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false", "logouser", "1234");
            if (conn == null) {
                throw new Exception("데베 연결 없음");
            }
            st = conn.createStatement();

            ResultSet rs = st.executeQuery("select u_password from u_information where u_id = '" + id + "';");
            if (!rs.next()) {
                    
                    
                    %>
                    <script>
                        alert("아이디가 존재하지 않습니다.");
                        history.back();
                    </script> 
                    <%
                }
                else if(!rs.getString("u_password").equals(pw)){
                    
                    
                    %>
                    <script>
                        alert("비밀번호가 틀렸습니다.");
                        history.back();
                    </script> 
                    <%
                }
                else{
                    
                    session.setAttribute("userID", id);
                    String fromURL = request.getParameter("from"); // 로그인을 요청한 페이지로 돌아가게 (만드는중)
                    %>
                    <script>
                    alert("로그인 성공.");
                    </script> 
                    <%
                    response.sendRedirect("index"); 
                }
            }
            finally{
                try {
                    st.close();
                } catch (Exception ignored) {
                }
            }try {
                conn.close();
            } catch (Exception ignored) {
            }
            
            
            
        
            
%>