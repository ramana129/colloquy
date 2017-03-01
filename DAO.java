package ColloQuy;
import com.sun.org.apache.bcel.internal.generic.FADD;
import static java.lang.System.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
public class DAO {
        private static Connection con;
         public DAO() {
                try {
                    if(con==null){
//                               Class.forName("com.mysql.jdbc.Driver");
//                            out.println("Driver Loaded ...");
//                            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/collo","root","");
//                            out.println("Connection Established ...");
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        out.println("Loaded...");
                        con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","collo","collo");
                        out.println("Connected.....");
                                }   
                }catch (Exception ex) 
                {   out.println(ex);
                }
                     }
         public boolean register(String name,String uid,String password,String gender)
         { boolean flag=false;
         try{
             PreparedStatement pstmt= con.prepareStatement("insert into register values(?,?,?,?,?)");
             pstmt.setString(1,name);
             pstmt.setString(2,uid);
             pstmt.setString(3,password);
             pstmt.setString(4,gender);
             pstmt.setString(5,"Active");
             int i=pstmt.executeUpdate();
         
             if(i>0){
             flag=true;
             }}catch(Exception e){
                    out.println("Already User Existed:");
             }
             return flag;
         }
        public String loginCheck (String uid,String password) throws Exception
        { String status=null;
            PreparedStatement pstmt=con.prepareStatement("select status from register where userid=? and password=? ");
            pstmt.setString(1,uid);
            pstmt.setString(2,password);
           ResultSet rs = pstmt.executeQuery();
           if(rs.next())
           {
               status=rs.getString(1);
           }
            return status;
        }
        public String getName(String uid) throws Exception
        { String status=null;
            PreparedStatement pstmt=con.prepareStatement("select uname from register where userid=?");
            pstmt.setString(1,uid);
           ResultSet rs = pstmt.executeQuery();
           if(rs.next())
           {
               status=rs.getString(1);
           }
            return status;
        }
        public int getIdq() throws SQLException
         {  int i=0;
                 PreparedStatement pstmt=con.prepareStatement("select qid from queationtable");
                 ResultSet rs= pstmt.executeQuery();
                 while(rs.next())
                     {
                i=rs.getInt(1);
                 }
                  return i+1;
        }
        public boolean setPost(String uid,String cate,String post) throws SQLException
        {   boolean flag=false;
            PreparedStatement pstmt=con.prepareStatement("insert intoqueationtable values(?,?,?,?)");
            pstmt.setString(1,""+getIdq());
            pstmt.setString(2, post);
            pstmt.setString(3, uid);
            pstmt.setString(4, cate);
            int e=pstmt.executeUpdate();
            if(e>0){
                flag=true;
            }
        return flag;
            }
        public ResultSet getPost() throws Exception
        {
            ResultSet rs=null;
            PreparedStatement pstmt=con.prepareStatement("select * from queationtable",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE );
            rs=pstmt.executeQuery();
        return rs;
        }
        public ResultSet getQid(String qid) throws Exception
         {   ResultSet rs=null;
                PreparedStatement pstmt=con.prepareStatement("select * from queationtable where qid=?");
                pstmt.setString(1, qid);
                rs=pstmt.executeQuery();
                return rs;
         }
         public int getIda() throws SQLException
         {  int i=0;
                 PreparedStatement pstmt=con.prepareStatement("select aid from answertable");
                 ResultSet rs= pstmt.executeQuery();
                 while(rs.next())
                 {
                i=rs.getInt(1);
                 }
                  return i+1;
        }   
        public boolean setAnsPost(String uid,String qid,String ans)throws Exception
          { boolean flag=false;
             PreparedStatement pstmt=con.prepareStatement("insert into answertable values(?,?,?,?,?)");
             pstmt.setString(1, ""+getIda());
             pstmt.setString(2, ans);
             pstmt.setString(3, uid);
             pstmt.setString(4, qid);
             pstmt.setString(5, "0");
             int i=pstmt.executeUpdate();
             if(i>0){
             flag=true;
             }
            return flag;
        }
         public int getAn(String qid) throws SQLException
         {  int i=0;
         try{
                 PreparedStatement pstmt=con.prepareStatement("select MAX(CONVERT(alike, SIGNED INTEGER)) AS alike from answertable where qid=?");
                pstmt.setString(1, qid);
                 ResultSet rs= pstmt.executeQuery();
       
                 while(rs.next())
                     {
                i=rs.getInt(1);
                 }
                   }catch(Exception e){
                    out.println("Erroe"+e);
                    }
                  return i;
        }
        
