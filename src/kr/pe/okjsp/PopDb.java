package kr.pe.okjsp;

import java.util.ResourceBundle;

import javax.servlet.http.*;

/**
 * <pre>
 * ť�긮�忡�� �� pool�� ����ϸ� ������ �ȳ��´�.
 * �׸��� log4sql�� ����Ҷ� select now() ������ ������ ������ �߻��ȴ�.
 * </pre>
 * @deprecated MySQL���� CUBRID�� ��� ���̱׷��̼��� �ϸ鼭 JDCPool�� ������� �ʽ��ϴ�.
 * @author �����ƺ�
 *
 */
public class PopDb extends HttpServlet {

	static {
		try {
			ResourceBundle rb = ResourceBundle.getBundle("kr.pe.okjsp.DB");
			new pool.JDCConnectionDriver(
				rb.getString("DRIVER"),
				rb.getString("DBURL"),
				rb.getString("DBUSER"),
				rb.getString("DBPASS"));
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
}