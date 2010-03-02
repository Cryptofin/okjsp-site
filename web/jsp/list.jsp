<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page pageEncoding="euc-kr"
    import="kr.pe.okjsp.util.CommonUtil, java.util.Iterator,
            kr.pe.okjsp.Article,kr.pe.okjsp.util.DateLabel" %>
<%@page import="java.util.Map"%>
<%@page import="kr.pe.okjsp.BbsInfoBean"%>
<%@page import="java.util.Arrays"%>
<% long stime = System.currentTimeMillis(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib uri="/WEB-INF/tld/ok-taglib.tld" prefix="okbbs" %>
<%@ taglib uri="/WEB-INF/tld/taglibs-string.tld" prefix="str" %>
<jsp:useBean id="list" class="kr.pe.okjsp.ListHandler"/>
<jsp:setProperty name="list" property="*" />
<%
    response.setContentType("text/html");

	Iterator iter = list.getList().iterator();
	Article one = null;
%>

<%@page import="kr.pe.okjsp.ArticleDao"%><html>
<head>
<META HTTP-EQUIV="Content-type" CONTENT="text/html;charset=ksc5601">
<title>okjsp</title>
    <script src="/js/okjsp.js"></script>
    <script src="/js/bannerData.js"></script>
    <script src='/js/okboard.js'></script>
<link rel="stylesheet" href="/css/okjsp2007.css.jsp" type="text/css">
<link rel="alternate" type="application/rss+xml" title="<c:out value="${bbsInfoMap[list.bbs].name}" />"
     href="http://www.okjsp.pe.kr/rss/okjsp-rss2.jsp?bbs=<%= list.getBbs() %>">
</head>
<body class="body" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<jsp:include page="/top.jsp" />
<table class="bbsTable">
  <tr>
    <td width='120' valign='top'>
      <jsp:include page="/menu.jsp" />
    </td>
    <td valign='top'>
    <div style="font-size:10pt;font-weight:bold;margin:3px;padding:3px;">
      <c:out value="${requestScope.header}" escapeXml="false" /><br/>
      <c:out value="${bbsInfoMap[list.bbs].header}" escapeXml="false" />
    </div>
    <div class="tablestyle" style="font-size:10pt;font-weight:bold;padding:3px 0px">
<%
	Map map = (Map)application.getAttribute("bbsInfoMap");
	if (map != null) {
%>
<form name="navi" style="margin:0">
<select id="bbsids" onchange="jump()">
<jsp:include page="/jsp/option.jsp"></jsp:include>
</select>
[<c:out value="${list.cnt}" />]
</form>
<script type="text/javascript">
	document.getElementById("bbsids").value = "<%= request.getParameter("bbs") %>";
	function jump() {
		document.location.href='/bbs?act=LIST&bbs='+document.getElementById('bbsids').value;
	}
</script>
<%
	}
%>

    </div>
<!--<%= System.currentTimeMillis()-stime %>-->
<table class="tablestyle" border="0" cellpadding="3" cellspacing="1">
<%
	boolean isAdBBS = "recruit".equals(list.getBbs()) && list.getPg() < 1;
	if (isAdBBS) {
		int [] seqs = {146988, 148318};
		ArticleDao articleDao = new ArticleDao();
		for(int seq : seqs) {
			Article article = articleDao.getArticle(seq);
%>
    <tr class="body" align="center">
        <td class="ref tiny" style="width: 40px; font-weight: bold;">AD</td>
        <td class="subject" style="text-align: left">
            <a href="/seq/<%= article.getSeq() %>" style="font-weight:bold"><%= article.getSubject() %></a>
        </td>
        <td class="writer"><div><b><%= article.getWriter() %></b></div></td>
        <td class="writer"><img src="/profile/base/default.jpg" style="width: 14px; height: 14px;" alt="<%= article.getWriter() %>"/></td>
        <td class="read tiny"><b><%= article.getRead() %></b></td>
        <td class="when tiny" title="<%= article.getWhen("yy-MM-dd HH:mm") %>">
        <b><%= DateLabel.getTimeDiffLabel(article.getWhen()) %></b></td>
    </tr>
<%
		} // end for
	} // end if 
String keyword = CommonUtil.nchk(request.getParameter("keyword"));
String link = "&bbs="+request.getParameter("bbs")+
              "&keyfield="+CommonUtil.nchk(request.getParameter("keyfield"), "content")+
              "&keyword="+java.net.URLEncoder.encode(keyword, "8859_1");
int oldRef = -1;  // �׷��ȣ�� ������ ���� ��� �׷��ȣ ��� ����

while (iter.hasNext()) {
    one = (Article) iter.next();
%>
    <tr class="<%= (one.getLev()==0)?"body":"reply" %>" align="center">
        <td class="ref tiny">
        <% if (oldRef!=one.getRef()) out.println(one.getRef()); %>
        </td>
        <td class="subject">
            <div>
            <a href="/seq/<%= one.getSeq() %>" >
            <okbbs:mark word='<%= keyword %>'>
<%= CommonUtil.showHtml(one.getSubject()) %>&nbsp;
            </okbbs:mark>
        <span class="tiny"><str:replace replace="[0]" with="">[<%= one.getMemo() %>]</str:replace></span>
            </a>
            </div>
        </td>
        <td class="writer"><div><%= one.getWriter() %> </div></td>
        <td class="writer"><%
    if (one.getId() != null) {
        %><img src="/profile/<%= one.getId() %>.jpg"
        	alt="<%= one.getId() %>"
        	style="width:14px;height:14px"
        	onerror="this.src='/images/spacer.gif'"><%
    }
        	%></td>
        <td class="read tiny"><%= one.getRead() %></td>
        <td class="when tiny" title="<%= one.getWhen("yy-MM-dd HH:mm") %>">
        <%= DateLabel.getTimeDiffLabel(one.getWhen()) %></td>
    </tr>
<%
    oldRef = one.getRef();  // �׷��ȣ�� ����� ���´�.
}
%>
    <tr>
    <td colspan="7" class="td" align="center">
<%
link = "/bbs?act=LIST"+link;
request.setAttribute("total", ""+list.getCnt());
request.setAttribute("pageSize", ""+list.getPageSize());
%>
<okbbs:page link='<%= link %>'
            beginlabel="ó�� "
            endlabel=" ��"
            prevlabel="������ "
            nextlabel=" ������"
            pagegroupsize="10" />
    </td>
    </tr>
    <tr>
    <td colspan="7" class="td">
<form name="nav">

<select name="keyfield">
    <option value="subject">����</option>
    <option value="content">����</option>
    <option value="writer">�ۼ���</option>
</select>

<input type="text" name="keyword" value="<%= CommonUtil.a2k(keyword) %>">
<input type="submit" value="�˻�">
<input type="hidden" name="act"      value="LIST">
<input type="hidden" name="bbs"      value="<%= request.getParameter("bbs") %>">
<input type="hidden" name="seq">
</form>
<a href="javascript:write()">�۾���</a>
<a href="/site2009/editor_jquery.jsp?bbs=<%= request.getParameter("bbs") %>">���ο� �۾���</a>
(�α��� �ʿ�)
    </td>
    </tr>
</table>

<%
	// ���� �˻� mashup
	if ( keyword.length() > 0) {
%>
<div class="tablestyle searchDaum">
<jsp:include page="/mashup/daumSearch.jsp"></jsp:include>
</div>
<%
	}
	String bbs = request.getParameter("bbs");
%>
<jsp:include page="/footer.jsp" >
	<jsp:param name="bbs" value="<%= bbs %>"/>
</jsp:include>
        </td>
    </tr>
</table>
<script>
opt(document.nav.keyfield, '<c:out value="${param.keyfield}"/>');

function clearPage() {
    document.nav.act.value = "LIST";
    document.nav.pg.value = 0;
}

function write() {
    document.nav.act.value = "ADD";
    document.nav.submit();
}

function view(n) {
    document.nav.act.value = "VIEW";
    document.nav.seq.value = n;
    document.nav.submit();
}

</script>
<!--<%=System.currentTimeMillis()-stime %>-->
<jsp:include page="/googleAnalytics.jsp" />
</body>
</html>
