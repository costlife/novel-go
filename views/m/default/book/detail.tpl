
<link href="{{.mOut.ViewUrl}}css/detail.css?v=aa6bf34e" rel="stylesheet" type="text/css">

<header class="hd-bar">
	<a href="javascript:history.go(-1);" class="search-back" id="historyBack"></a>
	<h1>{{.Nov.Name}}</h1>
	<a href="{{urlfor "m.HomeController.Index"}}" class="search-home"></a>
</header>
<div class="nov_detail">
	<div class="am-btn-group am-btn-group-justify am-margin-vertical">
		<a class="am-btn am-btn-default" role="button" href="javascript:void(0)" onclick="light('off')">Dark</a>
		<a class="am-btn am-btn-default" role="button" href="javascript:void(0)" onclick="light('on')">Light</a>
		<a class="am-btn am-btn-default" role="button" href="javascript:void(0)" onclick="font('big')">Large</a>
		<a class="am-btn am-btn-default" role="button" href="javascript:void(0)" onclick="font('middle')">Medium</a>
		<a class="am-btn am-btn-default" role="button" href="javascript:void(0)" onclick="font('small')">Small</a>
	</div>
	<hr /> 
  
	<article class="am-article" style="font-size: 22px">
	  <div class="am-article-hd">
		<h3>{{.Chap.Title}}</h3>
	  </div>

	  <div class="am-btn-group am-btn-group-justify am-margin-vertical">
	  {{if not_nil .Pre}}
		<a class="am-btn am-btn-default" role="button" href="{{urlfor "m.BookController.Detail" "id" .Pre.Id "novid" .Nov.Id}}">Prev</a>
	  {{else}}
		<span class="am-btn am-btn-default" role="button"></span>
	  {{end}}
		<a class="am-btn am-btn-default" role="button" href="{{urlfor "m.BookController.Index" "id" .Chap.NovId}}">Catalog</a>
	  {{if not_nil .Next}}
		<a class="am-btn am-btn-default" role="button" href="{{urlfor "m.BookController.Detail" "id" .Next.Id "novid" .Nov.Id}}">Next</a>
	  {{else}}
		<span class="am-btn am-btn-default" role="button"></span>
	  {{end}}
	  </div>

	  <div class="am-article-bd">
		{{str2html .Chap.Desc}}
	  </div>

	  <div class="am-btn-group am-btn-group-justify am-margin-vertical">
	  {{if not_nil .Pre}}
		<a class="am-btn am-btn-default" role="button" href="{{urlfor "m.BookController.Detail" "id" .Pre.Id "novid" .Nov.Id}}">Prev</a>
	  {{else}}
		<span class="am-btn am-btn-default" role="button">No More</span>
	  {{end}}
		<a class="am-btn am-btn-default" role="button" href="{{urlfor "m.BookController.Index" "id" .Chap.NovId}}">Catalog</a>
	  {{if not_nil .Next}}
		<a class="am-btn am-btn-default" role="button" href="{{urlfor "m.BookController.Detail" "id" .Next.Id "novid" .Nov.Id}}">Next</a>
	  {{else}}
		<span class="am-btn am-btn-default" role="button">No More</span>
	  {{end}}
	  </div>
	</article>
</div>

<script type="text/javascript">
    $(function () {
        var d = localStorage.getItem("d"); //获取灯
        if (d != null) {
            if (d != 'off') { //开启
                light("on")
            } else { //关
                light("off")
            }
        }

        var book_font_sizi = localStorage.getItem("book_font_sizi"); //获取书本字体大小
        if (book_font_sizi != null) {
            font(book_font_sizi)
        }
    })


    function light(off) {


        if (off != 'off') {
            localStorage.setItem("d", "on"); //开灯
            $("body").css("background-color", "rgb(241, 241, 241)").css("color", "rgb(0, 0, 0)")
			$("span[role='button']").css("background-color", "#e6e6e6").css("color", "rgb(0, 0, 0)") //按钮
			$("a[role='button']").css("background-color", "#e6e6e6").css("color", "rgb(0, 0, 0)") //按钮
			$("#footer_submit_btn").css("background-color", "#e6e6e6").css("color", "rgb(0, 0, 0)") //底部搜索按钮
			$("footer").css("background-color", "rgb(249, 249, 249)").css("color", "rgb(0, 0, 0)") //底部
        } else {
            localStorage.setItem("d", "off"); //关灯
            $("body").css("background-color", "rgb(34, 34, 34)").css("color", "rgb(153, 153, 153)")
			$("span[role='button']").css("background-color", "rgb(34, 34, 34)").css("color", "rgb(153, 153, 153)")//按钮
			$("a[role='button']").css("background-color", "rgb(34, 34, 34)").css("color", "rgb(153, 153, 153)")//按钮
			$("#footer_submit_btn").css("background-color", "rgb(34, 34, 34)").css("color", "rgb(153, 153, 153)") //底部搜索按钮
			$("footer").css("background-color", "rgb(34, 34, 34)").css("color", "rgb(153, 153, 153)")//底部
        }

    }

    function font(size) {
        var big = '26px';
        var middle = '22px';
        var small = '16px';

        switch (size) {
        case 'big':
            document.getElementsByTagName('article')[0].style.fontSize = big;
            localStorage.setItem("book_font_sizi", "big");
            break;
        case 'middle':
            document.getElementsByTagName('article')[0].style.fontSize = middle;
            localStorage.setItem("book_font_sizi", "middle");
            break;
        case 'small':
            document.getElementsByTagName('article')[0].style.fontSize = small;
            localStorage.setItem("book_font_sizi", "small");
            break;
        }
    }
</script>
