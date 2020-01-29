package kr.co.grcons.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.grcons.vo.Waste;

/**
 * Servlet implementation class InsertRecord
 */
@WebServlet("/insert/record")
public class InsertRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertRecord() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String year = request.getParameter("year");
		String company = request.getParameter("company");
		String title = request.getParameter("title");
		String budget = request.getParameter("budget");
		
		System.out.println(year);
		System.out.println(company);
		System.out.println(title);
		System.out.println(budget);
		
		Waste waste = new Waste();
		waste.setYear(year);
		waste.setCompany(company);
		waste.setTitle(title);
		waste.setBudget(Integer.parseInt(budget));
		
		/*
		RecordController control = new RecordController();
		int result = control.insert(waste);
		
		response.setContentType("text/html; charset=utf-8;");
		if(result > 0) {
			response.getWriter().append("글 저장에 성공했습니다.");
		}
		*/
	}

}
