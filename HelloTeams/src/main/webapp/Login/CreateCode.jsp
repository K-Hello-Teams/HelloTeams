<%@page import="java.util.*"%>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
// 폼값(이메일 내용) 저장
Random rand = new Random();
int randCode = rand.nextInt(900000) + 100000;

String email = request.getParameter("email");
String authCode = Integer.toString((int) session.getAttribute("randCode"));
String from = "xorbs465@naver.com";
String to = email;
Map<String, String> emailInfo = new HashMap<String, String>();
emailInfo.put(email, authCode);
String host = "smtp.naver.com"; // 이메일 서버 호스트
String username = "xorbs465@naver.com"; // 이메일 계정 아이디
String password = "tjems159357@"; // 이메일 계정 비밀번호

Properties props = new Properties();
props.put("mail.smtp.host", host);
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.port", "465");

Session mailSession = Session.getInstance(props, new Authenticator() {
    protected PasswordAuthentication getPasswordAuthentication() {
      return new PasswordAuthentication(username, password);
    }
  });

  try {
    MimeMessage message = new MimeMessage(mailSession);
    message.setFrom(new InternetAddress(from));
    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
    message.setSubject("이메일 인증 코드");
    message.setText("인증 코드는 " + authCode + " 입니다.");
    Transport.send(message);
    out.println("이메일이 성공적으로 전송되었습니다.");
  } catch (MessagingException mex) {
    mex.printStackTrace();
    out.println("이메일 전송에 실패했습니다.");
  }

  String userCode = request.getParameter("authCode");
  session = request.getSession();
  Map<String, Integer> authMap = (Map<String, Integer>) session.getAttribute("authMap");
  if (authMap != null && authMap.containsKey(email)) {
    randCode = authMap.get(email);
    if (Integer.toString(randCode).equals(userCode)) {
      // 인증 성공
      out.println("이메일 인증이 완료되었습니다.");
    } else {
      // 인증 실패
      out.println("인증 코드가 일치하지 않습니다.");
    }
  } else {
    // 인증 정보가 없음
    out.println("인증 정보를 찾을 수 없습니다.");
  }
%>

























