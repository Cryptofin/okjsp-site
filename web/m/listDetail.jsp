<%@ page pageEncoding="euc-kr"
    import="kr.pe.okjsp.util.CommonUtil, java.util.Iterator,
            kr.pe.okjsp.Article,kr.pe.okjsp.util.DateLabel" %>
<%@page import="java.util.Arrays"%>
<% long stime = System.currentTimeMillis(); %>
<%@ taglib uri="/WEB-INF/tld/taglibs-string.tld" prefix="str" %>
<jsp:useBean id="list" class="kr.pe.okjsp.MobileListHandler"/>
<jsp:setProperty name="list" property="*" />
<%
	Iterator iter = list.getList().iterator();
	Article one = null;
%>


<%
while (iter.hasNext()) {
    one = (Article) iter.next();
%>
        <li><!-- ############ IUI List ########### -->
        	<!-- ��ȣ Ŭ���ϸ� �������°� ����:a�� div�� ���� -->
        	<%-- 
            <div class="digg-count"><%= one.getRef() %></div>
            --%>
            <!-- ��� ī��Ʈ �߰� �� showHtml �޼ҵ� �߰�  -->
            <!-- style inline���� �ۿ� ó���� ���ϰ��� From ZKUAHN -->
            <img src="/m/iui/icon_list.png" style="	float: left; height: 35px; width: 46px;	margin: -8px 0 -7px -10px" />
            <a href="/bbs?seq=<%= one.getSeq() %>&mobileView=Y"><%= CommonUtil.showHtml(one.getSubject()) %>
            	&nbsp;<str:replace replace="[0]" with=""><span style="color:#BBB">(<%= one.getMemo() %>)</span></str:replace></a>
        </li>
<%
} // end ifwhile 
int total = list.getCnt();
int pageSize = list.getPageSize();
int pageTotal = (total-1) / pageSize;
boolean hasMorePage = list.getPg() < pageTotal;

if (hasMorePage) {	// Next Page �� ������ Page ��ư �����.
%>
<li><a href="/bbs?act=MLISTDETAIL&bbs=<%=request.getParameter("bbs")%>&pg=<%= list.getPg() + 1 %>" target="_replace">Get Next Page Stories...</a></li>
<% 
} // end if
%>