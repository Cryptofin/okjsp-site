<%@page pageEncoding="MS949" %>
<%
	
	String bbs = request.getParameter("bbs");	// mobile������ Script�� Selected ���ֱ� ��ƴ�. bbs ������  Selected ó���Ѵ�.
%>
<option value="techtrend"		<%=   "techtrend".equals(bbs)?"SELECTED":"" %>	>TECH TREND</option>
<option value="lecture"			<%=     "lecture".equals(bbs)?"SELECTED":"" %>	>����</option>
<option value="TOOL"			<%=        "TOOL".equals(bbs)?"SELECTED":"" %>	>������</option>
<option value="TOOLqna"			<%=     "TOOLqna".equals(bbs)?"SELECTED":"" %>	>������ QnA</option>
<option value="ajax"			<%=        "ajax".equals(bbs)?"SELECTED":"" %>	>Ajax</option>
<option value="ajaxqna"			<%=     "ajaxqna".equals(bbs)?"SELECTED":"" %>	>Ajax QnA</option>
<option value="bbs2"			<%=        "bbs2".equals(bbs)?"SELECTED":"" %>	>DB Tips</option>
<option value="bbs1"			<%=        "bbs1".equals(bbs)?"SELECTED":"" %>	>DB QnA</option>
<option value="bbs4"			<%=        "bbs4".equals(bbs)?"SELECTED":"" %>	>JSP Tips</option>
<option value="bbs3"			<%=        "bbs3".equals(bbs)?"SELECTED":"" %>	>JSP QnA</option>
<option value="weblogic"		<%=    "weblogic".equals(bbs)?"SELECTED":"" %>	>j2ee Tips</option>
<option value="weblgqna"		<%=    "weblgqna".equals(bbs)?"SELECTED":"" %>	>j2ee QnA</option>
<option value="xmltip"			<%=      "xmltip".equals(bbs)?"SELECTED":"" %>	>XML Tips</option>
<option value="xmlqna"			<%=      "xmlqna".equals(bbs)?"SELECTED":"" %>	>XML QnA</option>
<option value="ruby"			<%=        "ruby".equals(bbs)?"SELECTED":"" %>	>Ruby on Rails</option>
<option value="rubyqna"			<%=     "rubyqna".equals(bbs)?"SELECTED":"" %>	>Ruby on Rails QnA</option>
<option value="flex"			<%=        "flex".equals(bbs)?"SELECTED":"" %>	>Flex</option>
<option value="flexqna"			<%=     "flexqna".equals(bbs)?"SELECTED":"" %>	>Flex QnA</option>
<option value="bbs7"			<%=        "bbs7".equals(bbs)?"SELECTED":"" %>	>�ҽ��ڷ��</option>
<option value="docs"			<%=        "docs".equals(bbs)?"SELECTED":"" %>	>�����ڷ��</option>
<option value="etc"				<%=         "etc".equals(bbs)?"SELECTED":"" %>	>��Ÿ�ڷ��</option>
<option value="bbs6"			<%=        "bbs6".equals(bbs)?"SELECTED":"" %>	>��� ���</option>
<option value="japanlife"		<%=   "japanlife".equals(bbs)?"SELECTED":"" %>	>�Ϻ���¾��</option>
<option value="bbs5"			<%=        "bbs5".equals(bbs)?"SELECTED":"" %>	>�Ӹ������� ��</option>
<option value="movie"			<%=       "movie".equals(bbs)?"SELECTED":"" %>	>movie story</option>
<option value="howmuch"			<%=     "howmuch".equals(bbs)?"SELECTED":"" %>	>�󸶸��</option>
<option value="lifeqna"			<%=     "lifeqna".equals(bbs)?"SELECTED":"" %>	>�ǰ���...</option>
<option value="news"			<%=        "news".equals(bbs)?"SELECTED":"" %>	>�����������</option>
<option value="solo"			<%=        "solo".equals(bbs)?"SELECTED":"" %>	>�̱��� ����</option>
<option value="recruit"			<%=     "recruit".equals(bbs)?"SELECTED":"" %>	>����/����/ȫ��</option>
<option value="engdocs"			<%=     "engdocs".equals(bbs)?"SELECTED":"" %>	>english bbs</option>
<option value="krtomcat"		<%=    "krtomcat".equals(bbs)?"SELECTED":"" %>	>����</option>
<option value="link"			<%=        "link".equals(bbs)?"SELECTED":"" %>	>��õ����Ʈ</option>
<option value="goodjob"			<%=     "goodjob".equals(bbs)?"SELECTED":"" %>	>����ȸ��</option>
<option value="market"			<%=      "market".equals(bbs)?"SELECTED":"" %>	>����</option>
<option value="model2jsp"		<%=   "model2jsp".equals(bbs)?"SELECTED":"" %>	>��2JSPå����</option>
<option value="notice"			<%=      "notice".equals(bbs)?"SELECTED":"" %>	>��������</option>
<option value="okboard"			<%=     "okboard".equals(bbs)?"SELECTED":"" %>	>�ڷ�ǹ���</option>
<option value="useful"			<%=      "useful".equals(bbs)?"SELECTED":"" %>	>������ ����</option>
<option value="mac"				<%=         "mac".equals(bbs)?"SELECTED":"" %>	>�� ����</option>
<option value="ihaveadream"		<%= "ihaveadream".equals(bbs)?"SELECTED":"" %>	>���δ� �����ڸ� ����</option>
<option value="javastudy"		<%=   "javastudy".equals(bbs)?"SELECTED":"" %>	>���α׷����ʽ��͵�</option>
<option value="ns"				<%=          "ns".equals(bbs)?"SELECTED":"" %>	>�ڹ�����1��</option>
<option value="dbstudy"			<%=     "dbstudy".equals(bbs)?"SELECTED":"" %>	>DB���͵�</option>
<option value="springstudy"		<%= "springstudy".equals(bbs)?"SELECTED":"" %>	>������ ���͵�</option>
<option value="xf"				<%=          "xf".equals(bbs)?"SELECTED":"" %>	>SLF</option>
<option value="twitter"			<%=     "twitter".equals(bbs)?"SELECTED":"" %>	>Ʈ����</option>
<option value="trash"			<%=       "trash".equals(bbs)?"SELECTED":"" %>	>«��</option>
