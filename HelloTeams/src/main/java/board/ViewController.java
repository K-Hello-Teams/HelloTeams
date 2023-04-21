package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.BoardDAO;
import DTO.BoardDTO;


@WebServlet("/board/view.do")
public class ViewController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 게시물 읽어오기
		BoardDAO dao = new BoardDAO();
		String b_id = req.getParameter("b_id");
		dao.updateVisitCount(b_id);	// 조회수 증가
		BoardDTO dto = dao.getView(b_id);	// 내용 읽어오기
		dao.close();
		
		// 줄바꿈
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>"));
		
		// 게시물 뷰로 전달
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/Board/View.jsp").forward(req, resp);

	}
}
