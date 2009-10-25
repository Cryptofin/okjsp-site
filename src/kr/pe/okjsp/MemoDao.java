package kr.pe.okjsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import kr.pe.okjsp.member.PointDao;
import kr.pe.okjsp.util.DbCon;

public class MemoDao {
	DbCon dbCon = new DbCon();

	/**
	 * <pre>
	 * @deprecated 20091018 �����ƺ� CUBRID�� ���̱׷��̼� �ϸ鼭 ������ �ڵ����� ������� �ٲ�
	 * </pre>
	 */
	final static String QUERY_MEMO_SEQ =
		"select mseq+1 from okboard_memo order by mseq desc limit 1";

	final static String QUERY_MEMO_ADD =
		"insert into okboard_memo (seq, id, sid, writer, bcomment, wtime, memopass, ip) values (?,?,?,?,?,SYSTIMESTAMP,old_password(?),?)";

	final static String QUERY_MEMO_COUNT =
        "update okboard set memo = memo + ? where seq = ?";

    /**
     * <pre>
     * �޸� ���
     * # 20091018 �����ƺ� CUBRID�� ���̱׷��̼� �ϸ鼭 ������ �ڵ����� ������� �ٲ�
	 * # 20091026 AUTO_INCREMENT �������� ���� getGeneratedKeys()�� ���
	 *   ��Ȯ�� ������ ������ stmt.execute() �ܿ��� getGeneratedKeys() ���� �ȹ޾�����.
     * </pre>
     * @param conn
     * @param id
     * @param sid
     * @param writer
     * @param bcomment
     * @param memopass
     * @param ip
     * @param seq
     * @return result
     * @throws SQLException
     */
    public int write(Connection conn, String id, long sid, String writer, String bcomment, String memopass, String ip, int seq) throws SQLException {
    	if ("null".equals(bcomment) || bcomment == null) {
    		throw new SQLException("no content by "+ip);
    	}
    	Statement stmt = null;
    	ResultSet rs = null;
    	int memocnt = 0;
    	String mseq = "";
    	try {
			// memo �Է�
    		StringBuilder query = new StringBuilder();
			query.append("INSERT ");
			query.append("INTO okboard_memo ");
			query.append("(seq, id, sid, writer, bcomment, wtime, memopass, ip) ");
			query.append("VALUES ");
			query.append("(").append(seq).append(" ");
			query.append(", '").append(id).append("' ");
			query.append(", ").append(sid).append(" ");
			query.append(", '").append(writer).append("' ");
			query.append(", '").append(bcomment).append("' ");
			query.append(", SYSTIMESTAMP ");
			query.append(", old_password('").append(memopass).append("') ");
			query.append(", '").append(ip).append("' ");
			query.append(")");
			stmt = conn.createStatement();
			stmt.execute(query.toString(), Statement.RETURN_GENERATED_KEYS);
			
			// ��ϵ� mseq�� �����ɴϴ�.
			rs = stmt.getGeneratedKeys();
			while (rs.next()) {
				mseq = rs.getString(1);
			}
			
			if (sid > 0) {
				new PointDao().log(sid, 2, 1, mseq);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbCon.close(null, stmt, rs);
		}
    	return memocnt;
    }

    /**
     * �޸� ī��Ʈ
     * @param conn
     * @param seq
     * @param memocnt
     * @throws SQLException
     */
    public void setCount(Connection conn, int seq, int memocnt) throws SQLException {
    	PreparedStatement pstmt = null;
    	try {
			// �޸� ���� �߰�/����
			pstmt = conn.prepareStatement(QUERY_MEMO_COUNT);
			pstmt.setInt   (1, memocnt);
			pstmt.setInt   (2, seq);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { pstmt.close(); } catch (Exception e2) {
				e2.printStackTrace();
			}
		}
    }


}
