package kr.co.grcons.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import kr.co.grcons.control.BoardController;
import kr.co.grcons.vo.Board;

/**
 * Servlet implementation class BoardDelete
 */
@WebServlet("/board/delete/action")
public class BoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Board board = new Board();
		board.setId(request.getParameter("id"));
		
		BoardController control = new BoardController();
		int result = control.deleteBoard(board);
		
		JSONObject json = new JSONObject();
		json.put("result", result);
		
		response.getWriter().append(json.toString());
	}

}
