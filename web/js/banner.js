var Banner = {
main : [
{
tag: '<a href="/f.jsp?http://www.devmento.co.kr/devmain/seminar/edumento_detail.jsp?dataSeq=92" target="_blank">' +
'<img src="/images/banner/devmento_mobile_biz_473x98.gif" ' +
'alt="����� ����Ͻ� ���͸��� ã�ƶ�">' +
'</a>'
},
{
tag: '<a href="/f.jsp?http://www.devlec.com/?_pageVariable=OKJSP" target="_blank">' +
'<img src="http://www.devlec.com/images/devlec_okjsp.gif" ' +
'alt="�ƢƢ� ���귺 �ƢƢ� �����ڸ� ���� ���� �ְ� ���α׷��� ���� �������� ����Ʈ">' +
'</a>'
}
],
show : function() {
	var idx = Math.floor(Math.random() * Banner.main.length);
	document.write(this.main[idx].tag);
},

showAside : function() {
	document.write("<ul><li>"+
			"<a href=\"/f.jsp?http://www.uengine.org\" target=\"_blank\">"+
			"<img src=\"http://www.uengine.org/html/images/banner/uengine_banner.gif\" "+
			"	alt=\"������\" ></a>"+
			"</li>"+
			"<li>"+
			"<a href=\"/f.jsp?http://www.apptalk.tv\" target=\"_blank\" >"+
			"<img src=\"/images/banner/apptalk_134x60.jpg\" "+
			"	alt=\"������ ��� ���� ��������. ���� ��� ��, ����\">"+
			"</a>"+
			"</li>"+
			"<li>"+
			"<a href=\"/f.jsp?http://cs.ucloud.com\" target=\"_blank\" >"+
			"<img src=\"/images/banner/ucloud_134x40.gif\" "+
			"	alt=\"KT Ucloud\" ></a>"+
			"</li></ul>");
}

};
