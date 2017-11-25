<%-- 
    Document   : header
    Created on : Aug 24, 2016, 5:02:56 PM
    Author     : Orling
--%>
<style>
    body{
        margin-top:5%; 
    }
    .popover {
        z-index: 9999; /* A value higher than 1010 that solves the problem */
    }
</style>
<!DOCTYPE html>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style = " background-color:white">
    <div class="container">
        <div class="navbar-header page-scroll">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand page-scroll" href="/index.html">Airlines Analyse Dashboard</a>
        </div>
        
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav pull-right">
                <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                <li>
                    <a class="page-scroll" href="/index.html">Home</a>
                </li>
                <li>
                    <a class="page-scroll" href="/network.html">Network Analysis</a>
                </li><!--
-->                <li>
                    <a class="page-scroll" href="/Delay.html">Delay Analysis</a>
                </li>
            </ul>
        </div>
    </div>
</nav>