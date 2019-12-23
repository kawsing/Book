var http = require("http");
var server = http.createServer(function(req,res){
    if(req.url == "/"){
        res.end("首頁");
    }else if(req.url == "/news"){
        res.end("最新消息");
    }else if(req.url == "/music"){
        res.end("音樂頻道");
    }else if(req.url == "/sport"){
        res.end("運動專欄");
    }else if(/\/userid\/[\d]{6}/.test(req.url)){
        var reg = /\/userid\/([\d]{6})/;
        var id = reg.exec(req.url)[1];
        res.end("user -> "+id);
    }else{
        res.end("沒有此頁面");
    }
});

server.listen(3000);
console.log("server start at port 3000");