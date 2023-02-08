<%-- 
    Document   : Produit
    Created on : 7 févr. 2023, 06:58:54
    Author     : abdue
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
        <title>Produit</title>
        
        <!<!-- Css -->
        <style>
            /*Menu */
             .navbar-nav{
                margin-left: 100px;
            }
            .nav-item{
                padding-left: 30px;
            }
            
            .navbar{
                background: rgb(233, 225, 225);
            }
        
           .nav-item a:hover,
            a:focus {
            border-bottom: 2px solid black;
            display:inline-block ;
            }
            
 
/* Card */
.card
{
    width: 330px;
    margin: 0px auto;
    background-color: white;
    box-shadow: 0px 5px 20px #999;
    display: inline-block;
    margin-bottom: 15px;
    margin-top: 60px;
    margin-left: 40px;
    text-align: center;
}

.Card_image
{
    height: 250px;
    position: relative;
    overflow: hidden;
}

.Card_image img{
    width: 150px;
    position: absolute;
    top: 50%;
    left: 55%;
    transform: translate(-50%, -50%);
    transition-property: filter width; 
    transition-duration: .3s;
    transition-timing-function: ease;
}
  
.Card_body
{
    text-align: center;
    padding: 15px 20px;
    box-sizing: border-box;
}

.Card_body .Buttom
{
    padding-top: 15px;  
}

.Card_body .Buttom  a
{
    border-radius: 15px;
    color: white;
    background-color: black;
}


.date {
    font-family: 'Source Sans Pro', sans-serif;
  }
  
  .title{
     font-family: 'Playfair Display', serif;
  }
  
  .date, .title {
    text-align:center;
    text-transform:uppercase;
    font-weight: bold;
  }
  
  .date{
    color: #777;
  }
        </style>
    </head>
    <body>
          <nav class="navbar navbar-expand-lg navbar-light">
                 <div class="container-fluid">
                     <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                     <span class="navbar-toggler-icon"></span>
                     </button>
                    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                      <a class="navbar-brand" href="#">IceCream</a>
                      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                               <a style="transition: all 1s ease-out;" class="nav-link active" href="Contact.jsp">Contact</a>
                             </li>
                        <li class="nav-item">
                            <a style="transition: all 0.5s ease-out;" class="nav-link active" href="index.html">Home</a>
                        </li>
                           <li class="nav-item">
                             <a style="transition: all 1s ease-out;" class="nav-link active" href="Produit.jsp">Produit</a>
                           </li>
                             <li class="nav-item">
                     </ul>
                      
                      <form class="d-flex" method="post">
                           <input class="form-control me-2" type="search" name="nom" placeholder="Search" aria-label="Search">
                           <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                 </div>
             </nav>
        
                       <%
                           if(request.getMethod().equalsIgnoreCase("POST"))
                           {
                              String nom=request.getParameter("nom");
                              String name = "%" + nom + "%";
                              Connection connec;
                              PreparedStatement pstm;
                              ResultSet resul;
                              
                              Class.forName("com.mysql.jdbc.Driver");
                              connec=DriverManager.getConnection("jdbc:mysql://localhost:3306/IceCream", "root", "AbduelRuth31585873");
                              pstm=connec.prepareStatement("select *from Produit where Nom like ? ");
                               
                              pstm.setString(1, name);
                              resul=pstm.executeQuery();
                              
                              while (resul.next()) {                                      
                                  
                           
                        %>
                       <div class="card">
                           <div class="Card_image">
                         <a href="#"><img src=<%=resul.getString("Image") %> alt=""></a>
                     </div>
    
                    <div class="Card_body">
                      <div class="title">
                          <h3>NOM: <%= resul.getString("Nom") %> </h3>
                      </div>
                      <div class="Price">
                          <h4>PRICE: <%= resul.getString("Price") %> </h4>
                      </div>
                      <div class="Buttom">
                          <a style="color: white; text-decoration: none; padding: 5px 20px;" href="Le_Produit.jsp?id=<%= resul.getString("Id") %>">VOIR</a>
                      </div>
                    </div>
                      </div>
                       
                       <% 
                           }
            }
                else{
                       %>
        
        <%
            Connection con;
            PreparedStatement pst;
            ResultSet rst;
            
              Class.forName("com.mysql.jdbc.Driver");
              con=DriverManager.getConnection("jdbc:mysql://localhost:3306/IceCream", "root", "AbduelRuth31585873");
         
              String requet="select * from Produit";
              Statement stm=con.createStatement();
              rst=stm.executeQuery(requet);
                     
                 while(rst.next())
                 {
                 
            %>
       
            <form action="action" class="card" method="POST">
                     <div class="Card_image">
                         <a href="#"><img src=<%=rst.getString("Image") %> alt=""></a>
                     </div>
    
                    <div class="Card_body">
                      <div class="title">
                          <h3>NOM: <%= rst.getString("Nom") %> </h3>
                      </div>
                      <div class="Price">
                          <h4>PRICE: <%= rst.getString("Price") %> </h4>
                      </div>
                      <div class="Buttom">
                          <a style="color: white; text-decoration: none; padding: 5px 20px;" href="Le_Produit.jsp?id=<%= rst.getString("Id") %>">VOIR</a>
                      </div>
                    </div>
                </form>
                             
                  
        <%
            }
             con.close();
             rst.close();
}
         %>
    </body>
</html>
