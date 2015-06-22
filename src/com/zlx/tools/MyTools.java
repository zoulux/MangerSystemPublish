package com.zlx.tools;

import java.io.UnsupportedEncodingException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;




public class MyTools {

	public static String toChinese(String str) {
		if (str == null) {
			str = "";
		}
		try {
			str = new String(str.getBytes("ISO-8859-1"), "UTF-8");

		} catch (UnsupportedEncodingException e) {
			str = "";
			e.printStackTrace();
		}
		return str;

	}

	public static boolean isChinese(String data) {

		return false;

	}
	public static boolean isDigit(String data) {
	
		Pattern pattern = Pattern.compile("[0-9]+");
        Matcher isNum = pattern.matcher(data);
        if( !isNum.matches() )
        {
              return false;
        }
        return true;
	}
	
	public static void main(String[] args) {
		System.out.println(isDigit("232131231"));
	}

}
