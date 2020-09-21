
    <footer>
        <form method="GET" action="{{urlfor "m.BookController.Search"}}" id="foot_search_form">
            <div class="foot-search">
                <input style="font-size:17px" type="search" name="keyword" value="" class="foot-search-input" id="novelKeyword_footer" autocapitalize="off" autocorrect="off" maxlength="2048" autocomplete="off">
                <button type="submit" class="foot-search-submit" value="" id="footer_submit_btn"></button>
            </div>
        </form>
        <nav>
            <a href="{{urlfor "m.HomeController.Index"}}">Home</a>-
            <a href="">Relief</a>
            -<a href="{{urlfor "m.HomeController.Feedback"}}">Feedback</a>-
            <a id="footer_login" href="javascript:void(0)">Login</a>
        </nav>
 
        <div class="foot-copyright">{{.aOut.Copyright}} {{.aOut.Icp}}</div>
		<div class="foot-copyright" style="font-size: 12px;">{{.aOut.Title}}All the contents are uploaded from the Internet and users. Please contact us to delete them if they are infringing {{str2html .aOut.StatisticsCode}}</div>
    </footer>

    <script type="text/javascript" src="{{.mOut.ViewUrl}}js/util.js" charset="utf-8"></script>
    <script type="text/javascript" src="{{.mOut.ViewUrl}}js/echo.js" charset="utf-8"></script>

    <script type="text/javascript">
    	$('.search-btn').on('click',function() {
    		$('.search-wrap').show();
    		$('#keyword').focus();
    	});
    	$('.search-cancel').on('click',function() {
    		$('.search-wrap').hide();
    	});
    </script>
