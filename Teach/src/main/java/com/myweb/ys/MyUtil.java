package com.myweb.ys;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class MyUtil {
	public String getRndString(int size){
		String rndStr=Long.toHexString(Double.doubleToLongBits(Math.random())).substring(size+8);
		SimpleDateFormat format = new SimpleDateFormat("YYMMdd");
		Date d = new Date();
		String date = format.format(d);
		rndStr = date+"-"+rndStr;
		return rndStr;
	}
	
    public String uuid(){
        UUID uuid = UUID.randomUUID();
        String l = uuid.toString();
        return noMinus(l);
    
    }
    public String noMinus( String l ){
        char[] l2 = new char[32];
        char[] cs = l.toCharArray();
        int j = 0;
        for(int i = 0 ; i<36 ;i++){
            if( cs[i] != '-'){
                l2[j++] = cs[i];
            }
        }
        return new String(l2);
    }
	
}