        public ResultSet getAns(String qid)throws Exception
        {   ResultSet rs=null;
            PreparedStatement pstmt=con.prepareStatement("select * from answertable where qid=? and alike=?");
            pstmt.setString(1, qid);
            pstmt.setString(2,""+getAn(qid));
            rs=pstmt.executeQuery();
            return rs;
        }
         public ResultSet getAnsV(String qid)throws Exception
        {   ResultSet rs=null;
            PreparedStatement pstmt=con.prepareStatement("select * from answertable where qid=?");
            pstmt.setString(1, qid);
            rs=pstmt.executeQuery();
            return rs;
        }
        public int getIdl() throws SQLException
         {  int i=0;
                 PreparedStatement pstmt=con.prepareStatement("select lid from alike");
                 ResultSet rs= pstmt.executeQuery();
                 while(rs.next())
                     {
                i=rs.getInt(1);
                 }
                  return i+1;
        }
        public boolean setAlike(String qid1,String aid ,String uid1) throws Exception
        {   boolean flag=false;
            PreparedStatement pstmt=con.prepareStatement("insert into alike values(?,?,?,?)");
            pstmt.setString(1,""+getIdl());
            pstmt.setString(2, qid1);
            pstmt.setString(3,aid);
            pstmt.setString(4, uid1);
            int i=pstmt.executeUpdate();
            if(i>0){
            flag=true;
            }
            return flag;
        }
        public ResultSet getCount(String s)throws Exception
        {   ResultSet rs=null;
        PreparedStatement pstmt=con.prepareStatement("select alike from answertable where qid=?");
        pstmt.setString(1, s);
            rs=pstmt.executeQuery();
            return rs;
        }
        public boolean setPW(String uid,String password)throws Exception
        {   boolean flag=false;
            PreparedStatement pstmt=con.prepareStatement("update register set password=? where userid=?");
            pstmt.setString(1, password);
            pstmt.setString(2,uid);
            int i=pstmt.executeUpdate();
             if(i>0){
            flag=true;
            }
        return flag;  
        }
        public ResultSet getUser()
        {   ResultSet rs=null;
        try{
            PreparedStatement pstmt=con.prepareStatement("select * from register where status='Active'");
            rs=pstmt.executeQuery();
         }catch(Exception e)
         {
         out.println("Error......");
         }
        return rs;
        }
        public ResultSet getSearchUser(String search)
        {   ResultSet rs=null;
        try{
            String sql="select * from register where userid like '%"+search+"%'";
        PreparedStatement pstmt=con.prepareStatement(sql);
            rs=pstmt.executeQuery();
         }catch(Exception e)
         {
         out.println("Error......");
         }
        return rs;
        }
        public boolean dropUser(String uid)throws Exception
        {   boolean flag=false;
            PreparedStatement pstmt=con.prepareStatement("delete from register where userid=?");
            pstmt.setString(1,uid);
            int i=pstmt.executeUpdate();
            if(i>0){
            flag=true;
            }
        return flag;  
        }
        
        public int getCou(String qid1,String aid)
        {   int r=0;
        try{
            PreparedStatement pstmt=con.prepareStatement("select alike from answertable where qid=? and aid=?");
            pstmt.setString(1, qid1);
            pstmt.setString(2, aid);
                ResultSet rs=pstmt.executeQuery();
                while(rs.next()){  r=rs.getInt(1);
                                }
           }catch(Exception e)
               {
                     out.println("Error......");
               }
        return r+1;
        }
        public boolean setCount(String qid1,String aid)throws Exception
        {   boolean flag=false;
            PreparedStatement pstmt=con.prepareStatement("update answertable set alike=? where qid=? and aid=?");
            pstmt.setString(1,""+getCou(qid1,aid));
            pstmt.setString(2,qid1);
            pstmt.setString(3,aid);
            int i=pstmt.executeUpdate();
            if(i>0){
            flag=true;
            }
        return flag;  
        }
        public ResultSet getSearch(String search) throws Exception
        {   ResultSet rs=null;
            String sql="select * from queationtable where queation like '%"+search+"%'";
            PreparedStatement pstmt=con.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
            rs=pstmt.executeQuery();
            rs.afterLast();
        return rs;
        }
        public String getLikeorNot(String aid,String uid)throws Exception
        {   String lid=null;
            PreparedStatement pstmt=con.prepareStatement("select lid from alike where aid=? and userid=?");
            pstmt.setString(1,aid);
            pstmt.setString(2,uid);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next())
            {    lid=rs.getString(1);       }
          
        return lid;  
        }
       public ResultSet getPost(String cat) throws Exception
        {
            ResultSet rs=null;
            PreparedStatement pstmt=con.prepareStatement("select * from queationtable where category='"+cat+"'",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE );
            rs =pstmt.executeQuery();
        return rs;
        }
       public String getUid(String qid1)throws Exception
        {   String lid=null;
            PreparedStatement pstmt=con.prepareStatement("select userid from queationtable where qid=?");
            pstmt.setString(1,qid1);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next())
            {    lid=rs.getString(1);     
            }
          return lid;  
        }
       public String getMail(String uid)
        {   String lid=null;
        
        try{
            ResultSet rs=null;
            PreparedStatement pstmt=con.prepareStatement("select email from register where userid=?");
            pstmt.setString(1,uid);
            rs=pstmt.executeQuery();
       
            while(rs.next())
            {   try {     
                    lid=rs.getString(1);
                } catch (SQLException ex) {
                    Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
             }catch(Exception e){   out.println("Error:"+e); }
          return lid;  
        }
       
}
