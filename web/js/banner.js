var Banner = {
main : [
{
tag: '<a href="/f.jsp?http://www.devmento.co.kr/devmain/shop/shop_list.jsp" target="_blank">' +
'<img src="/images/banner/devmento_duoback_478x93.gif" ' +
'alt="��� ���� ���� ����� ��Ʈ">' +
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
	document.write(this.main[1].tag);
	document.write('</li><li>');
	document.write(this.main[0].tag);
}
};
