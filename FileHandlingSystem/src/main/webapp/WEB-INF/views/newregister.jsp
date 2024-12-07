<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="online-exam.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Register</title>
    
   <style type="text/css">
    @charset "ISO-8859-1";
    body 
    {
      font-family:sans-serif; 
      background: -webkit-linear-gradient(to right, #155799, #159957);  
      color:whitesmoke;
    }

    h1{
        text-align: center;
    }

    form{
        width:35rem;
        margin: auto;
        color:whitesmoke;
        backdrop-filter: blur(16px) saturate(180%);
        -webkit-backdrop-filter: blur(16px) saturate(180%);
        background-color: #813169;
        border-radius: 12px;
        border: 1px solid rgba(255, 255, 255, 0.125);
        padding: 20px 25px;
    }

    input[type=text], input[type=password]{
        width: 100%;
        margin: 10px 0;
        border-radius: 5px;
        padding: 15px 18px;
        box-sizing: border-box;
      }

    button {
        background-color: black;
        color: white;
        padding: 14px 20px;
        border-radius: 5px;
        margin: 7px 0;
        width: 100%;
        font-size: 18px;
      }

    button:hover {
        opacity: 0.6;
        cursor: pointer;
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
      .thq-img-ratio-16-8 {
  height: 450px;
  width: 350px;
  position: absolute;
  z-index: 1;
  margin-left: -450px;
  margin-top: -500px;
 
  
}
.thq-img-ratio-16-9 {
  height: 450px;
  width: 350px;
  position: absolute;
  z-index: 1;
  margin-left: 650px;
  margin-top: -500px;
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
        
    </style>
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
    <h1 style="color: black;">Admin Register Portal</h1>
    <form action="<%= request.getContextPath() %>/AdminRegister" method="post">
        <!-- Headings for the form -->
        <div class="headingsContainer">
            <h3>Register</h3>
            <p  style="color: white;">Register with your username and password</p>
        </div>

        <!-- Main container for all inputs -->
        <div class="mainContainer">
            <!-- Username -->
            <label for="username">Your username</label>
            <input type="text" placeholder="Enter Username" name="username" required>

            <br><br>

            <!-- Password -->
            <label for="pswrd">Your password</label>
            <input type="password" placeholder="Enter Password" name="pswrd" required>

            <br><br>
            <label for="pswrd1">Confirm password</label>
            <input type="password" placeholder="Confirm Password" name="pswrd1" required>
            
            <!-- sub container for the checkbox and forgot password link -->
            <div class="subcontainer">
                <label>
                  <input type="checkbox" checked="checked" name="remember"> Remember me
                </label>
            </div>

            <!-- Submit button -->
            <button type="submit">Register</button>
            <button type="submit"><a style="text-decoration: none; color: white;" href="<%= request.getContextPath() %>/login" class="button">Back To Login</a></button> 

        </div>
        <div class="features2-image-container">
	 <img alt="feature 1"
        src="css/images/11.png"
        class="features2-image1 thq-img-ratio-16-8" />
      </div>
       <div class="features2-image-container">
	 <img alt="feature 1"
        src="css/images/13.png"
        class="features2-image1 thq-img-ratio-16-9" />
      </div>

    </form>
     <script type="text/javascript">
    var status = document.getElementById("status").value;
    if (status === "success") {
        alert("Congrats, Account Created Successfully");
    }
    </script>
</body>
</html>