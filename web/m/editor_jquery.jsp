<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="kr.pe.okjsp.util.CommonUtil"%>
<jsp:useBean id="member" class="kr.pe.okjsp.member.Member" scope="session"/>

<%
	String bbs = CommonUtil.nchk(request.getParameter("bbs"), "perf");

	if(member.getSid() == 0) {
		response.sendRedirect("https://www.okjsp.pe.kr/jsp/member/loginMobile.jsp?returnPath=/m/editor.jsp?bbs=" + bbs);
		return; 
	}
%>
<html>
<head>
<META HTTP-EQUIV="Content-type" CONTENT="text/html;charset=ksc5601">

<!-- ############ IUI Header Start ########### -->
<meta name="viewport" content="width=320; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;"/>
<link rel="apple-touch-icon" href="/m/iui/iui-logo-touch-icon.png" />
<meta name="apple-touch-fullscreen" content="YES" />
<style type="text/css" media="screen">@import "/m/iui/iui.css";</style>
<script type="application/x-javascript" src="/m/iui/iui.js"></script>
<!-- ############ IUI Header End ########### -->

</head>
<!-- ############ �۾���_start ########### -->
<body>
    <div title="�۾���" id="insert">
    	<!-- target="_self"�����ؼ� ȭ�� ������ ���� �ذ� -->
    	<!-- iui.js���� ���� -->
    	<fieldset>
	    <form action="/writemobile"  method="post">
	    
	        <div class="row">
	            <label>bbs</label>
	            <select name="bbs" id="bbs" style="font-size:20px;font-family:Arial;width:200px">
					<jsp:include page="/jsp/option.jsp"></jsp:include>
				</select>
				<script type="text/javascript">
					document.getElementById('bbs').value = '<%= bbs %>';
				</script>
	        </div>
	        <div class="row">
	            <label>Writer</label>
	            <input type="text" name="writer" id="writer" style="font-size:20px;font-family:Arial"/>
	        </div>
	        <div class="row">
	            <label>homepage</label>
	            <input type="text" name="homepage" id="homepage" style="font-size:20px;font-family:Arial"/>
	        </div>
	        <div class="row">
	            <label>password</label>
	            <input type="password" name="password"  id="password" style="font-size:20px;font-family:Arial"/>
	        </div>
	        <div class="row">
	            <label>CCL</label>
	            <select name="ccl_id" id="ccl_id" style="font-size:20px;font-family:Arial;width:200px">
					<option value="0">Copyright-�����ڿ��� ���۱�</option>
					<option value="1">CCL-������ǥ��</option>
					<option value="2">CCL-������ǥ��-�������Ǻ������</option>
					<option value="3">CCL-������ǥ��-�������</option>
					<option value="4">CCL-������ǥ��-�񿵸�</option>
					<option value="5">CCL-������ǥ��-�񿵸�-�������Ǻ������</option>
					<option value="6">CCL-������ǥ��-�񿵸�-�������</option>
				</select>
	        </div>
	        <div class="row">
	            <label>Subject</label>
	            <input type="text" name="subject" id="subject" style="font-size:20px;font-family:Arial"/>
	        </div>
	        <div class="row">
	            <label>Content</label>
	            <!-- msgbackup:��� ���� ��... -->
	            <input type="hidden" name="msgbackup" id="msgbackup">
	            <textarea name="content" id="content" style="font-size:20px;font-family:Arial;width:320px"></textarea>
	        </div>
	    	<div class="row"><br/>
	    		<a class="whiteButton" type="submit" href="#" target="_self">����</a><br/>
	    	</div>
	    </form>
	    </fieldset>
    </div>
</body>
<!-- ############ �۾���_end ########### -->
</html>
