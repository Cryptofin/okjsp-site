var Banner = {
main : {
	url:'http://www.devmento.co.kr/devmain/seminar/edumento_detail.jsp?dataSeq=89',
	src:'/images/banner/devmento_banner_468x60.gif',
	alt:'������� ���̳� ����� ���� ������ & ����, ���� �� ������ ����� ����'
		},
show : function() {
	document.write(
'<img src="' + this.main.src +'" usemap="#seminar_banner_Map">' +
'<map name="seminar_banner_Map">' +
'<area shape="rect" alt="������� ���̳� ����� ���� ������ & ����" coords="0,0,233,60" href="/f.jsp?http://www.devmento.co.kr/devmain/seminar/edumento_detail.jsp?dataSeq=89" target="_new">' +
'<area shape="rect" alt="������� ���̳� ���� �� ������ ����� ����" coords="233,0,468,60" href="/f.jsp?http://www.devmento.co.kr/devmain/seminar/edumento_detail.jsp?dataSeq=90" target="_new">' +
'</map>'
	);
}
};
