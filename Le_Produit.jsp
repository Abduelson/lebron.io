<%-- 
    Document   : Le_Produit
    Created on : 8 févr. 2023, 08:23:38
    Author     : abdue
--%>

<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Le_Produit</title>
        
        <!-- Css -->
        <style>
            
               /* Menu */
               .navbar-nav{
                margin-left: 100px;
            }
            .nav-item{
                padding-left: 30px;
            }
            
            .navbar{
                background: rgb(233, 225, 225);
            }
            
            a {
                 color: #fff;
                 transition: all 1s ease-out;
              }

           .nav-item a:hover,
            a:focus {
            border-bottom: 2px solid black;
            display:inline-block ;
            }
            
 .Global_images
{
    margin-top: 70px;
    display: flex;
    justify-content: center;
    text-align: center;
}

.Imge img
{
    width: 550px;
    height: 600px;
    background-color: white;
    box-shadow: 0px 5px 20px rgb(224, 221, 221);
    padding: 10px 30px;
}

.Newz
{
    margin: 60px  80px 0px 80px;
    padding: 100px;
    font-family: 'Source Sans Pro', sans-serif;
}

.Newz .title
{
    padding-bottom: 15px;
    font-family: 'Source Sans Pro', sans-serif;
    color: #777;
}

.Newz .Price{
    padding-bottom: 15px;
    font-family: 'Source Sans Pro', sans-serif;
    color: #777;
}

.Newz .text{
    padding-bottom: 15px;
    font-family: 'Source Sans Pro', sans-serif;
    color: #777;
}

.Newz .Qtn
{
    padding-bottom: 15px;
}

.btn button
{
    height: 35px;
    width: 200px;
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
                        <li class="nav-item">
                            <a style="transition: all 0.5s ease-out;" class="nav-link active" href="index.html">Home</a>
                        </li>
                           <li class="nav-item">
                             <a style="transition: all 1s ease-out;" class="nav-link active" href="Produit.jsp">Produit</a>
                           </li>
                             <li class="nav-item">
                               <a style="transition: all 1s ease-out;" class="nav-link active" href="Contact.jsp">Contact</a>
                             </li>
                     </ul>
                      <div style="margin-right: 30px; padding-right: 25px;" class="item-social">
                       <a href="#"><i style="padding-right:15px; font-size: 25px; color: blue;" class="fa fa-facebook" aria-hidden="true"></i></a>
                      <a href="#"><i style="padding-right:15px; font-size: 25px; color: blue;" class="fa fa-twitter" aria-hidden="true"></i></a>
                      <a href="#"><i style="padding-right:15px; font-size: 25px; color: blue; " class="fa fa-snapchat-ghost" aria-hidden="true"></i></a>
                      <a href="#"><i style="padding-right:15px; font-size: 25px; color: blue;" class="fa fa-instagram" aria-hidden="true"></i></a>
                   </div>
                    </div>
                 </div>
             </nav>
        
         <% 
               
               @WebServlet("/path")
                 class MyServlet extends HttpServlet {
                    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                        
                        // ...
                    }
                }

               String id = request.getParameter("id");
               int iD = Integer.parseInt(id);
               
               Connection com;
               PreparedStatement pste;
               ResultSet rste;
               
               String nom=request.getParameter("Nom");
               String image=request.getParameter("Image");
               String prix=request.getParameter("Price");
               String quantite=request.getParameter("Quantite");
               String description=request.getParameter("Description");
               
               Class.forName("com.mysql.jdbc.Driver");
               com=DriverManager.getConnection("jdbc:mysql://localhost:3306/IceCream", "root", "AbduelRuth31585873");
               pste=com.prepareStatement("select *from Produit where Id=?");
               
               pste.setInt(1, iD);
               rste= pste.executeQuery();

               if (rste.next()) {
                // retrieve values from ResultSet and return the entity
                
                
           %>
            
        <div class="container">
            <div class="row">
                 <div class="Global_images">
                      <div class="Imge">
                          <img src="<%=rste.getString("Image") %>">
                  </div>

                <div class="Newz">
                    <div class="title">
                     <p><%=rste.getString("Nom") %></p>
                 </div>
     
                 <div class="Price">
                  <p><%= "$ "+rste.getString("Price") %></p>
                 </div>
     
                  <div class="text">
                  <p style="text-align: center;">
                   <%=rste.getString("Description") %>
                  </div>

                  <div class="Qtn">
                  <h3 style="font-family: 'Source Sans Pro', sans-serif; color:#777">Quantite</h3>
                  <input style="height: 25px; width: 80px;" type="number" name="" placeholder="1" value="<%=rste.getString("Quantite") %>">
                 </div>
                   <div class="btn">
                       <button style="background-color: rgb(60, 60, 60); color: white;">Add in basket</button>
                   </div>
                 </div>
             </div>
            </div>
        </div>
           
           <%
              } 
           %>
    </body>
</html>
