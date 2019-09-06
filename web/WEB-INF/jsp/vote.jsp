<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/24/024
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>投票显示</title>
    <%--<link rel="stylesheet" href="../css/all.css">--%>
    <style type="text/css">
        .ax{ margin:10px auto}
        .ax img{
            margin-top: auto;
            margin-left: 50px;
            border-radius:50%;
        }
        .f1{
            float: left;
            margin-top: 20px;
            margin-left: 100px;
            width: 300px;
            height: 600px;
            background-color: aqua;
        }
        .f2{
            float: left;
            margin-top: 20px;
            margin-left: 400px;
            width: 300px;
            height: 600px;
            background-color: aqua;
        }
        .zt{
            margin-top: 330px;
            margin-left: 130px;
            font-family: "微软雅黑", "宋体";
        }
        .b{
            float: left;
            margin-top: auto;
            padding-left: 550px;
        }
        .d{
            float: left;
            margin-top:-550px;
            padding-left: 0px;
            font-family: "微软雅黑", "宋体";
            color: red;
            font-size: 30px;

        }
        .zt1{
            font-family: "微软雅黑", "宋体";
            color: red;
            font-size: 100px;
            float: left;
            margin-top:-350px;
            padding-left: 20px;
        }
    </style>
    <script type="text/javascript" src="/easyui/jquery-3.4.0.js"></script>
    <script type="text/javascript">
        var p1;
        var p2;
        function getVote(matchid,battlid){
            $.ajax({
                url: "/vote/getOneVote?matchId="+matchid+"&battleId="+battlid,
                type:"post",
                dataType:"json",
                success: function (res) {
                    console.log(res.list[0].vote1)
                    console.log(res.list[0].vote2)
                    $("#vote1").text(res.list[0].vote1+"票")
                    p1 = res.list[0].vote1
                    $("#vote2").text(res.list[0].vote2+"票")
                    p2 = res.list[0].vote2

                }

            })

        }
        function addVote(matchId,battleId,who){
            $.ajax({
                url: "/vote/AddOneVote?matchId="+matchId+"&battleId="+battleId+"&who="+who+"&userId=${userId}",
                type:"get",
                dataType:"json",
                success: function (res) {

                if (res.limit=="error") {
                   alert("本场投票已经达5票限制")
                }
                }

            })

        }
        $(function () {
            addVote(${matchId},${battleId},3)
            setInterval(function () {
                getVote(${matchId},${battleId})
            },1000)
            $("#p1").click(function () {
                console.log("xxx")
                addVote(${matchId},${battleId},1)
            })
            $("#p2").click(function () {
                addVote(${matchId},${battleId},2)
            })
        })

    </script>

</head>
<body>
<div class="f1">
    <div class="ax">
        <img src="/image/选手1.png" width="200" id="p1"/><p class="zt">选手名：${playerOne}</p>
        <div id="vote1"></div>
        <div</div>
    </div>
</div>
<div class="f2">
    <div class="ax">
        <img src="/image/选手2.jpg" width="200" id="p2"/><p class="zt">选手名：${playerTwo}</p>
        <div id="vote2"></div>
    </div>
</div>

</body>
</html>
