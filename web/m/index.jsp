<%@ page import="java.util.*, java.sql.*, kr.pe.okjsp.util.*, kr.pe.okjsp.BbsInfoBean, kr.pe.okjsp.ListHandler" contentType='text/html;charset=euc-kr' %>
<jsp:useBean id="member" class="kr.pe.okjsp.member.Member" scope="session"/>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.1//EN" "http://www.openmobilealliance.org/tech/DTD/xhtml-mobile11.dtd">
<html>
<head>
<title>OKJSP</title>
<META HTTP-EQUIV="Content-type" CONTENT="text/html;charset=ksc5601">
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;"/>
<link rel="apple-touch-icon" href="/m/images/okJSP.png" />
<meta name="apple-touch-fullscreen" content="YES" />
<style type="text/css" media="screen">@import "/m/iui/iui.css";</style>
<script type="application/x-javascript" src="/m/iui/iui.js"></script>
</head>
<body>

<!-- ---------- .toolbar ---------- -->
    <div class="toolbar">
        <h1 id="pageTitle">OKJSP</h1>
        <a id="backButton" class="button" href="#"></a>
<%		
	if (member.getSid() != 0) { 
%>
		<a class="newButton" href="editor_jquery.jsp" target="_iui"></a>
<% 		
	} else { 
%>
        <a class="button" href="#loginForm" onclick="document.getElementById('artist').focus()">Login</a>
<%		
	} 
%>
    </div>
<!-- ----------/.toolbar ---------- -->   

<!-- ---------- #list ---------- -->
    <ul id="home" title="OKJSP" selected="true">
		<li class="group">Recent Posting Lists</li>
<%		
	HashMap map = (HashMap)application.getAttribute("bbsInfoMap");
	HashMap newList = new ListHandler().getRecentBbsListWithCount(3);
		
	if(newList.size() == 0) {									
%>
		<li>
			���� �ö�� ���� �����ϴ�.
		</li>
<%
	} else {
			
		int listSize = (Integer)newList.get("nCount");
				
		for(int i=0; i<=listSize; i++) {
			BbsInfoBean bbsInfo = (BbsInfoBean)map.get(newList.get("bbsid["+i+"]"));			    
%>
        <li class="recentList">
            <img src="/m/iui/icon_new.png" /><a href="/bbs?act=MLIST&bbs=<%=bbsInfo.getBbs()%>"  target="_iui"><%=bbsInfo.getName()%> 
            <span style="color:#BBB">(<%=newList.get("cnt["+i+"]")%>)</span></a>
        </li>
<%
		}
	}
%>
		<li class="group">All Board Lists</li>
		<li class="recentList">
 			<img src="/m/iui/icon_all.png" /><a href="recentDetail.jsp" target="_iui">�ֱٱ� �Խ���</a>
		</li>		
		<li>
 			<img src="/m/iui/icon_all.png" /><a href="" target="_iui">��ü �Խ���</a>			
		</li>
    	<li class="group">Book</li>
		<script type="text/javascript">
		
			var kangcomList = [
				  	{code:'201004050002',path:'2010/04',ext:'jpg',comment:'���ʺ��� 2D�� 3D �׷���, �ִϸ��̼�, ���� ���α׷��ֱ��� �÷���/�÷��� �׼ǽ�ũ��Ʈ�� ��� ��'},
				  	{code:'201004020012',path:'2010/04',ext:'jpg',comment:'CPU 100%�� ���� ���� ���� �������ϴ�. ���� ȿ�������� ���� �ϱ� ���� ���ÿ��� ��𸶸����� ���'},
					{code:'200908210008',path:'2009/09',ext:'jpg',comment:'�ƻ�ٰ� ������ ������ �� �ִ� �� �ƴմϴ�. ���߾���� ���� �����Դϴ�.'},
		  		];
		
			function showKangcomBook(kangcomCode) {
				// http://image3.kangcom.com/2009/03/l_pic/200903110001.jpg
				if (kangcomCode != null) {
				var imageUrl = "http://image3.kangcom.com/" + kangcomCode.path + "/b_pic/" + kangcomCode.code + '.' + kangcomCode.ext;

				document.write("<li><a href=\"http://kangcom.com/common/bookinfo/bookinfo.asp?sku="+kangcomCode.code+"\" title=\""+kangcomCode.comment+"\" target=\"_new\" class=\"book\"><img src=\""+imageUrl+"\"/>"+kangcomCode.comment+"</div></a></li>");
				
				// document.write('<div class="row" style="text-align:left; padding:0 10px 0 10px;">\
				// 	<a href="http://kangcom.com/common/bookinfo/bookinfo.asp?sku='+kangcomCode.code+'"\
				// 	title="'+kangcomCode.comment+'">\
				// 	<img src="'+imageUrl+'">\
				// 	</a></div>');
		
				}
			}
		
			for (var i = 0; i < kangcomList.length && i < 6 ; i++) {
				showKangcomBook(kangcomList[i]);
			}
			
		</script>		
		<li style="text-align: center;">
<%
			String bannerPath = "/images/banner/VS10_W1StdTextSP_G_468x60_V.gif";
			String bannerTitle = "VSTS2010";
			String bannerLink = "/f.jsp?http://ad99.feeldmc.com/adv.dmc?m=adver&c=1554&s=3775&a=20131&ac=1";
%>
			<div style="margin:0 0 0 -10px;text-align:center;">
			 <a href="<%= bannerLink %>" title="<%= bannerTitle %>" target="_blank" style="background-image: none;">
			 	<img src="<%= bannerPath %>" border="0" width="300">
			 </a>
			</div>
		</li>						
    </ul>
<!-- ----------/#list ---------- -->
	
<!-- ---------- #loginForm ---------- -->	
    <form id="loginForm" class="dialog" method="POST" target="_self" action="/jsp/member/loginMobile.jsp" >
        <fieldset>
            <h1>Login</h1>
            <a class="button cancelButton" type="cancel" href="#">Cancel</a>
			<a class="button blueButton" type="submit" href="#">Login</a>
            <label>ID</label>
            <input id="artist" type="text" name="id" />
            <label>PW</label>
            <input type="password" name="password"/>
        </fieldset>
    </form>
<!-- ----------/#loginForm ---------- -->
    
</body>
</html>
