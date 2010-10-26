<%@page pageEncoding="euc-kr"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@page import="kr.pe.okjsp.util.CommonUtil"%>
<%@page import="kr.pe.okjsp.Navigation"%><div id="menuSect">
	<div>
	<img src="/images/skin/white.gif" class="skinButton" onclick="setSkin('white')" alt="white skin"
	><img src="/images/skin/black.gif" class="skinButton" onclick="setSkin('black')" alt="black skin"
	><img src="/images/skin/blue.gif" class="skinButton" onclick="setSkin('blue')" alt="blue skin"
	></div>
	<div>
	<jsp:useBean id="member" class="kr.pe.okjsp.member.Member" scope="session"/>
	<jsp:setProperty name="member" property="id" value='<%= CommonUtil.getCookie(request, "okid") %>' />
	<c:if test="${empty member.id}">
		<a href="/jsp/member/agreement.jsp"><b>join</b></a>
		/
		<a href="<%= Navigation.getPath("LOGFORM") %>">login</a>
	</c:if>
		<SPAN ID="member" style="display:block; margin-left:0px">
		<c:if test="${!empty member.id}">
			<a href="<%= Navigation.getPath("SECURE_DOMAIN") %>/jsp/member/info.jsp" ><b><%= member.getId() %></b> info</a> /
			<a href="/jsp/member/logout.jsp" >logout</a>
			<br>
			<a href="/bbs?act=BOOKMARK" >å����</a>
		</c:if>
		</SPAN>
	</div>
  <hr>
  <A href="/bbs?act=LIST&bbs=notice">��������</A>
  <div class="noticemenu">
  <a href="/jsp/member/agreement.jsp" target="privacy">����������޹�ħ</a>
  </div>
	<hr>ad:
  <div class="noticemenu">
	<A href="/f.jsp?http://www.innorix.com/DS/"
   title="��뷮 ����/���� ���ε� ������Ʈ" target="innorix">���ε�� InnoDS</A>
	<br><A href="/f.jsp?http://www.imaso.co.kr/" title="���α׷��Ӹ� ���� ����" target="imaso">���� Magazine</A>
	<br><A href="/f.jsp?http://bit.ly/9dNuIa" title="�������� �Ʊ⵹���� BabySitter" target="babysitter">[����]�Ʊ⵹���� ��</A>
	<br><A href="/f.jsp?http://bit.ly/cIQ7fA" title="�ȵ���̵� ����ȯ�� ����" target="android">[����]�ȵ���̵� ���߸Ŵ���1</A>
  </div>

<h2 id="bbslistmenu">BBS LIST</h2>
<select id="bbslist" onchange="jumpto(this)" size="18">
<jsp:include page="/jsp/option.jsp"></jsp:include>
</select>
<script type="text/javascript">
	document.getElementById('bbslist').value = '<%= request.getParameter("bbs") %>';
	function jumpto(e) {
		document.location.href='/bbs?act=LIST&bbs='+e.value;
	}
</script>
  <hr>
   <br><A href="http://webdevmobile.com/"
   title="html5, ��Ʈ����, ��������, �����" target="_blank">WebDevMobile</A>
   <br><A href="http://it.nodong.net/zbxe/?mid=JOBQNA01"
   title="ȸ��,����,��� ���� �̾߱� it.nodong.net" target="jobqna">����Q&amp;A</A>
	<hr>
  <br>
  <br><a href="/rss" title="rss feed links"><img src="/images/rss-xml.png" style="border:0" alt="rss"/></a><br>
  <br>

<script type="text/javascript">
	setMenuDefault('menu1');
</script>

<div id="sponsorBanner">
	<div>sponsored by:</div>
	<a href="http://www.80port.com/community" target="_blank"
	 title="www.80port.com
	 okjsp standalone ȣ���� ����, ���� �����ϴ�.">
	<img src="/images/bnr_80port.gif" width="88" height="31" border="0"></a>
	<br />
	<a href="/f.jsp?http://www.cubrid.com/" target="_blank"
	 title="okjsp Database">
	<img src="/images/banner/cubrid_88x31.gif" width="88" height="31" border="0"></a>
</div>
</div>