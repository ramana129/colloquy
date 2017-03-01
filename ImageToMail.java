package ColloQuy;    
import com.sun.mail.util.MailSSLSocketFactory;
import java.util.*;  
import javax.mail.*;  
import javax.mail.internet.*;  
import javax.activation.*;  
public class ImageToMail
{  
    public boolean sendImage(String to,String content)throws Exception
    {
        boolean flag=false;
        //String to="madhutechskills09@gmail.com";//change acc ordingly  
        final String fromuser="onlinecolloquy@gmail.com";
         final String frompassword="bsmrbsmr";
            Properties props = new Properties();
            MailSSLSocketFactory sf= new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            props.put("mail.smtp.ssl.socketFactory", sf);
            props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
                        
      Session session = Session.getDefaultInstance(props,  
       new javax.mail.Authenticator() {  
       protected PasswordAuthentication getPasswordAuthentication() {  
       return new PasswordAuthentication(fromuser,frompassword);  
       }  
      });  
         
      try{  
        MimeMessage message = new MimeMessage(session);  
        message.setFrom(new InternetAddress(fromuser));  
        message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
        message.setSubject("From ColloQuy Notifications"); 
          
        //3) create MimeBodyPart object and set your message text     
        BodyPart messageBodyPart1 = new MimeBodyPart();  
        messageBodyPart1.setText(content);  
        
        //5) create Multipart object and add MimeBodyPart objects to this object      
        Multipart multipart = new MimeMultipart();  
        multipart.addBodyPart(messageBodyPart1);  
        
      
        //6) set the multiplart object to the message object  
        message.setContent(multipart );  
         
        //7) send message  
        Transport.send(message);  
       flag=true;
       System.out.println("message sent....");  
       }catch (MessagingException ex) {ex.printStackTrace();}  
      return flag;
    }
    public static void main(String [] args)throws Exception
    {    
//      ImageToMail itm=new ImageToMail();
//      itm.sendImage("chinnapareddys.ram@gmail.com", "karthikeyaasd");
     }  
    }  