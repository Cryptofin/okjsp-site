package kr.pe.okjsp;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.pe.okjsp.util.CommonUtil;
import kr.pe.okjsp.util.DbCon;

import com.oreilly.servlet.MultipartRequest;

public class WriteServlet extends HttpServlet {

	private static final long serialVersionUID = 4181913566227354988L;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
		throws IOException, ServletException {
		String bbs;
	    if("application/x-www-form-urlencoded".equals(req.getContentType())) {
	    	bbs = write(req, res);
	    } else {
	    	bbs = writeWithFiles(req, res);
	    }
	    
	    //�� �ۼ��ڿ� ����ϰ� �� ����_piki
	    //�� �ۼ� �Ϸ�� ȭ���� ���� �̵��ؾ� ���� ���....
	    boolean isMobileView = CommonUtil.nchk(req.getParameter("mobileView"),"N").equals("Y");
	    //String togo = (isMobileView) ? "/bbs?act=MLIST&bbs="+bbs : "/bbs?act=LIST&bbs=" + bbs + "&pg=0";
	    String togo = (isMobileView) ? "/m" : "/bbs?act=LIST&bbs=" + bbs + "&pg=0";
		//String togo = "/bbs?act=LIST&bbs=" + bbs + "&pg=0";
		res.sendRedirect(togo);

	} // end doPost()

	private String write(HttpServletRequest req, HttpServletResponse res) {
		String id = CommonUtil.getCookie(req, "okid");
		long sid = CommonUtil.getCookieLong(req, "sid");
		Article article = new Article();
		article.setId(id);
		article.setSid(sid);
		String writer = req.getParameter("writer");
		String bbs = req.getParameter("bbs");
		String content = req.getParameter("content");
		String subject = req.getParameter("subject");
		String homepage = req.getParameter("homepage");
		String password = req.getParameter("password");
		String html = req.getParameter("html");
		String ccl_id = req.getParameter("ccl_id");

		article.setWriter(writer);
		article.setBbs(bbs);
		article.setContent(content);
		article.setSubject(subject);
		article.setHomepage(homepage);
		article.setPassword(password);
		article.setHtml(html);
		article.setCcl_id(ccl_id);
		
		new ArticleDao().write(article);
		
		// Ʈ���� �۾��� �߰�
		if ( isTwitterUpdate(article, req) ) {
			new TwitterUpdate().doUpdate(article);
		}
		
		return article.getBbs();
	}

	private String writeWithFiles(HttpServletRequest req,
			HttpServletResponse res) throws IOException {
		// ���丮 Ȯ��
        String uploadDir = getServletContext().getRealPath(req.getContextPath())+Navigation.getPath("UPDIR");
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            boolean mkdirs = dir.mkdirs();
            if (!mkdirs) {
            	throw new IOException("can't create dir");
            }
        }
        
        // MultipartRequest�� ���ڵ��� ������ ��� �ϱ� ������ request�� ���ڵ��� �̾Ƽ� �־�����մϴ�.
        String encoding = CommonUtil.nchk(req.getCharacterEncoding(), "euc-kr");
        
