package Login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MemberDAO;
import DTO.MemberDTO;
import utils.AlertFunction;

@WebServlet("/Login/createMem.do")
public class CreateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/Login/RegMember.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		int result = 0;
		dto.setName(req.getParameter("user_name"));
		dto.setId(req.getParameter("user_id"));
		dto.setPw(req.getParameter("user_pw"));
		dto.setEmail(req.getParameter("user_email"));
		result=dao.createMember(dto);
		dao.close();
		
		if(result == 1) {
			AlertFunction.alertLocation(resp, "회원가입 완료", "../Login/LoginPage.jsp");
		}
	}
}


























