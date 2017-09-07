(defun xtof/org-export-header-lrg ()
  (concat
   "<header id='header' class='lrg'>"
   "<a href='/about'>"
   ;;"<img id='avatar' class='2x' src='/assets/images/avatar.png'>"
   "</a>"
   "<h1>fusupo.github.io</h1>"
   "<h4 id='subtitle'></h4>"
   "</header>"))

(defun xtof/org-export-header-sml ()
  (concat
   "<header id='header' class='sml'>"
   "<div>fusupo.github.io</div>"
   "<div id='subtitle'></div>"
   "</header>"))

(defun xtof/org-export-preamble (info)
  (let ((social (concat
                 "<div class='col-md-8 col-sm-8 col-xs-8' style='text-align:right; padding-left:5px; padding-right:5px'>"
                 "<a href='https://twitter.com/fusupo' target='_blank'>Twitter</a> | "
                 "<a href='https://www.linkedin.com/in/marcpchristophe' target='_blank'>LinkedIn</a> | "
                 "<a href='https://github.com/fusupo' target='_blank'>Github</a>"
                 "</div>"
                 )))
        (cond ((string= (car (plist-get info :title)) "fusupo.github.io")
               (concat  "<nav id='nav' class='nav-index row'>"
                        "<div class='col-md-4 col-sm-4 col-xs-4' style='padding-left:5px; padding-right:5px;'>"
                        "<a href= 'about.html '>ABOUT</a>"
                        "</div>"
                        social
                        "</nav>"
                        (xtof/org-export-header-lrg)
                        ))
              ((string= (car (plist-get info :title)) "about")
               (concat  "<nav id='nav' class='nav-about row'>"
                        "<div class='col-md-4 col-sm-4 col-xs-4' style='padding-left:5px; padding-right:5px;'>"
                        "<a href= 'index.html '>HOME</a>"
                        "</div>"
                        social
                        "</nav>"
                        (xtof/org-export-header-lrg)
                        ))
              (t (concat  "<nav id='nav' class='nav-post row'>"
                          "<div class='col-md-4 col-sm-4 col-xs-4' style='padding-left:5px; padding-right:5px;'>"
                          "<a href= \'../index.html \'>HOME</a> | "
                          "<a href= \'../about.html \'>ABOUT</a>"
                          "</div>"
                          social
                          "</nav>"
                          (xtof/org-export-header-sml)
                          )))))

(defun xtof/org-export-disqus-wiget ()
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
   "s.src = 'https://fusupogithubio.disqus.com/embed.js';"
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
   "<script id='dsq-count-scr' src='https://fusupogithubio.disqus.com/count.js' async></script>"
   ))

(defun xtof/org-export-google-analytics-widget ()
  (concat
   "<script>"
   "(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){"
   "(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),"
   "m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)"
   "})(window,document,'script','//www.google-analytics.com/analytics.js','ga');"
   "ga('create', 'UA-75904999-1', 'auto');"
   "ga('send', 'pageview');"
   "</script>"))

(defun xtof/momentjs ()
  "<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.12.0/moment.min.js'></script>")

(defun xtof/bundlejs (index?)
  (if index?
      "<script type='text/javascript' src='./js/build/bundle.js'></script>"
    "<script type='text/javascript' src='../js/build/bundle.js'></script>"))

(defun xtof/twitter-widget ()
  (concat
   "<a href='https://twitter.com/share' class='twitter-share-button' data-via='fusupo' data-size='large'>Tweet</a>"
   "<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>")
  )

(defun xtof/facebook-widget ()
  (concat
   "<a class='facebook-share' href='#'"
   "onclick=\"window.open('https://www.facebook.com/sharer/sharer.php?u='+encodeURIComponent(location.href),'facebook-share-dialog','width=626,height=436'); return false;\">"
   "<span class='icon-facebook-rect'></span>"
   "<span class='text-facebook-rect'>Share</span>"
   "</a>"
   )
  )

(defun xtof/org-export-footer ()
  (print "org-export-footer")
  (concat
   "<footer id='footer'>"
   "<p class='small'>© Marc-P. Christophe, 2017. Unauthorized use and/or duplication of this material without express and written permission from this site’s author and/or owner is strictly prohibited. Excerpts and links may be used, provided that full and clear credit is given to Marc-P. Christophe with appropriate and specific direction to the original content. </p>"
   "</footer>"))

(defun xtof/org-export-postamble (info)

  (cond ((string= (car (plist-get info :title)) "fusupo.github.io")
         (concat  "<div>"
                  (xtof/org-export-footer)                    
                  (xtof/org-export-google-analytics-widget)
                  (xtof/momentjs)
                  (xtof/bundlejs 't)
                  "</div>"))
        ((string= (car (plist-get info :title)) "about")
         (concat  "<div>"
                  (xtof/org-export-footer)                    
                  (xtof/org-export-google-analytics-widget)
                  (xtof/momentjs)
                  (xtof/bundlejs nil)
                  "</div>"))
        (t (concat  "<div>"
                    (xtof/twitter-widget)
                    (xtof/facebook-widget)
                    (xtof/org-export-disqus-wiget) 
                    (xtof/org-export-footer)                    
                    (xtof/org-export-google-analytics-widget)
                    (xtof/momentjs)
                    (xtof/bundlejs nil)
                    "</div>"))))

(defun xtof/org-export-postamble-projects (info)
  (concat  "<div>"
           (xtof/twitter-widget)
           (xtof/facebook-widget)
           (xtof/org-export-footer)                    
           (xtof/org-export-google-analytics-widget)
           (xtof/momentjs)
           (xtof/bundlejs nil)
           "</div>"))

(defun xtof/org-export-html-head-extra (index?)
  (if index?
      (print "true")
    (print "false"))
  (concat
   "<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css' integrity='sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7' crossorigin='anonymous'>"
   (if index?
       "<link rel='stylesheet' href='./style/main.css'>"
     "<link rel='stylesheet' href='../style/main.css'>"))
  )

(setq org-publish-project-alist
      `(("fusupo.github.io-index"
         :base-directory "~/Dropbox/fusupo.github.io/src/"
         :publishing-directory "~/Dropbox/fusupo.github.io/"
         :publishing-function org-html-publish-to-html
         ;;:exclude "*"
         :html-head-include-default-style nil
         :html-head-include-scripts nil
         ;;:html-head "<meta name='viewport' content='width=device-width, initial-scale=1'>"
         :html-head-extra ,(xtof/org-export-html-head-extra 't)
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
         :html-head-extra ,(xtof/org-export-html-head-extra nil)
         :html-preamble xtof/org-export-preamble
         :html-postamble xtof/org-export-postamble
         :with-toc nil
         :section-numbers nil
         )
        ("fusupo.github.io-projects"
         :base-directory "~/Dropbox/org/projects/"
         :publishing-directory "~/Dropbox/fusupo.github.io/projects/"
         :publishing-function org-html-publish-to-html
         :html-head-include-default-style nil
         :html-head-include-scripts nil
         ;; :html-head "<meta name='viewport' content='width=device-width, initial-scale=1'>"
         :html-head-extra ,(xtof/org-export-html-head-extra nil)
         :html-preamble xtof/org-export-preamble
         :html-postamble xtof/org-export-postamble-projects
         :with-toc nil
         :section-numbers nil
         )
        ("fusupo.github.io" :components ("fusupo.github.io-index" "fusupo.github.io-posts" "fusupo.github.io-projects"))))
