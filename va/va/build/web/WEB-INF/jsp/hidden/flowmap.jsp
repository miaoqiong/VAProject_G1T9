
<!DOCTYPE html>
<html lang="en" xmlns:fb="http://ogp.me/ns/fb#">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="This flight animation uses d3.js geo and SVG transition.">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/v4.css">
    <script src="/js/jquery-2.1.3.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="//platform-api.sharethis.com/js/sharethis.js#property=58e1a323bd89c500112d1055&product=inline-share-buttons"></script>
    <title>Flight Animation - TNODA</title>
    
<link rel="stylesheet" href="/css/v4blue.css">
<style>
.countries {
  fill: #b0d0ab;
  stroke: #6cb0e0;
  stroke-width: 0.5px;
  stroke-linecap: round;
  stroke-linejoin: round;
  vector-effect: non-scaling-stroke;
}
.airports {
  fill: #036;
  stroke: #6cb0e0;
  stroke-width: 0.5px;
  stroke-linecap: round;
  stroke-linejoin: round;
  vector-effect: non-scaling-stroke;
}
.route {
  fill: none;
  stroke-width: 0;
}
.plane {
  fill: #fff;
  stroke-width: 0;
}
@media(max-width: 768px) {
  #map {
    margin-top: -100px;
  }
}
@media(min-width: 768px) {
  #map {
    margin-top: -300px;
  }
}
</style>

  </head>
  <body>
    <div class="header">
      <nav class="navbar navbar-inverse">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-menu">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a href="/" title="TNODA" class="navbar-brand"><svg viewBox="0 0 100 100"><polygon points="100,4 100,84 85,88 56,40 62,42 62,22 77,18 77,38 71,40 85,64 85,8" class="logo_line"/><polygon points="52,39 52,96 37,100 37,35" class="logo_line"/></svg></a>
          </div>
          <div class="collapse navbar-collapse" id="nav-menu">
            <ul class="nav navbar-nav navbar-right">
              <li class="dropdown">
                <a href="#" data-toggle="dropdown">BLOG</a>
                <ul class="dropdown-menu">
                  
                  <li><a class="blog_title" href="/blog/2014-04-02">Flight Animation with d3.js</a></li>
                  
                  <li><a class="blog_title" href="/blog/2014-01-28">????????????30?4?1???</a></li>
                  
                  <li><a class="blog_title" href="/blog/2014-01-25">?????????: ????????????</a></li>
                  
                  <li><a class="blog_title" href="/blog/2013-12-31">????????? ??????SNS?Pinterest?????</a></li>
                  
                  <li><a class="blog_title" href="/blog/2013-12-19">SVG-based Sparkline with d3.js</a></li>
                  
                  <li><a class="blog_title" href="/blog/2013-12-15">?????????????</a></li>
                  
                  <li><a class="blog_title" href="/blog/2013-12-07">Interactive Map with d3.js</a></li>
                  
                  <li><a class="blog_title" href="/blog/2013-12-04">??? ????? - You Are Here Collection</a></li>
                  
                  <li><a class="blog_title" href="/blog/2013-11-24">529?????</a></li>
                  
                  <li><a class="blog_title" href="/blog/2013-11-23">Passing arguments to Python Hadoop Streaming</a></li>
                  
                  <li><a class="blog_title" href="/blog/2013-11-22">Prettyprint in Bootstrap 3</a></li>
                  
                  <li class="divider"></li>
                  <li><a href="/archive">Blog Archive</a></li>
                </ul>
              </li>
              <li class="dropdown">
                <a href="#" data-toggle="dropdown">PORTFOLIO</a>
                <ul class="dropdown-menu">
                  <li><a href="/illustration">Illustration</a></li>
                  <li><a href="/flightanimation">Flight Animation</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </div>
    <div class="content">
      
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=1438928666326123";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <div>
  
  <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
  <ins class="adsbygoogle" style="display:block" data-ad-client="ca-pub-4244994827384783" data-ad-slot="9042953150" data-ad-format="auto"></ins>
  <script>(adsbygoogle = window.adsbygoogle || []).push({});</script>
  
</div>
    </div>
    <div class="col-xs-12">
      <h2>Flight Animation</h2>
      <div><div class="sharethis-inline-share-buttons"></div></div>
      <p class="lead" style="margin-bottom: 0;">This flight animation uses d3.js geo and SVG transition.</p>
    </div>
  </div>
</div>
<div id="map"></div>
<div class="container">
  <div class="row">
    <div class="col-xs-12" style="margin-bottom: 30px;">
      <div>
  
  <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
  <ins class="adsbygoogle" style="display:block" data-ad-client="ca-pub-4244994827384783" data-ad-slot="9042953150" data-ad-format="auto"></ins>
  <script>(adsbygoogle = window.adsbygoogle || []).push({});</script>
  
</div>
    </div>
  </div>
</div>

    </div>
    <div class="footer">
      <div class="container">
        <div class="row">
          <div class="col-sm-6">
            <p><a href="/archive">BLOG</a></p>
          </div>
          <div class="col-sm-6">
            <p class="copy">&copy; 2013 - 2017 <a href="/">TNODA.COM</a></p>
          </div>
        </div>
      </div>
    </div>
    
    <script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', 'UA-41013822-1', 'tnoda.com');ga('send', 'pageview');
    </script>
    
    
<script>(function() {var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;po.src = 'https://apis.google.com/js/platform.js';var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);})();</script>
<script src="//d3js.org/d3.v3.min.js"></script>
<script src="//d3js.org/queue.v1.min.js"></script>
<script src="//d3js.org/topojson.v1.min.js"></script>
<script src="/js/flightanimation.js"></script>

  </body>
</html>