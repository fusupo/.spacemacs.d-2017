(print "-------- SETUP ORG EXPORT -------")
(defun xtof/org-export-header-lrg ()
  (concat
   "<header id='header' class='lrg'>"
   "<a href='/about'>"
   ;;"<img id='avatar' class='2x' src='/assets/images/avatar.png'>"
   "</a>"
   "<h1>Marc Christophe</h1>"
   "<h4 id='subtitle'></h4>"
   "</header>"))

(defun xtof/org-export-header-sml ()
  (print "org-export-header-sml")
  (concat
   "<header id='header' class='sml'>"
   "<div>Marc Christophe</div>"
   "<div id='subtitle'></div>"
   "</header>"))

(defun xtof/org-export-preamble (info)
  (print "org-export-preamble")
  (cond ((string= (car (plist-get info :title)) "index")
         (concat  "<nav id='nav' class='nav-index'>"
                  "<a href= 'about.html '>ABOUT</a>"
                  "</nav>"
                  (xtof/org-export-header-lrg)
                  ))
        ((string= (car (plist-get info :title)) "about")
         (concat  "<nav id='nav' class='nav-about'>"
                  "<a href= 'index.html '>HOME</a>"
                  "</nav>"
                  (xtof/org-export-header-lrg)
                  ))
        (t (concat  "<nav id='nav' class='nav-post'>"
                    "<a href= \'../index.html \'>HOME</a> | "
                    "<a href= \'../about.html \'>ABOUT</a>"
                    "</nav>"
                    (xtof/org-export-header-sml)
                    ))))

(defun xtof/org-export-disqus-wiget ()
  (print "org-export-disqus-widget")
  (concat
   "<div id='disqus_thread'></div>"
   "<script>"
   ;; /**
   ;; * RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
   ;; * LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables
   ;; */
   ;; /*
   ;; var disqus_config = function () {
   ;; this.page.url = PAGE_URL; // Replace PAGE_URL with your page's canonical URL variable
   ;; this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
   ;; };
   ;; */
   "(function() { /*DON'T EDIT BELOW THIS LINE*/"
   "var d = document, s = d.createElement('script');"
   "s.src = 'http://fusupogithubio.disqus.com/embed.js';"
   "s.setAttribute ('data-timestamp', +new Date());"
   "(d.head || d.body).appendChild(s);"
   "})();"
   "</script>"
   "<noscript>"
   "Please enable JavaScript to view the "
   "<a href='https://disqus.com/?ref_noscript' rel='nofollow'>"
   "comments powered by Disqus."
   "</a>"
   "</noscript>"
   "<script id='dsq-count-scr' src='http://fusupogithubio.disqus.com/count.js' async></script>"
   ))

(defun xtof/org-export-google-analytics-widget ()
  (print "org-export-google-analytics-widget")
  (concat
   "<script>"
   "(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){"
   "(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),"
   "m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)"
   "})(window,document,'script','//www.google-analytics.com/analytics.js','ga');"
   "ga('create', 'UA-75904999-1', 'auto');"
   "ga('send', 'pageview');"
   "</script>"))

(defun xtof/org-export-footer ()
  (print "org-export-footer")
  (concat
   "<footer id='footer'>"
   "<p class='small'>© Copyright 2016 Marc Christophe</p>"
   "<p>"
   "<a href='https://twitter.com/fusupo' target='_blank'>Twitter</a> | "
   "<a href='https://www.linkedin.com/in/marcpchristophe' target='_blank'>LinkedIn</a> | "
   "<a href='https://github.com/fusupo' target='_blank'>Github</a>"
   "</p>"
   "</footer>"))

(defun xtof/org-export-postamble (info)
  (print "org-export-postamble")
  (cond ((string= (car (plist-get info :title)) "index")
         (concat  "<div>"
                  (xtof/org-export-footer)                    
                  (xtof/org-export-google-analytics-widget)
                  "<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.12.0/moment.min.js'></script>"
                  "<script type='text/javascript' src='js/build/bundle.js'></script>" 
                  "</div>"))
        ((string= (car (plist-get info :title)) "about")
         (concat  "<div>"
                  (xtof/org-export-footer)                    
                  (xtof/org-export-google-analytics-widget)
                  "<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.12.0/moment.min.js'></script>"
                  "<script type='text/javascript' src='js/build/bundle.js'></script>"
                  "</div>"))
        (t (concat  "<div>"
                    "<a href='https://twitter.com/share' class='twitter-share-button' data-via='fusupo' data-size='large'>Tweet</a>"
                    "<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>"
                    "<a class='facebook' href='#'"
                    "onclick=\"window.open('https://www.facebook.com/sharer/sharer.php?u='+encodeURIComponent(location.href),'facebook-share-dialog','width=626,height=436'); return false;\">"
                    "<span class='icon-facebook-rect'>Share</span>"
                    "</a>"
                    (xtof/org-export-disqus-wiget) 
                    (xtof/org-export-footer)                    
                    (xtof/org-export-google-analytics-widget)
                    "<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.12.0/moment.min.js'></script>"
                    "<script type='text/javascript' src='../js/build/bundle.js'></script>"
                    "</div>"))))

(defun xtof/org-export-html-head-extra ()
  (concat
   "<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css' integrity='sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7' crossorigin='anonymous'>"
   "<link rel='stylesheet' href='style/main.css'>"
   ;; "<link rel='shortcut icon' href='http://cdn.sstatic.net/stackoverflow/img/favicon.ico'>"
   ;; "<link rel='apple-touch-icon' href='http://cdn.sstatic.net/stackoverflow/img/apple-touch-icon.png'>"
   ))

(setq org-publish-project-alist
      `(("fusupo.github.io-index"
         :base-directory "~/Dropbox/fusupo.github.io/src/"
         :publishing-directory "~/Dropbox/fusupo.github.io/"
         :publishing-function org-html-publish-to-html
         ;;:exclude "*"
         :html-head-include-default-style nil
         :html-head-include-scripts nil
         ;;:html-head "<meta name='viewport' content='width=device-width, initial-scale=1'>"
         :html-head-extra ,(xtof/org-export-html-head-extra)
         :html-preamble xtof/org-export-preamble
         :html-postamble xtof/org-export-postamble
         :with-toc nil
         :with-title nil
         :section-numbers nil 
         )
        ("fusupo.github.io-posts"
         :base-directory "~/Dropbox/fusupo.github.io/src/posts/"
         :publishing-directory "~/Dropbox/fusupo.github.io/posts/"
         :publishing-function org-html-publish-to-html
         :html-head-include-default-style nil
         :html-head-include-scripts nil
         ;; :html-head "<meta name='viewport' content='width=device-width, initial-scale=1'>"
         :html-head-extra ,(xtof/org-export-html-head-extra)
         :html-preamble xtof/org-export-preamble
         :html-postamble xtof/org-export-postamble
         :with-toc nil
         :section-numbers nil
         )
        ("fusupo.github.io" :components ("fusupo.github.io-index" "fusupo.github.io-posts")))
      )

