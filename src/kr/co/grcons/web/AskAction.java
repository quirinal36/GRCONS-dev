package kr.co.grcons.web;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import kr.co.grcons.control.AskController;
import kr.co.grcons.vo.Ask;

/**
 * Servlet implementation class AskAction
 */
@WebServlet(description = "견적문의 글작성", urlPatterns= {"/ask/write/action"})
public class AskAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final Logger logger = Logger.getLogger(getClass().getSimpleName());
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AskAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Ask ask = new Ask();
		ask.setName(request.getParameter("name"));
		ask.setPhone(request.getParameter("phone"));
		ask.setContent(request.getParameter("content"));
		
		logger.info(ask.toString());
		
		AskController control = new AskController();
		int result = control.insertAsk(ask);
		JSONObject json = new JSONObject();
		json.put("result", result);
		
		response.getWriter().append(json.toString());
	}

}
