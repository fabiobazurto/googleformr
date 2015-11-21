
**googleformr** let's you POST data more securely to Google Forms without needing authentication or permissions like with Google Sheets.

Installation
============

To download the development version of **googleformr**:

Download the [zip
ball](https://github.com/steventsimpson/googleformr/zipball/master) or
[tar
ball](https://github.com/steventsimpson/googleformr/tarball/master),
decompress and run `R CMD INSTALL` on it, or use the **pacman** package
to install the development version:

    if (!require("pacman")) install.packages("pacman")
    pacman::p_load_gh("steventsimpson/googleformr")

DEMO
=======

\code{googleformr} comes pre-loaded with a Open-Source Thanksgiving Google Form to demo on; read more about it [here](https://medium.com/@data_steve/open-source-a-way-of-giving-thanks-9d7962a4518b#.fdcefvfsb). 

```r
googleformr::why_R_u_thankful("") # <- your thanksgiving goes here
```

You can create your own linked-function to a Google Form using: 

```r
# create function
form <- "your_google_form_url"
your_func <- googleformr::gformr(form)

# send data
your_func(your_data)
```

You can extract Google Form question text or entry points using:

```r
# questions
form <- "your_google_form_url"
form %>% get_form() %>% get_form_questions()

# entry ids
form %>% get_form() %>% get_form_entry_ids()
```

Contact
=======

You are welcome to: 
- submit suggestions and bug-reports at: <https://github.com/steventsimpson/googleformr/issues> 
- send a pull request on: <https://github.com/steventsimpson/googleformr/> 
- compose a friendly e-mail to: <steven.troy.simpson@gmail.com>
