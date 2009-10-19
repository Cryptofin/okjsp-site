package kr.pe.okjsp.util;

import java.security.MessageDigest;
import java.security.GeneralSecurityException;

/**
 * <pre>
 * MySQL�� MD5(), PASSWORD(), OLD_PASSWORD() �Լ��� 
 * ť�긮���� �ڹ� ���� �Լ��� ����� �� �����ͺ��̽��� 
 * ����� �Ϲ����� ���� �Լ�ó�� �״�� ����� �� �ֵ����� ���Դϴ�.
 * 
 * http://www.cubrid.com/online_manual/cubrid_820/syntax/syntax_javasp_settings.htm
 * http://okjsp.pe.kr/seq/110809
 * </pre>
 */

public class CUBRID_JSP_password {
    public static String MD5(String inpara) {
        byte[] bpara = new byte[inpara.length()]; 
        byte[] rethash;
        int i; 

        for (i=0; i < inpara.length(); i++) 
            bpara[i] = (byte)(inpara.charAt(i) & 0xff );

        try {
            MessageDigest md5er = MessageDigest.getInstance("MD5");
            rethash = md5er.digest(bpara);
        } catch (GeneralSecurityException e) { 
            throw new RuntimeException(e); 
        }

        StringBuffer r = new StringBuffer(32);
        for (i=0; i < rethash.length; i++) {
            String x = Integer.toHexString(rethash[i] & 0xff);
            if (x.length()<2) 
                r.append("0");
            r.append(x);
        }
        return r.toString();
    }

    public static String PASSWORD(String inpara) {
        byte[] bpara = new byte[inpara.length()]; 
        byte[] rethash;
        int i; 

        for (i=0; i < inpara.length(); i++) 
            bpara[i] = (byte)(inpara.charAt(i) & 0xff );

        try {
            MessageDigest sha1er = MessageDigest.getInstance("SHA1");
            rethash = sha1er.digest(bpara);     // stage1
            rethash = sha1er.digest(rethash);   // stage2
        } catch (GeneralSecurityException e) { 
            throw new RuntimeException(e); 
        }

        StringBuffer r = new StringBuffer(82);
        r.append("*");
        for (i=0; i < rethash.length; i++) {
            String x = Integer.toHexString(rethash[i] & 0xff).toUpperCase();
            if (x.length()<2) 
                r.append("0");
            r.append(x);
        }
        return r.toString();
    }

    public static String OLD_PASSWORD(String inpara) {
        byte[] bpara = new byte[inpara.length()]; 
        long lvar1 = 1345345333;
        long ladd = 7;
        long lvar2 = 0x12345671;
        int i; 
        
        if (inpara.length() <= 0)
          return "";

        for (i=0; i < inpara.length(); i++) 
          bpara[i] = (byte)(inpara.charAt(i) & 0xff );

        for (i=0; i < inpara.length(); i++) {
            if (bpara[i] == ' ' ||
                bpara[i] == '\t') continue;
          lvar1 ^= (((lvar1 & 63) + ladd) * bpara[i]) + (lvar1 << 8);
          lvar2 += (lvar2 << 8) ^ lvar1;
          ladd += bpara[i];
        }

        lvar1 = lvar1 & 0x7fffffff;
        lvar2 = lvar2 & 0x7fffffff;

        StringBuffer r = new StringBuffer(16);
        String x = Long.toHexString(lvar1);
        for (i = 8; i > x.length(); i --)
          r.append("0");
        r.append(x);
        
        x = Long.toHexString(lvar2);
        for (i = 8; i > x.length(); i --)
          r.append("0");
        r.append(x);
        return r.toString();
    }
}
