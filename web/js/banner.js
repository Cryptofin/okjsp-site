var Banner = {
main : [
{
tag: '<a href="/f.jsp?http://www.choongang.co.kr/html/m0_s1_4_s1.asp?id=25205&r=okjsp" target="_blank">' +
'<img src="/images/banner/choongang_473x98.gif" ' +
'alt="[���ױ��񹫷�]2011�� IT��������� ����(�ڹ�,��ݰ���)">' +
'</a>'
},
{
tag: '<a href="/f.jsp?http://www.devmento.co.kr/devmain/main.jsp" target="_blank">' +
'<img src="/images/banner/devmento_473x98.gif" ' +
'alt="IT Portal DevMento ����, IT ��� �̽� �������� ����� ������ �� �� �ִ� ��">' +
'</a>'
},
{
tag: '<a href="/f.jsp?http://www.devlec.com/?_pageVariable=OKJSP" target="_blank">' +
'<img src="http://www.devlec.com/images/devlec_okjsp.gif" ' +
'alt="�ƢƢ� ���귺 �ƢƢ� �����ڸ� ���� ���� �ְ� ���α׷��� ���� �������� ����Ʈ">' +
'</a>'
}
],
content : [
{
tag: '<a href="/f.jsp?http://raction.tistory.com/">' +
'<img src="/images/banner/raction_468x60.png" alt="��¥ ������ �����϶�"></a>'
},
{
tag: '<a href="/f.jsp?http://www.dbguide.net/offline.db">' +
'<img src="/images/banner/kdb_468x60.jpg" alt="�ѱ������ͺ��̽������"></a>'
}
],
show : function() {
	var idx = Math.floor(Math.random() * Banner.main.length);
	document.write(this.main[idx].tag);
},

showAside : function() {
	document.write("<ul>" +
			"<li>"+
			"<a href=\"/f.jsp?http://onoffmix.com/event/3010\" target=\"_blank\">"+
			"<img src=\"/images/banner/html5_134x60.jpg\" "+
			"	alt=\"�ǹ� ������ ������ ������ ���� HTML5 ����\" ></a>"+
			"</li>"+
			"<li>"+
			"<a href=\"/f.jsp?http://uengine.org/web/guest/home\" target=\"_blank\">"+
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
},

showContentSection : function() {
	var idx = Math.floor(Math.random() * Banner.content.length);
	document.write(this.content[idx].tag);
}


};
