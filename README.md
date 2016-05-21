



googleformr [![Follow](https://img.shields.io/twitter/follow/data_steve.svg?style=social)](https://twitter.com/intent/follow?screen_name=data_steve)
============


[![Project Status: Active - The project has reached a stable, usable
state and is being actively
developed.](http://www.repostatus.org/badges/0.1.0/active.svg)](http://www.repostatus.org/#active)
[![Build
Status](https://travis-ci.org/data-steve/googleformr.svg?branch=master)](https://travis-ci.org/data-steve/googleformr)
<a href="https://img.shields.io/badge/Version-0.1.1-orange.svg"><img src="https://img.shields.io/badge/Version-0.1.1-orange.svg" alt="Version"/></a>


<img src="inst/googleformr_logo.png" width="200px" style="float:left; margin:10px;"/>

**googleformr** is an API to Google Forms, allowing users to POST data securely to Google Forms without needing authentication or permissioning.


## 5-min How To

#### Step 1: Get googleformr

Getting googleformr is simple.  This simple chunk should have you up and running withgoogleformr in a jiffy (do people still say jiffy?):

```{r}
if (!require("pacman")) install.packages("pacman")
pacman::p_load_gh("data-steve/googleformr")
```


#### Step 2: Make a Google Form

Then make a Google Form with a text entry.  Here’s an image showing the steps to link the form to a spreadsheet. 

![](/inst/new_forms_how_to.png)

In the Google Form edit: 

1. Click Responses Tab 
2. Click those three dot thing-ies 
3. Click “Select response destination” 
4. click “Create a new spreadsheet”  

Step 1 done.  Almost there… In this image we see the Google Form and the accompanying Google Sheet.

![](/inst/form_spreadsheet.png)


#### Step 3: Send Information Via googleformr

Just use the gformr function, add the Google Form url (from Step 1) and viola you have  a function that allows you to send information to a Google Form (in this case I made a pingfunction).  This is the function we can use to send information about the package and script usage within our company.

```{r}
ping <- googleformr::gformr('https://docs.google.com/forms/d/1sLh9CBW7RuzShqnbt260Ud85I_I2qQEdw_S6iMytJx4')
ping('employee1234')
```

You’re in business with a secure way to send data from R to Google Spreadsheet.
Go ahead try it.  Replace ’employee1234′ with whatever you want, go to the Google Sheet, and watch the R code you send auto-magically be sent to the spreadsheet. I’ve made this sheet public for demonstration purposes, but generally it’s recommended that you keep the sheets private.

With this simple code snippet placed in the R scripts of our internal packages we were able to determine what packages and scripts were used, by whom, and how frequently.  So far our pneumatic road tube code  has provided insight into what tools to improve and new features to consider.  And it only took 5 minutes to set up end to end.

[revised from trinker's helpful post](https://trinkerrstuff.wordpress.com/2016/05/12/googleformr-at-work-pneumatic-road-tube-allegory/)





Send User Feedback to googleformr
============


![](inst/googleformr_yay.png)

**googleformr** comes with a `comments_gformr` function that was built with **googleformr**, allowing useRs to send comments to  a Google Form I've created for collecting user feedback. 

Not every user 

- has a github account for posting issues, 
- runs their own blog, 
- haves access to nearby useR groups.

So finding new ways to stay accessible to my useRs is important to me. 

Give it a try with something like below!

```{r}
googleformr::comments_gformr(
        post_content = "It would useful for functionality to help distinguish in the data
                        between lots of comments from one useR vs. many useRs" )
```

Create your own feedback function
=============

First, make sure to grab **googleformr** from CRAN, if you haven't yet. [I love **pacman** as my library / function handler](/let-pacman-eat-up-library-and-require/). The `p_load` will load a library. If it isn't installed, it will install from CRAN and then load it.

```{r}
if (!require("pacman")) install.packages("pacman")
pacman::p_load(googleformr)
```

You can create your own `feedback_pkg_name` function by linking it to a Google Form. Get your forms started at the [Google Forms page](https://www.google.com/forms/about/).  Once you have a google form created with one short answer question, grab the form's url and use code below: 

```{r}
# create function
form <- "your_google_form_url"
feedback_pkg_name <- gformr(form
                            , custom_reply = "Thanks for supporting pkg_name")
```

Note: it is recommended to call your feedback function 

- something clearly signalling  a feedback purpose 
- but also something specific to your package.

So a function name following the pattern `feedback_pkg_name` should get the best of easy IntelliSense auto-complete and distinguishability from other packages using the same functionality.

Once you re-document and re-build your package and post it to github or CRAN, your users can send feedback directly to you from the R console by simply  putting their feedback into your feedback function.

```{r}
fdbk <-  # their comments
feedback_pkg_name(fdbk)
```


Helper Functionality
====================

You can test that your new `feedback_pkg_name` function works by:

- sending a test message to your Google Form and see if it shows up and/or
- using the `check_form_works` function like so: `check_form_works( comments_pkg_name("test") )`. Either "All good" will appear or a specific http status message describing the error.


You can also extract Google Form question text or entry points using to make sure you can bring back the same information as is on your form:

```{r}
# questions
form <- "your_google_form_url"
form %>% get_form() %>% get_form_questions()

# entry ids
form %>% get_form() %>% get_form_entry_ids()
```

Contact
=======

You are welcome to: 
- send me a comment via `googleformr::comments_gformr()`
- submit suggestions and bug-reports at: <https://github.com/data-steve/googleformr/issues> 
- send a pull request on: <https://github.com/data-steve/googleformr/> 
- compose a friendly e-mail to: <steven.troy.simpson@gmail.com>


