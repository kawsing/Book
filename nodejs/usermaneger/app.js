var express = require("express");
var mainctrl = require("./controllers/mainctrl.js");
var app = express();
app.set("view engine", "ejs");
//路由設計
app.get("/", mainctrl.showIndex); 
app.get("/adduser", mainctrl.addUser);
//靜態頁面
app.use(express.static("public"));

app.listen(3000);
console.log("server start at port 3000");
