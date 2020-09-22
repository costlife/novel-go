<div class="header-box">
	<div class="header" style="height:78px">
	  <div class="searchbox">
	      <a href="/" class="logo">
	          <img src="{{.aOut.Logo}}" alt="{{.aOut.Title}}" style="max-width: 150px;">
	      </a>
	      <form action="{{urlfor "home.HomeController.Search"}}" method="get" class="searchform" id="searchForm" onsubmit="return checkSearch()">
	          <div class="querybox">
	              <div class="qborder">
	              	<input type="text" value="{{.Search.q}}" name="kw" id="query" class="query" autocomplete="off">
	             </div>
	          </div>
	          <div class="sbtn1"><input type="submit" value="Search" onmouseout="this.className='btn1'" onmouseup="this.className='sbtn1'" onmousedown="this.className='btnactive'" id="searchBtn"></div>
	          <div class="hotwords">Trending novel：
                {{range .RecKw}}
	          		<a href="{{urlfor "home.HomeController.Search" "kw" .Kw}}" target="_blank">{{.Kw}}</a>
                {{end}}
	          </div>
	      </form>
	  </div>
		<script type="text/javascript">
		var checkSearch = function() {
			if ($.trim($("#query").val()).length < 1)
				return false;
			else
				return true;
		};
		</script>

		<div class="login">
			<a href="javascript:setHome(this, location.href)">Make It Your Homepage</a>
			<span class="divider divider1"></span>
			<a href="javascript:addFavorite('{{.aOut.Title}}', location.href)">Add to Favorites</a>
		</div>
	</div>

	<div class="mnavbox">
	  <ul class="mnav" style="width:1200px">
	      <li {{if eq .aOut.MethodName "HomeController.Index"}}class="cur"{{end}}><a href="{{urlfor "home.HomeController.Index"}}">Home</a></li>
	      <li {{if eq .aOut.MethodName "HomeController.Cate"}}class="cur"{{end}}><a href="{{urlfor "home.HomeController.Cate"}}" class="r-tab">All</a></li>
	      <!--<li><a href="#" class="r-tab">排行</a></li>-->
	      <li class="all-sort">
	          <a href="{{urlfor "home.HomeController.Cate"}}" class="sort-tab">All Categories</a>
	          <div class="t-box">
	            <span class="triangle"></span>
	          </div>
	          <div class="sort-box" id="allsortbox" style="display: none;">
	              <ul>
					{{range .Cates}}
	          			<li><a href="{{urlfor "home.HomeController.Cate" "id" .Id}}" class="top-a">{{.Name}}</a></li>
					{{end}}
	              </ul>
	          </div>

	      </li>
	  </ul>
	</div>
</div>	
