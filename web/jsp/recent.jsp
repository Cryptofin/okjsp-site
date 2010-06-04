<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<%@ page errorPage="/jsp/error.jsp"
    import="kr.pe.okjsp.*,
    	    kr.pe.okjsp.util.CommonUtil,
    	    kr.pe.okjsp.util.DateLabel,
            java.util.*,
            java.util.Iterator"
    pageEncoding="euc-kr"
%><%@ taglib uri="/WEB-INF/tld/taglibs-string.tld" prefix="str"
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
    <title>NEW OKJSP with CUBRID</title>
    <script type="text/javascript" src="/js/okjsp.js"></script>
    <script type="text/javascript" src="/js/bannerData.js"></script>
    <!-- Dependencies --> 
	<script src="http://yui.yahooapis.com/2.7.0/build/yahoo-dom-event/yahoo-dom-event.js" type="text/javascript"></script> 
 
	<!-- Source file --> 
	<script src="http://yui.yahooapis.com/2.7.0/build/animation/animation-min.js" type="text/javascript"></script> 
    <LINK rel="STYLESHEET" type="TEXT/CSS" HREF="/css/okjsp2007.css.jsp">
</head>

<body class="body" style="margin:0">
<jsp:include page="/top.jsp" />
<table class="mainTable">
  <tr>
    <td width='120' valign='top'>
      <jsp:include page="/menu.jsp" />
    </td>
    <td valign='top'>
<div id="banner_top" style="margin:4px;text-align:center">
<a href="http://www.acornpub.co.kr/" target="_blank">
<img src="/images/banner/acornpub_468x60.gif">
</a>
</div>

<table width="600" border="0" cellspacing="0">
  <tr>
    <td align="center" valign="top">
<div id="bookList">
<div style="float:none; margin: 6px 0 0;"><b># OKJSP ��õ ����</b></div>
<script type="text/javascript">
function showKangcomBook(kangcomCode) {
	// http://image3.kangcom.com/2009/03/l_pic/200903110001.jpg
	if (kangcomCode != null){
	var imageUrl = "http://image3.kangcom.com/" + kangcomCode.path
	    + "/b_pic/" + kangcomCode.code + '.' + kangcomCode.ext; 
  document.write('<div class="book">\
<a href="http://kangcom.com/common/bookinfo/bookinfo.asp?sku='+kangcomCode.code+'"\
title="'+kangcomCode.comment+'">\
<img src="'+imageUrl+'" class="bookimg">\
</a></div>');
	}
}
var kangcomList = [
 {code:'201004050002',path:'2010/04',ext:'jpg',comment:'���ʺ��� 2D�� 3D �׷���, �ִϸ��̼�, ���� ���α׷��ֱ��� �÷���/�÷��� �׼ǽ�ũ��Ʈ�� ��� ��'},
 {code:'201004020012',path:'2010/04',ext:'jpg',comment:'CPU 100%�� ���� ���� ���� �������ϴ�. ���� ȿ�������� ���� �ϱ� ���� ���ÿ��� ��𸶸����� ���'},
 {code:'200908210008',path:'2009/09',ext:'jpg',comment:'�ƻ�ٰ� ������ ������ �� �ִ� �� �ƴմϴ�. ���߾���� ���� �����Դϴ�.'},
];

for (var i = 0; i < kangcomList.length && i < 6 ; i++) {
	showKangcomBook(kangcomList[i]);
}
	</script>
</div>
<!-- �ֽ� �� ����Ʈ -->
<%
	long sTime=System.currentTimeMillis();
	Iterator iterList = null;
	Article one = null;
%>
<table class="tablestyle">
<%
	ArrayList arrayList = new ArrayList();
	arrayList.add("notice|��������");

	Iterator iter = arrayList.iterator();
	String [] rec = null;

	while(iter.hasNext()) {
	    rec = ((String)iter.next()).split("\\|");
%>
<tr>
    <td colspan="5" class="th">
<a href="/bbs?act=LIST&bbs=<%= rec[0] %>">
<b><%= rec[1] %></b>
</a>
    </td>
</tr>
<%

	iterList = getCachedList(rec[0]);
	while (iterList.hasNext()) {
	    one = (Article) iterList.next();
    %>
    <tr align="center">
        <td class="ref tiny"><%= one.getRef() %></td>
        <td class="subject"><div>
            <a href="/seq/<%= one.getSeq() %>">
            <%= CommonUtil.rplc(one.getSubject(), "<", "&lt;") %>
            </a>
        <span class="tiny"><str:replace replace="[0]" with="">[<%= one.getMemo() %>]</str:replace></span>
        </div>
        </td>
        <td class="writer"><div><%= CommonUtil.rplc(one.getWriter(), "<", "&lt;") %></div></td>
        <td class="id"><div><%
	    if (one.getId() != null) {
	        %><img src="/profile/<%= one.getId() %>.jpg"
	        	alt="<%= one.getId() %>"
	        	style="width:14px;height:14px"
	        	onerror="this.src='/images/spacer.gif'"><%
	    }
        	%></div></td>
        <td class="when tiny" title="<%= one.getWhen() %>">
        <%= DateLabel.getTimeDiffLabel(one.getWhen()) %></td>
    </tr>
<% } %>
<!--<%= System.currentTimeMillis()-sTime %>-->
<%
} // end of while iter();
%>
<tr>
    <td colspan="5" class="th">
