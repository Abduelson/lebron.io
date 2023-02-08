<%-- 
    Document   : Contact
    Created on : 7 févr. 2023, 06:59:07
    Author     : abdue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!--Servlet -->
<% 
    PreparedStatement pst;
    Connection con;
    ResultSet rst;
    
    if(request.getMethod().equalsIgnoreCase("POST"))
    {
      String nom=request.getParameter("Nom");
      String email=request.getParameter("Email");
      String message=request.getParameter("Message");
       
     Class.forName("com.mysql.jdbc.Driver");
     con=DriverManager.getConnection("jdbc:mysql://localhost:3306/IceCream", "root", "AbduelRuth31585873");
     pst=con.prepareStatement("insert into Contacter(Nom,Email,Message) values(?,?,?)");
     pst.setString(1, nom);
     pst.setString(2, email);
     pst.setString(3, message);
     
     try {
             pst.executeUpdate();
             response.sendRedirect("Verification.html");
         } catch (Exception e) {
             System.out.println("Erreur");
         }
       pst.close();
       con.close();
     
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>JSP Page</title>
        
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
            
            /* Contact */
            #Contact{
            margin-top: 50px;
           }

  #Contact .htag h1
  {
    text-align: center;
    margin: 0px 30px;
    border-bottom: 3px solid black;
    display:inline-block ;
  }
.content_contact
{
    display: flex;
    float: center;
    justify-content: center;
    align-items: center;
}

.Cont_Menu
{
    padding: 72px 100px;
    background-color: rgb(221, 216, 216);
    box-shadow: 0px 5px 20px #999;
    border-radius: 5px gray;
}

.Cont_Relation
{
    padding: 179px 72px;
    background-color: white;
    box-shadow: 0px 5px 20px rgb(224, 221, 221);
    border-radius: 5px white;
}

.Space
{
    display: inline-block;
}

 h1
{
    font-size: 30px;
    color: black;
    font-family: 'Playfair Display', serif;
}

label{
    color: black;
    font-family: 'Playfair Display', serif;
    margin-top: 20px;
}

.Cont_Menu input
{
   border-radius: 5px;
   height: 45px;
   width: 100%;
   padding-left: 15px;
   border: 1px solid #ccc;
}

.Cont_Menu textarea
{
    border-radius: 5px;
    border: 1px solid #ccc;
    padding-left: 15px;
}

.Cont_Menu button
{
    padding: 10px;
    border-radius: 15px;
    color: white;
    background-color: black;
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
                       <a href="#"><i style="padding-right:15px; font-size: 25px;   color: rgb(92, 134, 238);" class="fa fa-facebook" aria-hidden="true"></i></a>
                      <a href="#"><i style="padding-right:15px; font-size: 25px;   color: rgb(92, 134, 238);" class="fa fa-twitter" aria-hidden="true"></i></a>
                      <a href="#"><i style="padding-right:15px; font-size: 25px;   color: rgb(92, 134, 238); " class="fa fa-snapchat-ghost" aria-hidden="true"></i></a>
                      <a href="#"><i style="padding-right:15px; font-size: 25px;   color: rgb(92, 134, 238);" class="fa fa-instagram" aria-hidden="true"></i></a>
                   </div>
                    </div>
                 </div>
             </nav>
        
        <!-- Contact -->
        <div class="container">
            <div id="Contact">
        <div class="htag">
        </div>
        <div class="content_contact">
            <div class="Cont_Menu">
                <form method="POST" action="#">
                  <h1>Send us a Message</h1>
                <label for="Nom">Nom</label><br>
                <input type="text" name="Nom" placeholder="nom" id="Nom"><br>
                <label for="Email">Email</label><br>
                <input type="email" name="Email" placeholder="email" id=""><br>
                <label for="Message">Message</label><br>
                <textarea style="resize: none; margin-bottom: 20px;" name="Message" id="" cols="25" rows="5" placeholder="message"></textarea><br>
                <input style="background-color:rgb(50, 49, 49); color: white" type="submit" style="font-size: 10px;">
                </form>
           </div>
           <div class="Cont_Relation">
               <h1>Contact us</h1>
              <div class="Space">
                <div>
                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                <h6>LOCATION: Delmas75 Rue Ambroise</h6>
                </div>
               
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457
                         2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034
                          1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/></svg><h6>PHONE: +509 31585873</h6>
           
                </div>
                 
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
                        <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2
                         14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z"/></svg><h6>EMAIL: abdueljhon@gmail.com</h6>
                </div>

                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-globe-asia-australia" viewBox="0 0 16 16">
                        <path d="m10.495 6.92 1.278-.619a.483.483 0 0 0 .126-.782c-.252-.244-.682-.139-.932.107-.23.226-.513.373-.816.53l-.102.054c-.338.178-.264.626.1.736a.476.476 0 0 0 .346-.027ZM7.741 9.808V9.78a.413.413 0 1 1 .783.183l-.22.443a.602.602 0 0 1-.12.167l-.193.185a.36.36 0 1 1-.5-.516l.112-.108a.453.453 0 0 0 .138-.326ZM5.672 12.5l.482.233A.386.386 0 1 0 6.32 12h-.416a.702.702 0 0 1-.419-.139l-.277-.206a.302.302 0 1 0-.298.52l.761.325Z"/>
                        <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0ZM1.612 10.867l.756-1.288a1 1 0 0 1 1.545-.225l1.074 1.005a.986.986 0 0 0 1.36-.011l.038-.037a.882.882 0 0 0 .26-.755c-.075-.548.37-1.033.92-1.099.728-.086 1.587-.324 1.728-.957.086-.386-.114-.83-.361-1.2-.207-.312 0-.8.374-.8.123 0 .24-.055.318-.15l.393-.474c.196-.237.491-.368.797-.403.554-.064 1.407-.277 1.583-.973.098-.391-.192-.634-.484-.88-.254-.212-.51-.426-.515-.741a6.998 6.998 0 0 1 3.425 7.692 1.015 1.015 0 0 0-.087-.063l-.316-.204a1 1 0 0 0-.977-.06l-.169.082a1 1 0 0 1-.741.051l-1.021-.329A1 1 0 0 0 11.205 9h-.165a1 1 0 0 0-.945.674l-.172.499a1 1 0 0 1-.404.514l-.802.518a1 1 0 0 0-.458.84v.455a1 1 0 0 0 1 1h.257a1 1 0 0 1 .542.16l.762.49a.998.998 0 0 0 .283.126 7.001 7.001 0 0 1-9.49-3.409Z"/>
                      </svg><h6>SITE WEB: Fresco.com</h6>
                </div>
                </div>  
           </div>
        </div>
      </div>
        </div>
    </body>
</html>
