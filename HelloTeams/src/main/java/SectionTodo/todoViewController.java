package SectionTodo;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.TodoDAO;

@WebServlet("/SectionTodo/View.do")
public class todoViewController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		TodoDAO dao = new TodoDAO();
		
		Map<String,Object> map = new HashMap<>();
		
		String project_id = "0001";
		if(se)
	}
}
