<!DOCTYPE html>
<html lang="en">

<head>
  <title>Secure File Handling</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta charset="utf-8" />
  <link href="css/index.css" rel="stylesheet"/>
	<link href="css/style.css" rel="stylesheet"/>
  <style data-tag="reset-style-sheet">
       
  </style>
  <style data-tag="default-style-sheet">
    
  </style>
  <link rel="stylesheet" href="https://unpkg.com/animate.css@4.1.1/animate.css" />
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Inter:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
    data-tag="font" />
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=STIX+Two+Text:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&amp;display=swap"
    data-tag="font" />
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Inter:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
    data-tag="font" />
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
    data-tag="font" />
  <link rel="stylesheet" href="https://unpkg.com/@teleporthq/teleport-custom-scripts/dist/style.css" />
  <style>
.bgimage {
    background: url("css/images/123.jpg");
    background-size: cover; /* Ensures the image covers the entire element */
    width: 100%; /* Optional: Set width */
    height: 100vh; /* Optional: Set height to full viewport height */
    margin: 0;
    padding: 0;
}
 				     @keyframes scroll-x {
				    	from {
                        transform: translateX(0);
                      }

                      to {
                        transform: translateX(calc(-100% - 16px));
                      }
                    }

                    @keyframes scroll-y {
                      from {
                        transform: translateY(0);
                      }

                      to {
                        transform: translateY(calc(-100% - 16px));
                      }
                    }
                    
                    .button {
  color: var(--dl-color-theme-neutral-dark);
  display: inline-block;
  padding: 0.5rem 1rem;
  border-color: var(--dl-color-theme-neutral-dark);
  border-width: 1px;
  border-radius: 4px;
  background-color: var(--dl-color-theme-neutral-light);
}
.contact-wrapper{
background: gray;
}
  </style>
</head>

<body>

<link href="https://fonts.googleapis.com/css?family=Roboto:100" rel="stylesheet">


  <!-- <link rel="stylesheet" href="./style.css"/> -->
  <form action="<%= request.getContextPath() %>/upload" method="post">
   <div class="bgimage">
    <div class="home-container">
        <navbar-wrapper class="navbar-wrapper"/>
        <!--Navbar component-->
        <header class="navbar-container">
            <header data-thq="thq-navbar" class="navbar-navbar-interactive">
                
                <div class="hero-actions">
                    <a href="<%= request.getContextPath() %>/login" class="button">Admin Portal</a>
                    <a href="<%= request.getContextPath() %>/userlogin" class="button">User Portal</a>
                </div>
            </header>
        </header>
        </navbar-wrapper>
        <hero-wrapper class="hero-wrapper123">
            <!--Hero component-->
            <div class="hero-header78">
                <div class="hero-column thq-section-max-width thq-section-padding">
                    <div class="hero-content1">
                        <div>
                            <h1 class="hero-text1 thq-heading-1">
                                <span style="color: white;">Welcome to Secure File Handling Platform</span>
                            </h1>
                            <p class="hero-text2 thq-body-large">
                                <span style="color: white;">
                                    Welcome to the world of secure file handling! Safeguard your data with precision and confidence as we explore best practices and advanced techniques.
                                </span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero-content2">
                <div class="hero-row-container1 thq-animated-group-container-horizontal thq-mask-image-horizontal">
                    <div class="thq-animated-group-horizontal">
                        <img alt="Admin Login Image" src="css/images/1.png" class="hero-placeholder-image10 thq-img-ratio-1-1 thq-img-scale" />
                        <img alt="Student Login Image" src="css/images/7.jpg" class="hero-placeholder-image11 thq-img-ratio-1-1 thq-img-scale" />
                        <img alt="Hero Image" src="css/images/2.jpg" class="hero-placeholder-image12 thq-img-ratio-1-1 thq-img-scale" />
                        <img alt="Hero Image" src="css/images/6.jpg" class="hero-placeholder-image13 thq-img-ratio-1-1 thq-img-scale" />
                        <img alt="Hero Image" src="css/images/9.jpg" class="hero-placeholder-image14 thq-img-ratio-1-1 thq-img-scale" />
                    </div>
                    <div class="thq-animated-group-horizontal">
                        <img alt="Admin Login Image" src="css/images/1.png" class="hero-placeholder-image10 thq-img-ratio-1-1 thq-img-scale" />
                        <img alt="Student Login Image" src="css/images/7.jpg" class="hero-placeholder-image11 thq-img-ratio-1-1 thq-img-scale" />
                        <img alt="Hero Image" src="css/images/2.jpg" class="hero-placeholder-image12 thq-img-ratio-1-1 thq-img-scale" />
                        <img alt="Hero Image" src="css/images/6.jpg" class="hero-placeholder-image13 thq-img-ratio-1-1 thq-img-scale" />
                        <img alt="Hero Image" src="css/images/9.jpg" class="hero-placeholder-image14 thq-img-ratio-1-1 thq-img-scale" />
                    </div>
                </div>
            </div>
            <div class="hero-container2">
            </div>
        </hero-wrapper>
    </div>
