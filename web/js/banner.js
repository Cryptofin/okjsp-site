var Banner = {
main : [
{
tag:'<img src="/images/banner/devmento_banner_468x60.gif" usemap="#seminar_banner_Map">' +
	'<map name="seminar_banner_Map">' +
	'<area shape="rect" alt="������� ���̳� ����� ���� ������ & ����" coords="0,0,233,60" href="/f.jsp?http://www.devmento.co.kr/devmain/seminar/edumento_detail.jsp?dataSeq=89" target="_new">' +
	'<area shape="rect" alt="������� ���̳� ���� �� ������ ����� ����" coords="233,0,468,60" href="/f.jsp?http://www.devmento.co.kr/devmain/seminar/edumento_detail.jsp?dataSeq=90" target="_new">' +
	'</map>'
},
{
tag: '<a href="/f.jsp?http://www.devlec.com/?_pageVariable=OKJSP" target="_blank">' +
'<img src="http://www.devlec.com/images/devlec_okjsp.gif" ' +
'alt="�ƢƢ� ���귺 �ƢƢ� �����ڸ� ���� ���� �ְ� ���α׷��� ���� �������� ����Ʈ">' +
'</a>'
}
],
show : function() {
	var index = Math.floor(Math.random() * 2);
	document.write(this.main[index].tag);
}
};