		MultipartRequest multi =
			new MultipartRequest(
				req,
				uploadDir,
				200 * 1024 * 1024,
				encoding);
		// 200MB
		ArrayList<DownFile> arrdf = new ArrayList<DownFile>();
		Article article = null;
		String id = CommonUtil.getCookie(req, "okid");
		long sid = CommonUtil.getCookieLong(req, "sid");
		try {
			int seq = 0, ref = 0, lev = 0, step = 0;
			String writer = multi.getParameter("writer");
			String bbs = multi.getParameter("bbs");
			String content = multi.getParameter("content");
			String email = multi.getParameter("email");
			String subject = multi.getParameter("subject");
			String homepage = multi.getParameter("homepage");
			String password = multi.getParameter("password");
			String html = multi.getParameter("html");
			String ccl_id = multi.getParameter("ccl_id");
			
			//id 
		    boolean isLogin = sid > 0;
		    if (!isLogin) {
		        res.sendRedirect(Navigation.getPath("LOGFORM"));
		        return null;
		    }
// Multipart �� ���� ������ 8859_1�� ���� ��.��
			article =
				new Article(
					bbs,
					seq,
					ref,
					step,
					lev,
					id,
					sid,
					writer,
					subject,
					content,
					password,
					email,
					homepage,
					0,
					null,
					html,
					req.getRemoteAddr(), ccl_id);

			int cnt = 0;
			Enumeration<String> files = multi.getFileNames();
			while (files.hasMoreElements()) {
				String name = files.nextElement();
				File f = multi.getFile(name);
				if (f != null) {
					arrdf.add(new DownFile(f, cnt++));
				}
			}
		} catch (Exception e) {
			System.out.println("WriteServlet:" + CommonUtil.a2k(e.toString()));
		}

		if (hasNothing(article)) {
			throw new SecurityException("no content");
		}
		
		/*
			db �Է�
		*/
		DbCon dbCon = new DbCon();
		Connection conn = null;
		ArticleDao articleDao = new ArticleDao();
		try {

			conn = dbCon.getConnection();
			conn.setAutoCommit(false);

			String act = multi.getParameter("act");
			String[] delFiles = null;

			int seq = 0;
			if ("MODIFY".equals(act)) {
				seq = Integer.parseInt(multi.getParameter("seq"));
				delFiles = multi.getParameterValues("delFile");
				article.setSeq(seq);
			}

			if ("REPLY".equals(act)) {
				article.setSeq(articleDao.getSeq(conn));
				article.setRef(Integer.parseInt(multi.getParameter("ref")));
				article.setLev(Integer.parseInt(multi.getParameter("lev")));
				article.setStep(
						Integer.parseInt(multi.getParameter("step")));
				articleDao.reply(conn, article);

			} else if ("MODIFY".equals(act)) {
				articleDao.modify(conn, article);
				articleDao.deleteFiles(conn, delFiles);
			} else {
				article.setSeq(articleDao.getSeq(conn));
				article.setRef(articleDao.getNewRef(conn, article.getBbs()));
				articleDao.write(conn, article);
			}

			articleDao.addFile(conn, article.getSeq(), arrdf);
			conn.commit();
		} catch (Exception e) {
			System.out.println("WriteServlet err:" + CommonUtil.a2k(e.toString()));
		} finally {
			dbCon.close(conn, null);
		}

		// Ʈ���� �۾��� �߰�
		if ( isTwitterUpdate(article, req) ) {
			new TwitterUpdate().doUpdate(article);
		}
		
		return article.getBbs();
	}

	public boolean hasNothing(Article article) {
		boolean hasNothing = article.getSubject() == null
				|| "".equals(article.getSubject().trim())
				|| article.getContent() == null
				|| "".equals(article.getContent().trim())
				|| article.getBbs() == null
				|| "".equals(article.getBbs().trim())
				;
		return hasNothing;
	}
	
	/**
	 * �Խ����� Ʈ���� ������ ����� �Ǿ����� Ȯ�� �� ��뿩�θ� ��ȯ�Ѵ�.
	 * 
	 * @param m_article �Խñ�
	 * @param m_req HttpServletRequest
	 * @return Ʈ���� ���� ��� ����
	 */
	private boolean isTwitterUpdate(Article m_article, HttpServletRequest m_req){
		HashMap bbsInfoMap = (HashMap)m_req.getSession().getServletContext().getAttribute("bbsInfoMap");
		
	    BbsInfoBean bbsInfo = ((BbsInfoBean)(bbsInfoMap.get(m_article.getBbs())));
	    if (bbsInfo == null) {
	    	return false;
	    }
	    if ("2".equals(bbsInfo.getCseq())) {
	    	return false;
	    }
		return true;
	}
}
