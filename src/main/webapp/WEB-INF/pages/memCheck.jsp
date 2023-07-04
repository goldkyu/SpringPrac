<%@ page language="java" contentType="text/html;charset =utf-8"
pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@page import="java.sql.*" %>
<% 
        String id = request.getParameter("userID");
        String pw = request.getParameter("userPW");
        String name = request.getParameter("uName");
        String userEmail = request.getParameter("userEmail") + "@" + request.getParameter("email_back");
        String uBirth = request.getParameter("uBirthYear") + "-" + request.getParameter("uBirthMonth") + "-" + request.getParameter("uBirthDay");
        String uAd = request.getParameter("uAd") +" "+  request.getParameter("uExAd");
        String userPnum = request.getParameter("userPnum");

        java.util.Date now = new java.util.Date();
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
        String datetime = sdf.format(now);


        Connection conn = null;
        Statement st = null;

        try {
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://13.209.21.167:3306/LOGODB?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false", "logouser", "1234");
            if (conn == null) {
                throw new Exception("데베 연결 없음");
            }
            st = conn.createStatement();

            String command = String.format("insert into u_information values ('%s','%s','%s','%s','%s','%s','%s','%s');", id,pw,name,uBirth,userEmail,userPnum,uAd,datetime);

            int rowNum = st.executeUpdate(command);
            if(rowNum < 1){
                response.sendRedirect("join.jsp");
            }
            }finally{
                try {
                    st.close();
                } catch (Exception ignored) {
                }
            }try {
                conn.close();
            } catch (Exception ignored) {
            }
            

            response.sendRedirect("index.jsp");
        
            
%>