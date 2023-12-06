package Controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SeachDomainController", value = "/search-domain")
public class SeachDomainController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String txtSearch = request.getParameter("txt");
        String idDomain = request.getParameter("idDomain");
        request.setAttribute("domain", idDomain);
        request.setAttribute("searchDate", txtSearch);
        request.getRequestDispatcher("ajax/ajax-search-domain.jsp").forward(request, response);
    }
}
