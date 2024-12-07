<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="net.file.model.*"%>
<%
    List<FileDetail> files = (List<FileDetail>) request.getAttribute("files");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Uploaded Files</title>
    <style type="text/css">
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        form {
            width: 80%;
            max-width: 400px;
            margin: auto;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            font-size: 16px;
            margin-bottom: 10px;
            color: #333;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        button {
            background-color: #007bff;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        table {
            width: 80%;
            max-width: 600px;
            margin-top: 20px;
            border-collapse: collapse;
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

        @media screen and (max-width: 600px) {
            form, table {
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
  width: 300px;
  height: 300px;
  left: -100px;
  bottom: -100px;
}

.medium{
  width: 500px;
  height: 500px;
  left: -200px;
  bottom: -200px;
}

.large{
  width: 700px;
  height: 700px;
  left: -300px;
  bottom: -300px;
}

.xlarge{
  width: 900px;
  height: 900px;
  left: -400px;
  bottom: -400px;
}

.xxlarge{
  width: 1100px;
  height: 1100px;
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
  height: 650px;
  width: 500px;
  position: absolute;
  z-index: 1;
  margin-left: 240px;
  margin-top: -680px;
  
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


    <h1>View Uploaded Files</h1>
    <form action="ViewUploadedFilesServlet" method="post">
        <label for="userId">Enter User ID:</label>
        <input type="text" name="userId" id="userId" required>
        <button type="submit">View Files</button>
    </form>

    <% 
        if (files != null && !files.isEmpty()) {
    %>
        <table>
            <tr>
                <th>File ID</th>
                <th>File Name</th>
                <th>Upload Time</th>
                <th>Download ID</th>
            </tr>
            <% 
                for (FileDetail file : files) { 
            %>
            <tr>
                <td><%= file.getFileId() %></td>
                <td><%= file.getFileName() %></td>
                <td><%= file.getUploadTime() %></td>
                <td><%= file.getDownloadId() %></td>
            </tr>
            <% 
                }
            %>
        </table>
    <% 
        } else if (files != null) {
    %>
        <p>No files found for the given User ID.</p>
    <% 
        }
    %>
    <div class="features2-image-container">
	 <img alt="feature 1"
        src="css/images/rebg4.png"
        class="features2-image1 thq-img-ratio-16-8" />
      </div>
</body>
</html>