<div id="footer">
	{{.aOut.Title}}'s contents are all uploaded from the Internet and users. Please contact us to delete them if they are infringing
    <p>
        {{.aOut.Copyright}} {{.aOut.Icp}} {{str2html .aOut.StatisticsCode}}
	</p>
</div>

<script type="text/javascript" src="{{.mOut.ViewUrl}}js/echo.js" charset="utf-8"></script>

<script type="text/javascript">
function setHome(obj, vrl) {
	try {
		obj.style.behavior = 'url(#default#homepage)';
		obj.setHomePage(vrl);
	}
	catch(e) {
		if (window.netscape) {
			try {
				netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
			}
			catch (e) {
				alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
			}
			var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
			prefs.setCharPref('browser.startup.homepage',vrl);
		 }
	}
}

//收藏本站
function addFavorite(title, url) {
    try {
        window.external.addFavorite(url, title);
    }
    catch (e) {
        try {
            window.sidebar.addPanel(title, url, "");
        }
        catch (e) {
            alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
        }
    }
}

$(function() {
	Echo.init()

{{if ne .aOut.MethodName "HomeController.Index"}}
	$('.all-sort').hover(function() {
		$("#allsortbox").show();
	}, function() {
		$("#allsortbox").hide();
	});

	$('#allsortbox').hover(function() {
		$("#allsortbox").show();
	}, function() {
		$("#allsortbox").hide();
	}); 
{{end}}
});
</script>
