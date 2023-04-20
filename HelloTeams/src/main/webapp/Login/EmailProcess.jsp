<%@page import="utils.AlertFunction"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.FileReader"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String from = "xorbs465@naver.com";
	String username = "xorbs465@naver.com";
	String pass = "tjems159357@";

	Random rand = new Random();
	int randCode = rand.nextInt(900000) + 100000;
	String authCode = Integer.toString((int)randCode);

	session.removeAttribute("code");
	session.setAttribute("code", authCode);
	Properties serverInfo = new Properties();

	serverInfo.put("mail.smtp.host", "smtp.naver.com");
	serverInfo.put("mail.smtp.port", "465");
	serverInfo.put("mail.smtp.auth", "true");
	serverInfo.put("mail.smtp.starttls.enable", "true");
	serverInfo.put("mail.smtp.starttls.required", "true");
	serverInfo.put("mail.smtp.ssl.enable", "true");
	serverInfo.put("mail.smtp.ssl.trust", "smtp.naver.com");
	serverInfo.put("mail.smtp.ssl.protocols", "TLSv1.2");
	serverInfo.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

	Session mailSession = Session.getInstance(serverInfo, new Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
		  	return new PasswordAuthentication(username, pass);
		}
	});

	try {
	  	MimeMessage message = new MimeMessage(mailSession);
	  	message.setFrom(new InternetAddress(from));
	  	message.addRecipient(Message.RecipientType.TO, new InternetAddress(request.getParameter("email")));
	  	message.setSubject("이메일 인증 코드");
	  	message.setText("인증 코드는 " + authCode + " 입니다.");
	  	Transport.send(message);
  		System.out.println("이메일이 성공적으로 전송되었습니다.");
	} catch (MessagingException mex) {
		mex.printStackTrace();
		System.out.println("이메일 전송에 실패했습니다.");
	}
%>



























