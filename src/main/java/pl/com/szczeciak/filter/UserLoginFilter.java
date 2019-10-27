package pl.com.szczeciak.filter;


import org.springframework.web.filter.GenericFilterBean;
import pl.com.szczeciak.user.User;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/docs/*", "/comments/*", "/items/all", "/items/add", "/items/uploadFiles", "/operations/*", "/stations/*", "/users/*", "/home"})
public class UserLoginFilter extends GenericFilterBean {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        if (request instanceof HttpServletRequest) {
            String url = ((HttpServletRequest)request).getRequestURL().toString();
            String queryString = ((HttpServletRequest)request).getQueryString();
            session.setAttribute("requestetUrl", url);
        }

        User user = (User) session.getAttribute("userSession");
        if (user == null) {
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            httpResponse.sendRedirect("/");
        } else {
            chain.doFilter(request, response);
        }
    }
}
