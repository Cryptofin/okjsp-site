var Banner = {
main : [
{
tag: '<a href="/f.jsp?http://www.choongang.co.kr/html/m0_s1_4_s1.asp?id=25205&r=okjsp" target="_blank">' +
'<img src="/images/banner/choongang_473x98.gif" ' +
'alt="[���ױ��񹫷�]2011�� IT��������� ����(�ڹ�,��ݰ���)">' +
'</a>'
},
{
tag: '<a href="/f.jsp?http://www.devmento.co.kr/devmain/seminar/edumento_detail.jsp?dataSeq=101" target="_blank">' +
'<img src="/images/banner/devmento_MS2_473x98.gif" ' +
'alt="���� �������� ���� �� ������ & ����">' +
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

left : [
{
	tag: '<li><A href="/f.jsp?http://www.innorix.com/DS/" title="��뷮 ����/���� ���ε� ������Ʈ" target="innorix">���ε�� InnoDS</A></li>'
},
{
	tag: '<li><A href="/f.jsp?http://okmindmap.com/" title="����� ���� ���ε��, OKJSP ���� �ڱ������ ������ ����" target="imaso">okmindmap</A></li>'
},
{
	tag: '<li><A href="/f.jsp?http://bit.ly/cIQ7fA" title="�ȵ���̵� ����ȯ�� ����" target="android">[����]�ȵ���̵� ���߸Ŵ���1</A></li>'
}
],
footer : [
{
	tag: '<a href="/f.jsp?http://raction.tistory.com/">' +
	'<img src="/images/banner/raction_468x60.png" alt="��¥ ������ �����϶�"></a>'
}
],
show : function() {
	var idx = Math.floor(Math.random() * this.main.length);
	document.write(this.main[idx].tag);
},

showAside : function() {
	document.write("<ul>" +
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

showLeftSide : function() {
	for(var i = 0; i < this.left.length; i++) {
		document.writeln(this.left[i].tag);
	}
},

showContentRight : function() {
	var tag = '<a href="/f.jsp?http://www.kjdc.org/?okjsp"><img src="/images/banner/JCO_250x250.gif" id="contentBanner" '+
		'style="float: right; margin-left: 10px; margin-bottom: 10px;"></a>';
	document.write(tag);
},

showContentSection : function() {
	var idx = Math.floor(Math.random() * this.content.length);
	document.write(this.content[idx].tag);
},

showFooter : function() {
	var idx = Math.floor(Math.random() * this.footer.length);
	document.write(this.footer[idx].tag)
}


};
