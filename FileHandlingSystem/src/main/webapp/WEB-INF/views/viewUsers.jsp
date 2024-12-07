<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="net.file.model.*"%>
<%
    List<UserRegister> users = (List<UserRegister>) request.getAttribute("users");
%>


<!DOCTYPE html>
<html lang="en">
<head>
     <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Registered Users</title>
    <style type="text/css">
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
             margin-left: 500px;
        }

        form {
            width: 80%;
            max-width: 600px;
            margin: auto;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-left: 400px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
            color: #333;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        .mainContainer {
            width: 100%;
            max-width: 800px;
            margin: auto;
        }

        @media screen and (max-width: 600px) {
            form {
                width: 90%;
            }
        }
        
        
    .headingsContainer{
        text-align: center;
    }

    .headingsContainer p{
        color: gray;
    }
    .mainContainer{
        padding: 16px;
    }

    .subcontainer{
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-between;
    }

    .subcontainer a{
        font-size: 16px;
        margin-bottom: 12px;
    }

    span.forgotpsd a {
        float: right;
        color: whitesmoke;
        padding-top: 16px;
      }

    .forgotpsd a{
        color: rgb(74, 146, 235);
      }
      
    .forgotpsd a:link{
        text-decoration: none;
      }

      .register{
        color: white;
        text-align: center;
      }
      
      .register a{
        color: rgb(74, 146, 235);
      }
      
      .register a:link{
        text-decoration: none;
      }

      /* Media queries for the responsiveness of the page */
      @media screen and (max-width: 600px) {
        form{
          width: 25rem;
        }
      }
      
      @media screen and (max-width: 400px) {
        form{
          width: 20rem;
        }
      }
        
        body{
  background: #3399ff;
}


.circle{
  position: absolute;
  border-radius: 50%;
  background: white;
  animation: ripple 15s infinite;
  box-shadow: 0px 0px 1px 0px #508fb9;
}

.small{
  width: 200px;
  height: 200px;
  left: -100px;
  bottom: -100px;
}

.medium{
  width: 400px;
  height: 400px;
  left: -200px;
  bottom: -200px;
}

.large{
  width: 600px;
  height: 600px;
  left: -300px;
  bottom: -300px;
}

.xlarge{
  width: 800px;
  height: 800px;
  left: -400px;
  bottom: -400px;
}

.xxlarge{
  width: 1000px;
  height: 1000px;
  left: -500px;
  bottom: -500px;
}

.shade1{
  opacity: 0.2;
}
.shade2{
  opacity: 0.5;
}

.shade3{
  opacity: 0.7;
}

.shade4{
  opacity: 0.8;
}

.shade5{
  opacity: 0.9;
}

@keyframes ripple{
  0%{
    transform: scale(0.8);
  }
  
  50%{
    transform: scale(1.2);
  }
  
  100%{
    transform: scale(0.8);
  }
}
.thq-img-ratio-16-8 {
  height: 700px;
  width: 600px;
  position: absolute;
  z-index: 1;
  margin-left: -350px;
  margin-top: -150px;
  
}
        
    </style>
</head>
<body>

<div class='ripple-background'>
  <div class='circle xxlarge shade1'></div>
  <div class='circle xlarge shade2'></div>
  <div class='circle large shade3'></div>
  <div class='circle mediun shade4'></div>
  <div class='circle small shade5'></div>
</div>


<div class="mainContainer">

<div class="features2-image-container">
	 <img alt="feature 1"
        src="css/images/rebg8.png"
        class="features2-image1 thq-img-ratio-16-8" />
<h1>Registered Users</h1>
<form action="adminHandle" method="get">

<table border="1">
    <tr>
        <th>ID</th>
        <th>Username</th>
    </tr>
    <% 
        if (users != null) {
            for (UserRegister user : users) { 
    %>
    <tr>
        <td><%= user.getId() %></td>
        <td><%= user.getUsername() %></td>
    </tr>
    <% 
            }
        }
    %>
</table>
</form>
</div>
</body>
</html>