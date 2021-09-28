package tw.InHouse.message;

import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;

@ServerEndpoint(value = "/websocket/{nickname}")
@Component
public class MyWebSocket {
	
	private static CopyOnWriteArraySet<MyWebSocket> webSocketSet = new CopyOnWriteArraySet<MyWebSocket>();
	
	private Session session;
	
	private String nickname;
	
	@OnOpen
	public void onOpen(Session session, @PathParam("nickname") String nickname) {
		
		this.session = session;
		this.nickname = nickname;  
		
		webSocketSet.add(this);
		
		System.out.println("有新連接加入:"+nickname+", 目前在線人數為"+ webSocketSet.size());
		
		//this.session.getAsyncRemote().sendText("恭喜您成功連接上聊天室, 目前在線人數為"+ webSocketSet.size());
		//this.session.getAsyncRemote().sendText("歡迎使用線上客服");
	}
	
	
	@OnClose
	public void onClose() {
		webSocketSet.remove(this);
		
		System.out.println("有一連接關閉, 目前在線人數為"+ webSocketSet.size());
	}
	
	@OnMessage
	public void onMessage(String message, Session session, @PathParam("nickname") String nickname) {
		System.out.println("來自 "+nickname+" 的消息 : " + message);
		
		//群發消息
		boradcast(nickname+"："+message);
	}
	
	private void boradcast(String message) {
		for ( MyWebSocket item : webSocketSet) {
			item.session.getAsyncRemote().sendText(message);
		}
		
	}


	@OnError
	public void onError(Session session, Throwable error) {
		System.out.println("發生錯誤");
		
		error.printStackTrace();
	}
}
