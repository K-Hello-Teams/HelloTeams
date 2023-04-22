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
		
		String name = req.getParameter("regName");
		String id = req.getParameter("regID");
		String pw = req.getParameter("regPW");
		String email = req.getParameter("reqEmail");
		
		dto.setName(name);
		dto.setId(id);
		dto.setPw(pw);
		dto.setEmail(email);
		
		int result = 0;	
		result=dao.createMember(dto);
		dao.close();
		
		if(result == 1) {
			AlertFunction.alertLocation(resp, "회원가입 완료", "../Login/LoginPage.jsp");
		}
	}
}


























