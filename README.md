爬課小幫手(大概)
============

[學生資訊系統](https://github.com/Yukaii/ntust-stu-agent) 的延伸，套上 Rails 皮。

寫到這邊才覺得用 javascript 比較好，全部負載給客端就好啦，丟給 server 爬只是不用輸入驗證碼而已啊......算當成實驗看看了。

啊不過做算學分小工具或修課地圖之類的比較方便。那還是給 server 爬好了 XD

-----------------

聲明一下程式不會偷偷存密碼哦哦哦 XD 可以看 `lib/agent/ntust_agent.rb` 這裡。

之後做成可以抽換、多間學校的架構，再把 [Colorgy Api](https://colorgy.io/api/docs/explorer.html) 串一串就可以無縫同步啦 =w=


耶

## TODOs
* 結果頁的課程資料用前端拿就好了，Timeout 等這麼久要死
