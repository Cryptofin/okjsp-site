package kr.pe.okjsp;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import kr.pe.okjsp.util.CommonUtil;

import com.rosaloves.net.shorturl.bitly.Bitly;
import com.rosaloves.net.shorturl.bitly.BitlyException;
import com.rosaloves.net.shorturl.bitly.BitlyFactory;
import com.rosaloves.net.shorturl.bitly.url.BitlyUrl;

import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;

public class TwitterUpdate {
	
	private String tweetStsText = "" ;
	private String twitterId = "okjsp";
	private String twitterPwd = "okpass12";
	private String bitlyId = "okjsp";
	private String bitlyKey = "R_2338c002b1dfeb9d0b111d1f0bfa8ce0";
	

	public void doUpdate(Article article, HttpServletRequest req) {
		if ( !isTwitterUpdate(article, req) ){
			return;
		}
		
		String subject = article.getSubject();
		String content = article.getContent();
		int seq = article.getSeq();
		
		Twitter twitter = new TwitterFactory().getInstance(twitterId, twitterPwd);
		Bitly bitly = BitlyFactory.newJmpInstance(bitlyId, bitlyKey);
		
		BitlyUrl bUrl = null;
        String sOrgUrl = "http://okjsp.pe.kr/seq/"+seq;
        URL resultUrl = null;
		try {
			resultUrl = new URL(sOrgUrl);	//������ũ
		} catch (MalformedURLException e1) {
		}
		
        try {
			bUrl = bitly.shorten(sOrgUrl);
		} catch (Exception e) {
			bUrl = null;
		}
		
        if (bUrl != null){
        	resultUrl = bUrl.getShortUrl();	//ª����ũ
        }
		
		//Ʈ�� �� �ø��� �ӽ����� 
        //������: �ִ�30�� 
		if ( subject.length() > 30 ) {
			subject = subject.substring(0, 30) + "��";
		}

		// html tag ����
		content = CommonUtil.removeTag(content, "<");

		
		if ( content.length() > 80 ) {
			content = content.substring(0, 80) + "��";			
		}
	   
		tweetStsText = subject + ": ";
		tweetStsText += content + " ";		
		tweetStsText += resultUrl;

		String result_msg = "";
		try {
	        Status status = twitter.updateStatus(tweetStsText);
	        result_msg = status.getText();
		}catch (TwitterException te) {
			te.printStackTrace();
		}

		// twitter Successfully updated 
		System.out.println("result_msg length:   "+ result_msg.length() + " & " + result_msg);
		// twitter source end
	}
	
	/**
	 * �Խ����� Ʈ���� ������ ����� �Ǿ����� Ȯ�� �� ��뿩�θ� ��ȯ�Ѵ�.
	 * 
	 * @param m_article �Խñ�
	 * @param m_req HttpServletRequest
	 * @return Ʈ���� ���� ��� ����
	 */
	private boolean isTwitterUpdate(Article m_article, HttpServletRequest m_req){
		
		try{
			HashMap bbsInfoMap = (HashMap)m_req.getSession().getServletContext().getAttribute("bbsInfoMap");
			
		    BbsInfoBean bbsInfo = ((BbsInfoBean)(bbsInfoMap.get(m_article.getBbs())));
		    if (bbsInfo == null) {
		    	System.out.println("isTwitterUpdate bbsInfo == null / m_article.getBbs() : " + m_article.getBbs());
		    	return false;
		    }
		    System.out.println("isTwitterUpdate bbsInfo.getCseq() : " + bbsInfo.getCseq());
		    if ("2".equals(bbsInfo.getCseq())) {
		    	return false;
		    }
		}catch(Exception e){
			System.out.println("isTwitterUpdate : " + e);
		}
		return true;
	}
}
