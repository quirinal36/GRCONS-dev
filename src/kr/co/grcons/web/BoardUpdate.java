package kr.co.grcons.web;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import kr.co.grcons.control.BoardController;
import kr.co.grcons.vo.Board;

/**
 * Servlet implementation class BoardUpdate
 */
@WebServlet("/board/update/action")
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final Logger logger = Logger.getLogger(getClass().getSimpleName());
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdate() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Board board = new Board();
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setId(request.getParameter("id"));
		
		BoardController control = new BoardController();
		int result = control.updateBoard(board);
		
		JSONObject json = new JSONObject();
		json.put("result", result);
		
		response.getWriter().append(json.toString());
	}

}
