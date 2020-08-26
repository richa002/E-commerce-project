/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;  
import javax.servlet.http.HttpSession;
  
/**
 *
 * @author Acer
 */
public class FetchProducts {
    public static List<String> distinctCatagories()
    {  
         List<String> list=new ArrayList();
       try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
           PreparedStatement ps=con.prepareStatement("select distinct catagory from products ");
            
           ResultSet rs= ps.executeQuery();
          
           while(rs.next()){
           list.add(rs.getString(1));
           }
       
       con.close();}catch(Exception e){} 
    return list;
    }
    
     public static String getregisteredaddressormobile(String cid, int ch)
    {  
         String address="";
         String mobile="";
       try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
           PreparedStatement ps=con.prepareStatement("select * from registeredusers where cid=?");
            ps.setString(1,cid);
           ResultSet rs= ps.executeQuery();
          
           while(rs.next()){
           address=rs.getString(5);
           mobile=rs.getString(4);
           }
      
        con.close();}catch(Exception e){} 
       if(ch==1)
    return address;
       else 
           return mobile;
           }
   
    
        public static int insertProduct(Product p)
    {
       int i=0;
         
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
           PreparedStatement ps=con.prepareStatement("insert into products(`productid`, `catagory`, `name`, `quantity`, `price`, `image`, `feature`, `image1`, `image2`, `homepage`) values(?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1,p.getPid());
            ps.setString(2,p.getCatagory());
 ps.setString(3,p.getName());
 ps.setInt(4,p.getQuantity());
 ps.setInt(5,p.getPrice());
 ps.setString(6,p.getImage());
 ps.setString(7,p.getFeature());
 ps.setString(8,p.getImage1());
 ps.setString(9,p.getImage2());
 ps.setString(10,p.getHomepage());
  i=ps.executeUpdate();
      } catch(Exception e){System.out.println(e);}
   
     return i;}
    
         
        public static int insertOffer(Offerbean p)
    {
       int i=0;
         
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
           PreparedStatement ps=con.prepareStatement("insert into offers values(?,?,?,?,?,?,?)");
            ps.setString(1,p.getOfferid());
            java.sql.Date date1=new java.sql.Date(p.getStartdate().getTime());
          //  System.out.println(date1);
            ps.setDate(2,date1);
            java.sql.Date date2=new java.sql.Date(p.getLastdate().getTime());
           
            ps.setDate(3,date2);
 
 ps.setString(4,p.getOffername());
 ps.setInt(5,p.getDiscount());
 ps.setString(6,p.getCatagory());
 ps.setString(7,p.getImage());
  i=ps.executeUpdate();
      } catch(Exception e){System.out.println(e);}
   
     return i;}
    
        
        
   
        
        public static int updateproductbyadmin(String pid,Product p)
    {
       int i=0;
         
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
           PreparedStatement ps=con.prepareStatement("update products set `productid`=?,`catagory`=?,`name`=?,`quantity`=?,`price`=?,`image`=?,`feature`=?,`image1`=?,`image2`=?,`homepage`=? where productid=?");
            ps.setString(1,p.getPid());
            ps.setString(2,p.getCatagory());
 ps.setString(3,p.getName());
 ps.setInt(4,p.getQuantity());
 ps.setInt(5,p.getPrice());
 ps.setString(6,p.getImage());
 ps.setString(7,p.getFeature());
 ps.setString(8,p.getImage1());
 ps.setString(9,p.getImage2());
 ps.setString(10,p.getHomepage());
 
 ps.setString(11,pid);
 
  i=ps.executeUpdate();
      } catch(Exception e){System.out.println(e);}
   
     return i;}
    
      
          public static int updateofferbyadmin(String offerid,Offerbean p)
    {
       int i=0;
         
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
          java.sql.Date sqldate1=new java.sql.Date(p.getStartdate().getTime());
         
            PreparedStatement ps=con.prepareStatement("update offers set `offerid`=?,`startdate`=?,`enddate`=?,`offername`=?,`discount`=?,`catagory`=?,`image`=? where offerid=?");
            ps.setString(1,p.getOfferid());
        // java.util.Date d1= new java.util.Date(rs.getDate(1).getTime());
            ps.setDate(2,sqldate1);
            java.sql.Date sqldate2=new java.sql.Date(p.getLastdate().getTime());
         
 ps.setDate(3,sqldate2);
 ps.setString(4,p.getOffername());
 ps.setInt(5,p.getDiscount());
 ps.setString(6,p.getCatagory());
 ps.setString(7,p.getImage());
 ps.setString(8,offerid);
 
  i=ps.executeUpdate();
      } catch(Exception e){System.out.println(e);}
   
     return i;}
    
        
      
        
    public static List<Product> fetchProductsonindex(String s)
    {
         List <Product>list= new ArrayList();
         
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
           PreparedStatement ps=con.prepareStatement("select * from products  where catagory=? and homepage='yes'");
            ps.setString(1,s);
           ResultSet rs= ps.executeQuery();
          
       while(rs.next())
       {
         Product p=new Product();
          p.setCatagory(rs.getString(2));
          p.setName(rs.getString(3));
          p.setQuantity(rs.getInt(4));
          int price=rs.getInt(5);
          p.setPrice(price);
          p.setImage(rs.getString(6));
          p.setFeature(rs.getString(7));
          p.setImage1(rs.getString(8));
          p.setImage2(rs.getString(9));
          p.setPid(rs.getString(1));
          int discountpercentage=rs.getInt(11);
          p.setDiscount(discountpercentage);
          int newprice=price-(price*discountpercentage/100);
          
          p.setNewprice(newprice);
           //System.out.println(newprice);
          list.add(p);
         
       }
        
       
        con.close(); }catch(Exception e){System.out.println(e); }
       return(list);
    
    }
    
    
    
    public static List<Product> fetchallproducts(String s)
    {
         List <Product>list= new ArrayList();
         
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
           PreparedStatement ps=con.prepareStatement("select * from products  where catagory=? ");
            ps.setString(1,s);
           ResultSet rs= ps.executeQuery();
          
       while(rs.next())
       {
         Product p=new Product();
          p.setCatagory(rs.getString(2));
          p.setName(rs.getString(3));
          p.setQuantity(rs.getInt(4));

          p.setPrice(rs.getInt(5));
          p.setImage(rs.getString(6));
          p.setFeature(rs.getString(7));
          p.setImage1(rs.getString(8));
          p.setImage2(rs.getString(9));
          p.setPid(rs.getString(1));
           p.setDiscount(rs.getInt(11));
       
          
          p.setNewprice(rs.getInt(5)-(rs.getInt(5)*rs.getInt(11)/100));
          
          list.add(p);
         
       }
        
       con.close();  }catch(Exception e){System.out.println(e); }
       return(list);
    
    }
    
    
  
    public static void main(String[] args) {
        List <String> l=new ArrayList();
        l=distinctCatagories();
        System.out.println(l.size());
    }
    public static int getrowsinanytable(String table)
   {
    int rowcount=0;     
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
           PreparedStatement ps=con.prepareStatement("SELECT COUNT(*) FROM "+table);
        
           ResultSet rs= ps.executeQuery();
  rs.next();
     rowcount= rs.getInt(1);
    } catch(Exception e){}
  
    return rowcount;
    }
    
    public static List<Product> fetchallproductsforadmin(int start, int total )
    {
         List <Product>list= new ArrayList();
         
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
           PreparedStatement ps=con.prepareStatement("select * from products limit "+(start-1)+","+total);
        
           ResultSet rs= ps.executeQuery();
          
       while(rs.next())
       {
         Product p=new Product();
          p.setPid(rs.getString(1));
         
         p.setCatagory(rs.getString(2));
          p.setName(rs.getString(3));
          p.setQuantity(rs.getInt(4));

          p.setPrice(rs.getInt(5));
          p.setImage(rs.getString(6));
          p.setFeature(rs.getString(7));
          p.setImage1(rs.getString(8));
          p.setImage2(rs.getString(9));
          p.setHomepage(rs.getString(10));
       
           p.setDiscount(rs.getInt(11));
       
          
          p.setNewprice(rs.getInt(5)-(rs.getInt(5)*rs.getInt(11)/100));
          
          list.add(p);
         
       }
        
       con.close();  }catch(Exception e){System.out.println(e); }
       return(list);
    
    }
    
    
         
    
    public static List<Offerbean> fetchalloffersforadmin(int start, int total)
    {
         List <Offerbean>list= new ArrayList();
         
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
       //    PreparedStatement ps=con.prepareStatement("select * from offers limit"+(start-1)+","+total);
        PreparedStatement ps=con.prepareStatement("select * from offers limit "+(start-1)+","+total);
        
           ResultSet rs= ps.executeQuery();
          
       while(rs.next())
       {
         Offerbean p=new Offerbean();
  p.setOfferid(rs.getString(1));
         p.setStartdate(rs.getDate(2));
         
         p.setLastdate(rs.getDate(3));
          p.setOffername(rs.getString(4));
          p.setDiscount(rs.getInt(5));

          p.setCatagory(rs.getString(6));
          p.setImage(rs.getString(7));
          
          list.add(p);
         
       }
        
       con.close();  }catch(Exception e){System.out.println(e); }
       return(list);
    
    }
    
    
    
    
    
    
   public static Product fetchorderdetails(String pid,String q)
    {
        // List <Product>list= new ArrayList();
         Product p=new Product();
         
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
           PreparedStatement ps=con.prepareStatement("select * from products  where productid=?");
            ps.setString(1,pid);
           ResultSet rs= ps.executeQuery();
          
       while(rs.next())
       {
          p.setCatagory(rs.getString(2));
          p.setName(rs.getString(3));
          p.setQuantity(Integer.parseInt(q));
          p.setPrice(rs.getInt(5));
          p.setImage(rs.getString(6));
          p.setFeature(rs.getString(7));
          p.setImage1(rs.getString(8));
          p.setImage2(rs.getString(9));
          p.setPid(rs.getString(1));
          p.setNewprice(rs.getInt(5)-(rs.getInt(5)*rs.getInt(11)/100));
          p.setDiscount(rs.getInt(11));
       
         
       }
        
       con.close();  }catch(Exception e){System.out.println(e); }
       return(p);
    }
   
   public static boolean withinofferperiod(String catagory)
   {
         boolean flag=false;
        
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
           PreparedStatement ps=con.prepareStatement("select * from offers where catagory=?");
            ps.setString(1,catagory);
           ResultSet rs= ps.executeQuery();
          java.util.Date date=new java.util.Date();  
         //System.out.println(date);
//SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
  //  String strDate= formatter.format(date);  
       while(rs.next())
       {
          java.util.Date d1= new java.util.Date(rs.getDate(2).getTime());
         //  System.out.println(d1);  
    //String D1= formatter.format(d1);  
  
          java.util.Date d2= new java.util.Date(rs.getDate(3).getTime());
           //System.out.println(d2);
    //String D2= formatter.format(d2);  
 
        if((date.after(d1))&&(date.before(d2)))
           {
            flag=true;
           }
       }
     con.close();} catch(Exception e){ System.out.println(e);}
    return flag;
   }
   public static String getofferperiod(String offerid)
   {
   String period="";
   String strDate2="", strDate3="",offername="";
   
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
           PreparedStatement ps=con.prepareStatement("select * from offers where offerid=?");
            ps.setString(1,offerid);
           ResultSet rs= ps.executeQuery();
          java.util.Date date=new java.util.Date();  
         //System.out.println(date);
//SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
  //  String strDate= formatter.format(date);  
       while(rs.next())
       { 
           offername=rs.getString(4);
          java.util.Date d2= new java.util.Date(rs.getDate("startdate").getTime());
          System.out.println(d2);  
    //String D1= formatter.format(d1);  
     SimpleDateFormat formatter ;  
   
  formatter = new SimpleDateFormat("dd MMMM yyyy");  
    strDate2 = formatter.format(d2);  
          java.util.Date d3= new java.util.Date(rs.getDate("enddate").getTime());
           System.out.println(d3);  
    
            strDate3 = formatter.format(d3);  
  
           //System.out.println(d2);
    //String D2= formatter.format(d2);  
  period=offername +" from "+strDate2+" till "+strDate3;
           
        }
     con.close();} catch(Exception e){ System.out.println(e);}
    return period;
   }
   
   
   public static void updatediscountpercentage(String catagory)
    {
       
         
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
           PreparedStatement ps=con.prepareStatement("update products set discountpercentage=? where catagory=?");
           int discount =getDiscount(catagory);
           ps.setInt(1,discount);
           ps.setString(2,catagory);
            ps.executeUpdate();
     con.close();}catch(Exception e){System.out.println(e);}
    
    }
   
  
   public static int deleteproductbyadmin(String pid)
    {
       
         int i=0;
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
           PreparedStatement ps=con.prepareStatement("delete from products where productid=?");
           
           
           ps.setString(1,pid);
          i= ps.executeUpdate();
     con.close();}catch(Exception e){System.out.println(e);}
    return i;
    }
    public static int deleteofferbyadmin(String offerid)
    {
       
         int i=0;
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
           PreparedStatement ps=con.prepareStatement("delete from offers where offerid=?");
           
           
           ps.setString(1,offerid);
          i= ps.executeUpdate();
     con.close();}catch(Exception e){System.out.println(e);}
    return i;
    }
   
   
   public static void setdiscounttozero(String catagory)
    {
       
         
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
           PreparedStatement ps=con.prepareStatement("update products set discountpercentage=? where catagory=?");
           
           ps.setInt(1,0);
           ps.setString(2,catagory);
            ps.executeUpdate();
     con.close();}catch(Exception e){System.out.println(e);}
    
    }
  
   public static int getDiscount(String catagory)
    {
       
int discount=0;
         
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
           PreparedStatement ps=con.prepareStatement("select * from offers where catagory=?");
            ps.setString(1,catagory);
           ResultSet rs= ps.executeQuery();
   while(rs.next())
       {
       
        discount=rs.getInt(5);
        }
     con.close();}catch(Exception e){}
    return discount;
    }
    
   public static ArrayList<Offerbean> checkoffer()
    {
        // List <Product>list= new ArrayList();
         //Product p=new Product();
        ArrayList <Offerbean>list=new ArrayList();
         // Offerbean bean=new Offerbean();

         
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
           PreparedStatement ps=con.prepareStatement("select * from offers");
            //ps.setString(1,pid);
           ResultSet rs= ps.executeQuery();
          java.util.Date date=new java.util.Date();  
         System.out.println(date);
//SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
  //  String strDate= formatter.format(date);  
       while(rs.next())
       {
          java.util.Date d1= new java.util.Date(rs.getDate(2).getTime());
        //   System.out.println(d1);  
    //String D1= formatter.format(d1);  
  
          java.util.Date d2= new java.util.Date(rs.getDate(3).getTime());
          // System.out.println(d2);
    //String D2= formatter.format(d2);  
 
  if((date.after(d1))&&(date.before(d2)))
  {
      Offerbean bean=new Offerbean();
      bean.setOfferid(rs.getString(1));
      bean.setStartdate(d1);
      bean.setLastdate(d2);
    bean.setOffername(rs.getString(4)); 
    bean.setDiscount(rs.getInt(5)); 
    bean.setCatagory(rs.getString(6)); 
    bean.setImage(rs.getString(7)); 
     list.add(bean); 
  }
       }     
        con.close();}catch(Exception e){System.out.println(e);}
    return(list);
    }
  
    public static int calculatenewprice(int oldprice, int discount)
    {
         int newprice=oldprice-(oldprice*discount/100);
         return(newprice);
    }
  
   
}
