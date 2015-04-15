package com.miteno.common.util;

/**
 * @author dongyang
 *������
 */
public class EncryptString {

	
	
	// ����Կ
	 private static String Key = "1A8F01BA670E04B90E230B57197F61C2";
	
	/**
	 * @param args
	 */
	@SuppressWarnings("static-access")
	public static void main(String[] args) {
		  EncryptString es = new EncryptString();
			
			SupplementStrings  ss = new SupplementStrings();

			
			String strs2 = "ddddhhhttt1156"+"{13426364664}";
			System.out.println("strs2�� "+strs2);
			String toMd5 = es.strToMD5(strs2,32);
			System.out.println("��¼����תmd5�� "+toMd5);
			
			
			String strs1 = "123456";
			ss = new SupplementStrings();
			String ss_16 = ss.pandStrings(strs1);
			System.out.println("֧�����벹λ�� "+ss_16);
			String allshiliu1 = es.encryptAndDiscrypt(ss_16,0);
			System.out.println("֧��������ܺ� "+allshiliu1);
			
			
			
			String allshiliu2 = es.encryptAndDiscrypt(allshiliu1,1);
			System.out.println("֧��������ܺ� "+allshiliu2);
			
			
			
			String emd5 = es.encryptMd5(toMd5);
			String disemd5 = es.disEncryptMd5(emd5);
			System.out.println("��¼����תmd5��Ա�0�� "+toMd5+"    �ַ�����"+toMd5.length());
			System.out.println("��¼����תmd5��Ա�1: "+disemd5+"    �ַ�����"+disemd5.length());
		
		
//		//��¼������ܴ汾������
//		String ssBM = ss.pandStrings(toMd5);
//		System.out.println("��¼����MD5��λ�� "+ssBM);
//		
//		StringBuffer allmiwenEnd = new StringBuffer();
//			
//	     
////		 String strHEX =DES.ASC_2_HEX(toMd5);
////		 System.out.println("strHEX: "+strHEX);
////		 
////		 String strASC =DES.HEX_2_ASC(strHEX);
////		 System.out.println("strASC: "+strASC.toLowerCase());
//		 
//
//			String[] hahha =  ssBM.toString().split(",");
//			//�ȼ���
////			for (int i = 0; i < hahha.length; i++) {
//			String hahha0 =DES.DES_3(hahha[0],Key,0);
//			String hahha1 =DES.DES_3(hahha[1],Key,0);
//			System.out.println("allmiwenKey0: "+hahha0);
//			System.out.println("allmiwenKey1: "+hahha1);
////				allmiwen.append(DES.DES_3(hahha[i],Key,0));
//////			}
//			
//		
//		//��¼����ȡ�������Ľ���
//			
//			String hahha0Dis =DES.DES_3(hahha0,Key,1);
//			String hahha1Dis =DES.DES_3(hahha1,Key,1);
//			
//			System.out.println("hahha0Dis: "+hahha0Dis.toLowerCase());
//			System.out.println("hahha1Dis: "+hahha1Dis.toLowerCase());
//			System.out.println("��¼����תmd5��Ա�0�� "+toMd5);
//			System.out.println("��¼����תmd5��Ա�1: "+hahha0Dis.toLowerCase()+hahha1Dis.toLowerCase());
			
			
		
	}
	
	
	/**
	 * 
	 * @param str
	 * @return
	 * ����MD5�뱾�س־�
	 */
	public static String encryptMd5(String strMD5){
		SupplementStrings  ss = new SupplementStrings();
	
		
		String ssBM = ss.pandStrings(strMD5);
		String[] hahha =  ssBM.toString().split(",");
		//�ȼ���

		String hahha0 =DES.DES_3(hahha[0],Key,0);
		String hahha1 =DES.DES_3(hahha[1],Key,0);
//		System.out.println("allmiwenKey0: "+hahha0);
//		System.out.println("allmiwenKey1: "+hahha1);
		
		return hahha0+hahha1;
	}


	/**
	 * ���ܱ��ش洢����Ϊmd5��
	 * @param str
	 * @return
	 */
	public static String disEncryptMd5(String str){
		SupplementStrings  ss = new SupplementStrings();
		String ssBM = ss.pandStrings(str);
		String[] hahha =  ssBM.toString().split(",");
		
		String hahha0Dis =DES.DES_3(hahha[0],Key,1);
		String hahha1Dis =DES.DES_3(hahha[1],Key,1);
		
		return (hahha0Dis+hahha1Dis).toLowerCase();
	}
	
	/**
	 * �ַ�תmd5��
	 * @return
	 * str  ��ԭ��
	 * number 16 ��ת16λmd5 ��32��ת32λmd5
	 * 
	 */
	public static String strToMD5(String str,int number){
		MD5 md5 = new MD5();
		String md5Str = md5.Md5(str,number);
		return md5Str;
	}
	
	
	
	
	/**
	 * ���ܽ��ܷ���
	 * @param str
	 * @return
	 * num��  0:encrypt����  1:discrypt ����
	 */
	public static String encryptAndDiscrypt(String str,int num){
		
		String temp = DES.DES_3(str,Key,num);
		
		return temp;
	}
	
	
	
	
	

}
