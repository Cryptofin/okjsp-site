var Banner = {
main : [
{
tag: '<a href="/f.jsp?http://www.choongang.co.kr/html/m0_s1_4_s1.asp?id=26200" target="_blank">' +
'<img src="/images/banner/choongang_473x98.gif" ' +
'alt="�������� IT ��������� ����"></a>'
},
{
    tag: '<a href="/f.jsp?http://www.devlec.com/?_pageVariable=OKJSP" target="_blank">' +
    '<img src="http://www.devlec.com/images/devlec_okjsp.gif" ' +
    'alt="�ƢƢ� ���귺 �ƢƢ� �����ڸ� ���� ���� �ְ� ���α׷��� ���� �������� ����Ʈ"></a>'
}
],

contentRight : [
],

content : [
{
    tag: '<a href="/f.jsp?http://www.gsion.com/?okjsp" target="_blank">' +
    '<img src="http://www.GSION.com/Files/NIF/201107/jsp���.JPG" ' +
    'alt="����ó��������� ��� �� �����̿������� Ȯ���ϼ���!"></a>'
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

aside : [
 {
tag : "<li>"+
"<a href=\"/f.jsp?http://www.devmento.co.kr\" target=\"_blank\" >"+
"<img src=\"/images/banner/devmento_134x60.gif\" "+
"   alt=\"�����ڵ��� ���İ��� ���� �������\">"+
"</a>"+
"</li>"
 },
 {
 tag : "<li>"+
 "<a href=\"/f.jsp?http://project.oss.kr/?okjsp\" target=\"_blank\" >"+
 "<img src=\"/images/banner/opensw_134x40.gif\" "+
 "  alt=\"2011 ����SW�����ڴ�ȸ\">"+
 "</a>"+
 "</li>"
},
 {
tag : "<li>"+
 "<a href=\"/f.jsp?http://cs.ucloud.com\" target=\"_blank\" >"+
 "<img src=\"/images/banner/ucloud_134x40.gif\" "+
 "  alt=\"KT Ucloud\" ></a>"+
 "</li>"
 }
],
show : function() {
    var idx = Math.floor(Math.random() * this.main.length);
    document.write(this.main[idx].tag);
},

showAside : function() {
    document.writeln("<ul>");
    for(var i = 0; i < this.aside.length; i++) {
        document.writeln(this.aside[i].tag);
    }
    document.writeln("</ul>");
},

showLeftSide : function() {
    for(var i = 0; i < this.left.length; i++) {
        document.writeln(this.left[i].tag);
    }
},

showContentRight : function() {
    if (this.contentRight.length > 0) {
        var idx = Math.floor(Math.random() * this.contentRight.length);
        document.write(this.contentRight[idx].tag);
    }
},

showContentSection : function() {
    if (this.content.length > 0) {
        var idx = Math.floor(Math.random() * this.content.length);
        document.write(this.content[idx].tag);
    }
},

showFooter : function() {
    var idx = Math.floor(Math.random() * this.footer.length);
    document.write(this.footer[idx].tag)
}


};
