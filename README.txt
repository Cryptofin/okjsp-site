
okjsp-site �ҽ�
kenu@okjsp.pe.kr

2004-08-09 2:17����
�ٿ�ε�
(������ http://okjsp.pe.kr/lecture/viewlet/okjsp/okjsp_site_01.html)
�Ʒ� ����Ʈ���� ���� ���� �� �ְ�, OS�� ������ ���� �� ������ ������ ��
������, �����ϴ� ����� �ش� ���α׷��� ��ġ �Ŵ����� �ð��� ����� �鿩��
�о�� ���̴�.

j2sdk 1.4.2_05 http://java.sun.com/
mysql 4.0.20b http://www.mysql.com/
eclipse 3.0 http://www.eclipse.org/
lomboz 3.0.1 http://www.objectlearn.com/
emf-sdo-runtime 2.0.0 http://www.objectlearn.com/
tomcat5 http://jakarta.apache.org/

���α׷� ��ġ
(������ http://okjsp.pe.kr/lecture/viewlet/okjsp/okjsp_site_02.html)

java ���� ���α׷��� c:\java ��� ���丮�� �������� ��ġ�Ѵ�. j2sdk, eclipse,
tomcat ���� �̿� �ش�ȴ�. mysql�� c:\mysql�� ��ġ�Ѵ�. �� �̿��� ���丮��
��ġ�Ѵٸ� my.ini������ ���� mysql�� ��ġ�� ���丮�� data������ ����Ǵ�
���丮�� ����ϰ�, ������ ���丮(c:\windows �Ǵ� c:\winnt ��)�� ���Ƶд�.



okjsp �ҽ� ���ϱ�
(������ http://okjsp.pe.kr/lecture/viewlet/okjsp/okjsp_site_03.html)
http://okjsp.pe.kr/cvs/ �� cvs������ �ּҸ� ����س��Ҵ�. (���� ������
���������� �ʴ�.)

eclipse�� CVS Repositories �� ���ؼ� �����Ѵ�.
CVS���� checkout�� �Ϸ��ϸ� Java Perspective�� layout�� �ٲ۴�. ������Ʈ
�������丮�� �ִ� build.xml�� ��� Outline view���� db target�� �����Ѵ�.
���� build.properties ���Ͽ� �ִ� ��Ĺ�� ��ġ�� ��θ� Ȯ���ϰ�, build.xml ��
publish target�� �����Ѵ�.

�������� ��� http://localhost:8080/manager/html �� �Է��ϰ� Tomcat�� ��ġ��
�� �Է��ߴ� id�� password�� �Է��Ѵ�. manager ȭ�鿡�� default context (/) ��
reload ��ũ�� Ŭ���Ѵ�.
���� / �� Ŭ���ؼ� ȭ���� Ȯ���� �� �ִ�.








version beta
2003-04-29 2:20����

http://ant.apache.org ���� 1.5.3 ���̳ʸ� ���� �ٿ�޾Ƽ� ����Ǯ��
c:\java\ant ���� ������ �̵��� �Ŀ� ANT_HOME ȯ�溯���� c:\java\ant ����ְ�,
Path �� %ANT_HOME%\bin �߰��ϸ� ��ġ �Ϸ��Դϴ�.

����â ����� okjsp �ҽ� ���� Ǯ�� ������

build.properties �� E:/java/jakarta-tomcat-4.1.24 �� �ڽ��� ���丮�� �°�
�����ؾ� �˴ϴ�.

/docs���丮�� �ִ� okjsp-board-mysql.sql�� okjsp-member-mysql.sql��
�����մϴ�.
/src/kr/pe/okjsp/DB.properties ������ �����ϰ� �����մϴ�.

build.xml������ �ִ� ���丮����
ant db
������� ������ ���̺��� �����մϴ�.

ant deploy�ϸ� ��Ĺ(E:/java/jakarta-tomcat-4.1.24)�� webapps\ROOT �� �ڵ�����

�� ����ǰ�, �����ϵǾ ���ϴ�.

ROOT/WEB-INF/web.xml ������ �����Ͻñ�...



�Ŵ����� Ư���� ������ �ʾҽ��ϴ�.

�����ϸ� �߰��ϵ��� �� �� �Դϴ�.



mvc�� ���ߵǾ���, tomcat�� ���ε��� �� �Ǵ� ����� ���߽� ũ�� �������� �پ����ϴ�.

jdc-pool�� ��������� 5���̻� ������ ���� Ŀ�ؼ��� ������ �����ݴϴ�.

www.lastcom.pe.kr���� ������ html ������ ����� ���� �����߽��ϴ�.

www.kkaok.pe.kr�� ����� ī���� mysql ���� 2.4 �������� ���ԵǾ����ϴ�.


