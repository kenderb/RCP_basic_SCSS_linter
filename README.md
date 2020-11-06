![](https://img.shields.io/badge/Microverse-blueviolet)

# Basic scss file linter

> Create a linter for best practices on SCSS files.
This project was made to push me in a real-life situation creating a program with requirements and deadlines to output a functional product at the end.

## Built With

- Ruby
- RSpec gem
- Colorize gem
- Strscan gem
- VS Code

## Requirements

- Latest Ruby version.
- run bundle install.


## Getting Started
To get a local copy up and running follow these simple example steps.

- Open a terminal or command prompt interface on your PC.
- Clone the repo with: git clone  > https://github.com/kenderb/RCP_basic_SCSS_linter.git
- On the terminal navigate to the project directory using cd RCP_basic_SCSS_linter/


## Instructions
> To check for errors in your scss file run the code ruby bin/main.rb + path to scss file you want to check.
- If you have ERROS that will be display on the console like this. </br></br>
<img src='https://lh3.googleusercontent.com/pw/ACtC-3dIA1T3bwLIC6Dr8do9ckTbrwIdY-s0GohoVWM6r2KMsrumPWLbLMD3E-dz3_fLuKW-j_KI1n9GxV0A0KSj6cQW5yzS4YGC8CjY_q2WId4ixsX3yUNAOlNfwBNIvfboY9e91cGeT14d-3fYoe6qDcHU=w618-h218-no?authuser=0'> </br>
- If you have not ERROS that will be display on the console like this. </br></br>
<img src='https://lh3.googleusercontent.com/KNdNhWNi06eSVGPcgbGvY0-m4uzzdwm1OBc1mS3DpNQs3iiWZ0WZzTfkk0a5_k3DqxhGdqgeWbj1gPlpLZ_yXa1DPEopfIZnN6Z5naTI4RITocuJ9gfZ7r4isE3juoiOsIcEGdpwE7qeI2eOxOeb0KXYNHSpJEhtoM2v5CFGW53qaOM-PmuQBs99kuQ0xtFjc9SlFPP5D-85psAp0SQ_-2CH3TUTnV57C3bXW3oEwW7ZjWL-KYifLwVVvigiZArDVlP5qKlyd0pUYSgaabgSMKiGPfdTovxk1ef_hAYwIv4yJF9UoXGdUgrMHhSRvNJlzWoG1BNzF_0Zo4VOZmsE9Ja7klO_yUB_xaV9jBiMD2ZaYO89VpNvnpcdhvNZYFPb5MPbq8Y3hH4JmFGKPHDPtcFLGBzrjjgjVRIq23-HZY_NuWq9lr66opD0Iyb6BapqpxlQlSJ4mextS6p4IQcjqlPGADXa-I4yup3HuVdigNZYUTAssRL1LCCg_Re7hStBwH-Inb6t1ydvkKiR7-w1NszpA8CpHc6VepyMywJ5PSL4KgLOYa6kR4mZJpbd_PQwHtWSHExyQp8TrtPO0BdlosAH5Ipgk4LugNMeX95YZIjXF7S4R5agpVz3KxCkHeO0By0rILdlR-ACwLP2cpaJ6_ys-aHxml929x4UuKyDS9XcSv4JsKX15DzVmhoA=w186-h85-no?authuser=0'></br>

## How it works
The linter scan the SCSS file and show you the errors:
- Use of @mixin that generates duplicates code after compiling it use %placeholders to reduce it. </br>
	<b> Good practice</b>
	```
	%title-small {
	    font-size: 15px;
	    font-family: Roboto;
	    color: #F2F2F2;
	}
	.blog-title {
	    @extend %title-small;
	}
	.page-title {
	    @extend %title-small;
	}
	```
	<b> Bad practice</b>
	```
	@mixin primary-title ($fontSize) {
	    font-family: Quicksand;
	    font-weight: 600;
	    font-size: $fontSize;
	}

	.blog-title {
	     @include primary-title(15px);
	}
	.page-title {
	     @include primary-title(19px);
	}
	```
- Missed semicolon ERROR. </br>
	<b> Good practice</b>
	```
	.bg_color {
  	    background: red;
	}
	```
	<b> Bad practice</b>
	```
	.bg_color {
  	    background: red
	}
	```
	
- Unclosed block ERROR. </br>
	<b> Good practice</b>
	```
	.bg_color {
  	    background: red;
	}
	```
	<b> Bad practice</b>
	```
	.bg_color {
  	    background: red;
	
	```
- Found CamelCase, snake, lowerCamelCase ERROR. </br>
	<b> Good practice</b>
	```
	.fh-selector {
	  font-size: 21rem;
	}

	.htag-selector {
	  font-size: 15rem;
	}
	```
	<b> Bad practice</b>
	```
	.FhSelector {
	  font-size: 21rem;
	}

	.htagSelector {
	  font-size: 15rem;
	}
	```
    
## Running Tests

- Open the console
- Navigate to the RCP_basic_scss_file_linter project
- Run gem install rspec
- Run rspec
- The spec foder contains the test file with a Helper.

## Author

👤 **Kender Bolivar**

- GitHub: [@kenderb](https://github.com/ken)
- Twitter: [@twitterhandle](https://twitter.com/KBTarts)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/kender-bolivar-1736086b/)

## Show your support

Give a ⭐️ if you like this project!
