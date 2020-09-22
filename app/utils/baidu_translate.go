package utils

import (
	"fmt"
	"github.com/tidwall/gjson"
	"io/ioutil"
	"net/http"
	"net/url"
	"strconv"
	"strings"
	"time"
)

func Translate(content string) string {
	appid := "20200922000570876";
	key := "Thd4gG_Nz5pFfWuo_qcf";
	salt := strconv.FormatInt(time.Now().Unix(),10);
	query := content;
	from := "zh";
	to := "en";
	str := appid + query + salt + key;
	sign := GetMD5Hash(str)
	resp, err := http.PostForm("https://fanyi-api.baidu.com/api/trans/vip/translate", url.Values{
		"q": { query },
		"appid": { appid },
		"salt": { salt },
		"from": { from },
		"to": { to },
		"sign": { sign },
	})
	if err != nil {
		fmt.Println(err.Error())
		return ""
	}
	fmt.Println("post send success")
	body, err := ioutil.ReadAll(resp.Body)

	res2 := gjson.Get(string(body), "trans_result.0.dst").String()
	res2 = strings.Replace(res2, "< br / >", "<br/>", -1)
	return res2
}