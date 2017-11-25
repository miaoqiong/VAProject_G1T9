<!DOCTYPE html>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-gb" lang="en" xmlns:og="http://opengraphprotocol.org/schema/" xmlns:fb="http://www.facebook.com/2008/fbml" itemscope itemtype="http://schema.org/Map">

    <head>
        <title>OII Network Visualisation</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta charset="utf-8">
            <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1,user-scalable=no" />
            <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
            <%@include file="includes.jsp"%>

            <!--[if IE]><script type="text/javascript" src="js/excanvas.js"></script><![endif]--> <!-- js/default.js -->
            <!--            <script src="js/jquery/jquery.min.js" type="text/javascript"></script>
                        <script src="js/sigma/sigma.min.js" type="text/javascript" language="javascript"></script>
                        <script src="js/sigma/sigma.parseJson.js" type="text/javascript" language="javascript"></script>
                        <script src="js/fancybox/jquery.fancybox.pack.js" type="text/javascript" language="javascript"></script>
                        <script src="js/main.js" type="text/javascript" language="javascript"></script>
            
                        <link rel="stylesheet" type="text/css" href="js/fancybox/jquery.fancybox.css"/>
                        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
                        <link rel="stylesheet" media="screen and (max-height: 770px)" href="css/tablet.css" />-->

            <script src="<c:url value='resource/js/main.js'/>" type="text/javascript" language="javascript"></script>
            <script src="<c:url value='resource/js/jquery/jquery.min.js'/>" type="text/javascript"></script>
            <script src="<c:url value='resource/js/sigma/sigma.min.js'/>" type="text/javascript" language="javascript"></script>
            <script src="<c:url value='resource/js/sigma/sigma.parseJson.js'/>" type="text/javascript" language="javascript"></script>
            <script src="<c:url value='resource/js/fancybox/jquery.fancybox.pack.js'/>" type="text/javascript" language="javascript"></script>


            <link rel="stylesheet" type="text/css" href="<c:url value='resource/js/fancybox/jquery.fancybox.css'/>"/>
            <link rel="stylesheet" href="<c:url value='resource/css/style.css'/>" type="text/css" media="screen" />
            <link rel="stylesheet" media="screen and (max-height: 770px)" href="<c:url value='resource/css/tablet.css'/>" />
    </head>


    <body>
        <%@include file="nav.jsp"%> 
        <div class="container">
            <div class="sigma-parent">
                <div class="sigma-expand" id="sigma-canvas"></div>
            </div>
            <div id="mainpanel">
                <div class="col">
                    <div id="maintitle"></div>
                    <div id="title"></div>
                    <div id="titletext"></div>
                    <div class="info cf">
                        <dl>
                            <dt class="moreinformation"></dt>
                            <dd class="line"><a href="#information" class="line fb">More about this visualisation</a></dd>
                        </dl>
                    </div>
                    <div id="legend">
                        <div class="box">
                            <h2>Legend:</h2>
                            <dl>
                                <dt class="node"></dt>
                                <dd></dd>
                                <dt class="edge"></dt>
                                <dd></dd>
                                <dt class="colours"></dt>
                                <dd></dd>		
                            </dl>
                        </div>
                    </div> 
                    <div class="b1">
                        <form>
                            <div id="search" class="cf"><h2>Search:</h2>
                                <input type="text" name="search" value="Search by Airport IATA Code" class="empty"/><div class="state"></div>
                                <div class="results"></div>
                            </div>
                            <div class="cf" id="attributeselect"><h2>Group Selector:</h2>
                                <div class="select">Select Group</div>
                                <div class="list cf"></div>
                            </div>
                        </form>
                    </div>
                </div>
                <div id="information">
                </div>
            </div>
            <div id="zoom">
                <div class="z" rel="in"></div> <div class="z" rel="out"></div> <div class="z" rel="center"></div>
            </div>
            <div id="copyright">
                <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/"><img alt="Creative Commons License" style="border-width:0" src="<c:url value='resource/images/CC.png'/>" /></a></div>
            <div id="attributepane">
                <div class="text">
                    <div title="Close" class="left-close returntext"><div class="c cf"><span>Return to the full network</span></div></div>	
                    <div class="headertext">
                        <span>Airport Details</span>
                    </div>	
                    <div class="nodeattributes">
                        <div class="name"></div>
                        <div class="data"></div>
                        <div class="p">Connections:</div>
                        <div class="link">
                            <ul>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div id="developercontainer">
                <a href="http://www.oii.ox.ac.uk" title="Oxford Internet Institute"><div id="oii"><span>OII</span></div></a>
                <a href="http://jisc.ac.uk" title="JISC"><div id="jisc"><span>JISC</span></div></a>	
            </div>
        </div>
        <script type="text/javascript">

            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-21293169-4']);
            _gaq.push(['_setDomainName', 'none']);
            _gaq.push(['_setAllowLinker', true]);
            _gaq.push(['_trackPageview']);

            (function () {
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(ga, s);
            })();

        </script>
    </body>
</html>
