<%@ page pageEncoding="euc-kr"
    import="kr.pe.okjsp.util.CommonUtil, java.util.Iterator,
            kr.pe.okjsp.Article,kr.pe.okjsp.util.DateLabel" %>
<%@page import="java.util.Arrays"%>
<% long stime = System.currentTimeMillis(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<jsp:useBean id="list" class="kr.pe.okjsp.ListHandler"/>
<jsp:useBean id="member" class="kr.pe.okjsp.member.Member" scope="session"/>
<jsp:setProperty name="list" property="*" />
<%
    response.setContentType("text/html");

	Iterator iter = list.getList().iterator();
	Article one = null;
%>


<!-- ############ Header Title ########### -->
<!-- ȭ�� ��ħ ���� ���� id="stats2" �߰�  -->
<ul id="stats2"  title="<c:out value="${bbsInfoMap[list.bbs].header}" escapeXml="false" />">
	<!-- ############ �۾���_�α��� �����϶��� ��Ÿ�� ########### -->
	<% if (member.getSid() != 0) { %>
	<a href="editor_jquery.jsp?bbs=<%= request.getParameter("bbs") %>">�۾���</a>
	<% } %>
	<!-- ############ List & Next Page ########### -->
	<jsp:include page="listDetail.jsp"></jsp:include>
</ul>

