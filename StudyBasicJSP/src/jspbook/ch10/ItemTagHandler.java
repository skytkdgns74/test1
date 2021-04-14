package jspbook.ch10;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class ItemTagHandler extends SimpleTagSupport {
	
	private String bgcolor;
	private String border;
	
	public void doTag() throws IOException, JspException {
		JspWriter out = getJspContext().getOut();
		
		JspFragment body = getJspBody();
		
		Product product = new Product();
		StringBuffer msg = new StringBuffer();
		if(body != null) {
			out.println("<H2>");
			body.invoke(null);
			out.println("</H2>");
		}
		
		msg.append("<table border=")
		.append(border)
		.append(" bgcolor=")
		.append(bgcolor)
		.append(" width=150>");
		
		out.println(msg.toString());
		
		for(String item : product.getProductList()) {
			out.println("<tr><td>" + item + "</td></td>");
		}
		
		out.println("</table>");
		
	}




	public String getBgcolor() {
		return bgcolor;
	}
	
	public void setBgcolor(String bgcolor) {
		this.bgcolor = bgcolor;
	}
	
	public String getBorder() {
		return border;
	}
	
	public void setBorder(String border) {
		this.border = border;
	}
	
}






