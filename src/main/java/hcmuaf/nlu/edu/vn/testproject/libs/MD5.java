package hcmuaf.nlu.edu.vn.testproject.libs;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {
    public static void main(String[] args) {
        String pass = "123456789";
        String hashedText = getMD5(pass);
        System.out.println("Chuỗi được băm ra là: " + hashedText);
    }
    public static String getMD5(String input) {
       try{
           MessageDigest md = MessageDigest.getInstance("MD5");
           byte[] messageDigest = md.digest(input.getBytes());
           return convertByToHex(messageDigest);

       }catch(NoSuchAlgorithmException e){
           throw new RuntimeException(e);
       }
    }

    private static String convertByToHex(byte[] messageDigest) {
        StringBuilder hexString = new StringBuilder();
        for (int i = 0; i < messageDigest.length; i++) {
            hexString.append(Integer.toString((messageDigest[i] & 0xff) + 0x100, 16).substring(1));
        }
        return hexString.toString();
    }

}