</div>
      <features1-wrapper class="features1-wrapper">
        <!--Features1 component-->
        <div class="thq-section-padding">
          <div class="features1-container2 thq-section-max-width">
            <div class="features1-tabs-menu">
              <div class="features1-tab-horizontal1">
                <div class="features1-divider-container1">
                  <div class="features1-container3"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </features1-wrapper>
      <cta-wrapper class="cta-wrapper">
        <!--CTA component-->
        <div class="thq-section-padding">
          <div class="thq-section-max-width">
            <div class="cta-accent2-bg">
              <div class="cta-accent1-bg">
                <div class="cta-container2">
                  <div class="cta-content">
                  
                    <span class="thq-heading-2">
                      <span>Welcome to the Secure File Handling Platform</span>
                    </span>
                  </div>
                  <div class="cta-actions">
                    <a href="<%= request.getContextPath() %>/login" class="button">Admin Portal</a>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </cta-wrapper>
      <features2-wrapper class="features2-wrapper">
        <!--Features2 component-->
        <div class="thq-section-padding">
          <div class="features2-container2 thq-section-max-width">
            <div class="features2-tabs-menu">
              <div class="features2-tab-horizontal1">
                <div class="features2-divider-container1">
                  <div class="features2-container3"></div>
                </div>
                <div class="features2-content1">
                  <h2 class="thq-heading-2"><span>Admin and User Login</span></h2>
                  <span class="thq-body-small">
                    <span>
                      Welcome to the essential guide on secure file handling! Discover how to protect your sensitive data from breaches and unauthorized access. Learn best practices for encryption, access controls, and secure storage to ensure your files remain safe and confidential.
                    </span>
                  </span>
                </div>
              </div>
              <div class="features2-tab-horizontal2">
                <div class="features2-divider-container2">
                  <div class="features2-container4"></div>
                </div>
                <div class="features2-content2">
                  <h2 class="thq-heading-2">
                    <span>Convenient</span>
                  </h2>
                  <span class="thq-body-small">
                    <span>
                      Explore advanced techniques such as encryption, access controls, and secure storage solutions. 
                    </span>
                  </span>
                </div>
              </div>
              <div class="features2-tab-horizontal3">
                <div class="features2-divider-container3">
                  <div class="features2-container5"></div>
                </div>
                <div class="features2-content3">
                  <h2 class="thq-heading-2"><span>A complete File Handling system</span></h2>
                  <span class="thq-body-small">
                    <span>
                      Learn how to implement robust security measures to safeguard your files from breaches and unauthorized access, ensuring your information remains confidential and secure.
                    </span>
                  </span>
                </div>
              </div>
            </div>
            <div class="features2-image-container">
              <img alt="feature 1"
                src="https://thedigitalgrapevine.com/wp-content/uploads/2023/04/digital-revolution-1980-1.jpeg"
                class="features2-image1 thq-img-ratio-16-9" />
            </div>
          </div>
        </div>
      </features2-wrapper>
      <steps-wrapper class="steps-wrapper">
        <!--Steps component-->
        <div class="steps-container1 thq-section-padding">
          <div class="steps-max-width thq-section-max-width">
            <div class="steps-container2 thq-grid-2">
              <div class="steps-section-header">
                <h2 class="thq-heading-2">
                  Upload File
                </h2>
                <p class="thq-body-large">
                  Click below to experience the advanced Secure File Handling.
                </p>
                <div class="steps-actions">
                  <a href="<%= request.getContextPath() %>/answer " class="button">User Portal</a>
                  </button>
                </div>
              </div>
              <div class="steps-container3">
                <div class="steps-container4 thq-card">
                  <h2 class="thq-heading-2"><span>Admin Login</span></h2>
                  <span class="steps-text14 thq-body-small">
                    <span>
                      Admin can log in using their credentials to manage the overall operations.
                    </span>
                  </span>
                  <label class="steps-text15 thq-heading-3">01</label>
                </div>
                <div class="steps-container5 thq-card">
                  <h2 class="thq-heading-2"><span>User Login</span></h2>
                  <span class="steps-text17 thq-body-small">
                    <span>
                      User can log in using their credentials to upload the files.
                    </span>
                  </span>
                  <label class="steps-text18 thq-heading-3">02</label>
                </div>
                <div class="steps-container6 thq-card">
                  <h2 class="thq-heading-2"><span>Download File</span></h2>
                  <span class="steps-text20 thq-body-small">
                    <span>
                      Users can download the file by using the key.
                    </span>
                  </span>
                  <label class="steps-text21 thq-heading-3">03</label>
                </div>
                <div class="steps-container7 thq-card">
                  <h2 class="thq-heading-2"><span> Security</span></h2>
                  <span class="steps-text23 thq-body-small">
                    <span>All these activities are managed by the admin which enable secure file handling and transfer.
                    </span>
                  </span>
                  <label class="steps-text24 thq-heading-3">04</label>
                </div>
              </div>
            </div>
          </div>
        </div>
      </steps-wrapper>
      <contact-wrapper class="contact-wrapper">
        <!--Contact component-->
        <div class="hello" style="background-color: #AEA7BF;">
        <div class="contact-contact20 thq-section-padding">
          <div class="contact-max-width thq-section-max-width">
            <div class="contact-section-title">
              <span class="thq-body-small">
                <span>Get in touch with us!</span>
              </span>
              <div class="contact-content1">
                <h2 class="thq-heading-2"><span>Contact Us</span></h2>

              </div>
            </div>
            <div class="contact-row">
              <div class="contact-content2">
                <svg viewBox="0 0 1024 1024" class="thq-icon-medium">
                  <path
                    d="M854 342v-86l-342 214-342-214v86l342 212zM854 170q34 0 59 26t25 60v512q0 34-25 60t-59 26h-684q-34 0-59-26t-25-60v-512q0-34 25-60t59-26h684z">
                  </path>
                </svg>
                <div class="contact-contact-info1">
                  <div class="contact-content3">
                    <h3 class="contact-text4 thq-heading-3">Email</h3>
                    <p class="contact-text5 thq-body-large">
                      <span>
                        contact@greensoftgroups.com€‹
                      </span>
                    </p>
                  </div>
                </div>
              </div>
              <div class="contact-content4">
                <svg viewBox="0 0 1024 1024" class="thq-icon-medium">
                  <path
                    d="M282 460q96 186 282 282l94-94q20-20 44-10 72 24 152 24 18 0 30 12t12 30v150q0 18-12 30t-30 12q-300 0-513-213t-213-513q0-18 12-30t30-12h150q18 0 30 12t12 30q0 80 24 152 8 26-10 44z">
                  </path>
                </svg>
                <div class="contact-contact-info2">
                  <div class="contact-content5">
                    <h3 class="contact-text6 thq-heading-3">Phone</h3>
                    <p class="contact-text7 thq-body-large">
                      <span>
                        +91 7708007655
                        <br>
                        +91 7200047270
                      </span>
                    </p>
                  </div>
                </div>
              </div>
              <div class="contact-content6">
                <svg viewBox="0 0 1024 1024" class="thq-icon-medium">
                  <path
                    d="M512 0c-176.732 0-320 143.268-320 320 0 320 320 704 320 704s320-384 320-704c0-176.732-143.27-320-320-320zM512 512c-106.040 0-192-85.96-192-192s85.96-192 192-192 192 85.96 192 192-85.96 192-192 192z">
                  </path>
                </svg>
                <div class="contact-contact-info3">
                  <div class="contact-content7">
                    <h3 class="contact-text8 thq-heading-3">Office</h3>
                    <p class="contact-text9 thq-body-large">
                      <span>
                        NO.29, 8th Cross East, Thillainagar Trichy, Tamilnadu, India, Pincode - 620 018.
                      </span>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        </div>
      </contact-wrapper>
    </div>
  </div>
  <script data-section-id="navbar" src="https://unpkg.com/@teleporthq/teleport-custom-scripts"></script>
</body>
</form>
</html>
