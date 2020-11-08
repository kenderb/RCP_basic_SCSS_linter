![](https://img.shields.io/badge/Microverse-blueviolet)

# Basic scss file linter

> Create a linter for best practices on SCSS files. I did this project to push me in a real-life situation creating a program with requirements and deadlines to output a functional product at the end.

## Built With

- Ruby
- RSpec gem
- Colorize gem
- Strscan gem
- VS Code

## Requirements

- Latest Ruby version.

## Getting Started
To get a local copy up and running follow these simple example steps.

- Open a terminal or command prompt interface on your PC.
- Clone the repo with: git clone https://github.com/kenderb/RCP_basic_SCSS_linter.git
- On the terminal navigate to the project directory using cd RCP_basic_SCSS_linter/
- run bundle install


## Instructions
> To check for errors in your SCSS file run the code ruby bin/main.rb + absolute path to SCSS file you want to check.
- You can check the Code running `bin/main.rb ./scss_test_file/sass_file.scss` in the project folder  <br/>
- If you have bad practices on the file will be displayed on the console like this. </br></br>
<img src='https://lh3.googleusercontent.com/pw/ACtC-3dIA1T3bwLIC6Dr8do9ckTbrwIdY-s0GohoVWM6r2KMsrumPWLbLMD3E-dz3_fLuKW-j_KI1n9GxV0A0KSj6cQW5yzS4YGC8CjY_q2WId4ixsX3yUNAOlNfwBNIvfboY9e91cGeT14d-3fYoe6qDcHU=w618-h218-no?authuser=0'> </br>
- If you don't have bad practices on your file will be displayed on the console like this. </br></br>
<img src='https://lh3.googleusercontent.com/pw/ACtC-3ez63rvVTV1Pvp06lejNU29wwfo67YdPkPnIATY1LYbqV0HKVY3h_Sa3c12xeC2W1Gj8OKynrgqj3Ps0hhH-uD-D3ZoAzFT831vqs-A_PPnO-z0mhWvk43CS09Xbpq5kQ_8nwiIMmxsgp4fyxhCXYNE=w186-h85-no?authuser=0'></br>

## How it works
The linter scans the SCSS file and shows you the errors:
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
- Run rspec
- The spec folder contains the test file with a Helper.


## Author

👤 **Kender Bolívar**

- GitHub: [@kenderb](https://github.com/ken)
- Twitter: [@KBTarts](https://twitter.com/KBTarts)
- LinkedIn: [KenderBolivar](https://www.linkedin.com/in/kender-bolivar-1736086b/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/kenderb/RCP_basic_SCSS_linter/issues).

## Acknowledgments

- SCSS file linter.
- [Code.tutsplus.com](https://code.tutsplus.com/tutorials/30-css-best-practices-for-beginners--net-6741)

## Show your support

Give a ⭐️ if you like this project!

