<%@ page isErrorPage="true" contentType="text/html; charset=euc-kr"%>
<center>
<font style="font-size:10pt; font-family:����;">
<%if (exception instanceof java.lang.ClassNotFoundException) {%>
JDBC ����̹��� ���� �� �����ϴ�.<br><br>
: <%=System.getProperty("java.class.path")%><br><br>
<%} else if (exception instanceof java.sql.SQLException) {%>
�����ͺ��̽� ó���� ������ �ֽ��ϴ�. <br><br>
������ ���� ������ �߻��Ͽ����ϴ�.<br><br>
: <%= exception.toString() %><br><br>
<%} else {%>
���α׷� ó���� ������ �ֽ��ϴ�. <br><br>
������ ���� ������ �߻��Ͽ����ϴ�. <br><br>
: <%= exception.toString() %><br><br>
<%}%>
�����ڿ��� �����Ͻʽÿ�.<br><br>
<a href="#" onClick="javascript:history.back(-1);">����������</a>
</font>
</center>
