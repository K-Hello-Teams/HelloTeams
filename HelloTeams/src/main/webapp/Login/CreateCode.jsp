<%@page import="java.util.*"%>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
// ����(�̸��� ����) ����
Random rand = new Random();
int randCode = rand.nextInt(900000) + 100000;

String email = request.getParameter("email");
String authCode = Integer.toString((int) session.getAttribute("randCode"));
String from = "xorbs465@naver.com";
String to = email;
Map<String, String> emailInfo = new HashMap<String, String>();
emailInfo.put(email, authCode);
String host = "smtp.naver.com"; // �̸��� ���� ȣ��Ʈ
String username = "xorbs465@naver.com"; // �̸��� ���� ���̵�
String password = "tjems159357@"; // �̸��� ���� ��й�ȣ

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
    message.setSubject("�̸��� ���� �ڵ�");
    message.setText("���� �ڵ�� " + authCode + " �Դϴ�.");
    Transport.send(message);
    out.println("�̸����� ���������� ���۵Ǿ����ϴ�.");
  } catch (MessagingException mex) {
    mex.printStackTrace();
    out.println("�̸��� ���ۿ� �����߽��ϴ�.");
  }

  String userCode = request.getParameter("authCode");
  session = request.getSession();
  Map<String, Integer> authMap = (Map<String, Integer>) session.getAttribute("authMap");
  if (authMap != null && authMap.containsKey(email)) {
    randCode = authMap.get(email);
    if (Integer.toString(randCode).equals(userCode)) {
      // ���� ����
      out.println("�̸��� ������ �Ϸ�Ǿ����ϴ�.");
    } else {
      // ���� ����
      out.println("���� �ڵ尡 ��ġ���� �ʽ��ϴ�.");
    }
  } else {
    // ���� ������ ����
    out.println("���� ������ ã�� �� �����ϴ�.");
  }
%>

























