<%@page import="com.ckeditor.samples.ConfigurationHelper"%>
<%@page import="com.ckeditor.CKEditorConfig"%>
<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<html>
	<body>
     <%
	CKEditorConfig settings = new CKEditorConfig();
	settings.addConfigValue("toolbar","[{name: 'document', items: ['Source', '-', 'NewPage']},'/', {name: 'styles', items: ['Styles','Format']} ]");
%>
 <ckeditor:replace replace="editor1" basePath="ckeditor/"
   config="<%= ConfigurationHelper.createConfig() %>"
   events="<%= ConfigurationHelper.createEventHandlers() %>" />
<ckeditor:replace replace="editor1" basePath="/ckeditor/" config="<%=settings %>" />
		<form action="sample_posteddata.jsp" method="get">
			<p>
				<label for="editor1">Editor 1:</label>
				<textarea cols="80" id="editor1" name="editor1" rows="10"></textarea>
			</p>
			<p>
				<input type="submit" value="Submit" />
			</p>
		</form>
	<ckeditor:replace replace="editor1" basePath="/ckeditor/" />
	</body>	
</html>