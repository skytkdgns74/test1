package jspbook.ch10;

import java.io.IOException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class MsgTagSimpleHandler extends SimpleTagSupport {
	//시작 태그를 만나면 호출되는 메서드
	public void odTag() throws IOException {
		JspWriter out=getJspContext().getOut();
		out.println("커스텀 태그 출력 메시지: Hello!!");

	}
}
