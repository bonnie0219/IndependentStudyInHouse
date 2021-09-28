package tw.InHouse.login.controller;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.stereotype.Component;

@Component
@WebListener
public class SessionCountListener  implements HttpSessionListener {

	private int onlineCount = 0;
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		onlineCount++;
        System.out.println("HttpSessionListener sessionCreated onlineCount:"+onlineCount);
		se.getSession().getServletContext().setAttribute("onlineCount", onlineCount);
	}
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		onlineCount--;
		System.out.println("HttpSessionListener sessionDestroyed onlineCount:"+onlineCount);
		se.getSession().getServletContext().setAttribute("onlineCount:", onlineCount);
	}
}