<b>��ü �Խ���</b>
    </td>
</tr>
<tr align="center">
	<td><div style="overflow: hidden; width: 73px; height: 12px;">
		<a href="/seq/28685">�Ӹ������°�</a></div>
	</td>
    <td class="subject">
    	<div>
	    	<a href="/seq/28685"><��> �Ǹ������α׷����ǵ�����</a>
        </div>
	</td>
	<td class="writer"><div>����</div></td>
	<td class="id"></td>
	<td title="2003" class="when tiny">2003</td>
    </tr><%
	HashMap bbsInfoMap = (HashMap)application.getAttribute("bbsInfoMap");
	iterList = list.getAllRecentList(48).iterator();
	int i = 0;
	while (iterList.hasNext() && i < 40) {

	    one = (Article) iterList.next();
	    BbsInfoBean bbsInfo = ((BbsInfoBean)(bbsInfoMap.get(one.getBbs())));
	    if (bbsInfo == null) {
	    	bbsInfo = new BbsInfoBean();
	    }
    	
	    // ������� ������Ʈ �����߿��� �׽�Ʈ ����Ÿ��
    	// twitter �� null �� �������� �ʽ��ϴ�.
    	if (bbsInfo.getCseq() == null || "".equals(bbsInfo.getCseq()) || "twitter".equals(bbsInfo.getBbs())) {
    		continue;
    	}
    	
	    if ("2".equals(bbsInfo.getCseq())) {
	    	continue;
	    }
	    i++;
%>
    <tr align="center">
        <td><div style="width:73px;height:12px;overflow:hidden">
        <a href="/bbs?act=LIST&bbs=<%= one.getBbs() %>">
        <%= bbsInfo.getName() %></a></div></td>
        <td class="subject"><div>
            <a href="/seq/<%= one.getSeq() %>">
            <%= CommonUtil.rplc(one.getSubject(), "<", "&lt;") %>
            </a>
        <span class="tiny">[<%= one.getMemo() %>]</span>
        </div>
        </td>
        <td class="writer"><div><%= CommonUtil.rplc(one.getWriter(), "<", "&lt;") %></div></td>
        <td class="id"><div><%
    if (one.getId() != null) {
        %><img src="/profile/<%= one.getId() %>.jpg"
        	alt="<%= one.getId() %>"
        	style="width:14px;height:14px"
        	onerror="this.src='/images/spacer.gif'"><%
    }
        	%></div></td>
        <td class="when tiny" title="<%= one.getWhen() %>">
        <%= DateLabel.getTimeDiffLabel(one.getWhen()) %></td>
    </tr>
<%
	}
%></table>
    </td>
  </tr>
</table>

<jsp:include page="/footer.jsp" />
    </td>
  </tr>
</table>
<div id="sub_panel">
	<div id="ad_banners">
		<ul>
		<li>
		<a href="/f.jsp?http://www.adoberia.co.kr/iwt/blog/blog.php?tn=flex&id=468&src=image&kw=00003B" target="_blank"
		><img src="/images/banner/welove_134x60.gif"
			alt="WE Love the Web, Flash, HTML5, Choice"
		></a>
		</li>
		<li>
		<a href="/f.jsp?http://www.apptalk.tv" target="_blank"
		><img src="/images/banner/apptalk_134x60.jpg"
			alt="������ ��� ���� ��������. ���� ��� ��, ����"
		></a>
		</li>
		<li>
		<a href="/f.jsp?http://www.devgear.co.kr/" target="_blank"
		><img src="/images/banner/embarcadero_134x60.gif"
			alt="���ߵ����� ��, ������ Ʃ���Դϴ�."
		></a>
		</li>
		</ul>
		<p id="adinfo"><a href="/seq/137659">������</a>
		</p>
	</div>
	<div id="imaso_div">
	<script type="text/javascript"><!--
imaso_ad_client = "pub-31415924";
//-->
</script> 
<script type="text/javascript" src="http://widget.imaso.co.kr/pagead/show_ads.js"></script>
	</div>
</div>
<jsp:include page="/googleAnalytics.jsp" />
</body>
</html>
<%!
	ListHandler list = new ListHandler();
	Iterator getCachedList(String bbsid) {
		Iterator iter = null;
		try {
			iter = list.getRecentList(bbsid, 5).iterator();
		} catch(Exception e) {
			iter = new ArrayList().iterator();
		}
		return iter;
	}

%>