// OpenDB
var myDB = openDatabase("QRCodeDB","0.1","QRCodeDB");

// ページが構築されたら処理を行う
window.onload = function(){

    var ele = document.getElementById("msg");
    myDB.transaction(
        function(tx){
            tx.executeSql('CREATE TABLE qrcodetable(qrname_sei TEXT,qrname_mei TEXT, qrtel TEXT, qrmms TXT,qrsms TEXT );');
        },
        function (err){
            if (err.code == 1) {
                //ele.innerHTML = "Message : データベースQRCodeDBはすでにあります";
            }else{
                ele.innerHTML = "Message : データベースエラーです : "+err.code;
            }
        },
        function (){ ele.innerHTML = "Message : QRCodeDBを作成しました"; }
    );
    readDB();
}
// データベースへの保存
function saveDB(){
alert("aa")
    myDB.transaction(
        function(tx){
            // 既存データを削除
            tx.executeSql('DELETE FROM qrcodetable');

            // データを書き込む
            var qrname_sei  = document.getElementById("qrname_sei").value;
            var qrname_mei  = document.getElementById("qrname_mei").value;
            var qrtel       = document.getElementById("qrtel").value;
            var qrmms       = document.getElementById("qrmms").value;
            var qrsms       = document.getElementById("qrsms").value;
            tx.executeSql('INSERT INTO qrcodetable values (' 
                                                             + '"' + qrname_sei + '", '
                                                             + '"' + qrname_mei + '", '
                                                             + '"' + qrtel      + '", '
                                                             + '"' + qrmms      + '", '
                                                             + '"' + qrsms      + '"  '
                                                             + ')');
        },
        function(err){ alert("データベースエラー : "+err.code); },
        function (){ document.getElementById("msg").innerHTML = "Message : データを保存しました" }
    );
}

// 保存データ読み出し
function readDB(){
    myDB.transaction(
        function(tx){
            // 全てのデータを読み出す
            tx.executeSql('SELECT * from qrcodetable;',
            [ ],
            function (tx, rs){
                var txt = "";
                // データの数(rs.rows.length)だけ繰り返し読み出す
                for (var i=0; i<rs.rows.length; i++){
                    var row = rs.rows.item(i);
                    txt = txt + row.qrname_sei+","+row.qrname_mei+","+row.qrtel+" : "+row.qrmms+":"+row.qrsms+"<br>";
                    qrname_sei  = row.qrname_sei;
                    qrname_mei  = row.qrname_mei;
                    qrtel       = row.qrtel;
                    qrmms       = row.qrmms;
                    qrsms       = row.qrsms;
                }
                if(rs.rows.length > 0)
                {
                    // 画面に表示する
                    //document.getElementById("msg").innerHTML = txt;
                    document.getElementById("msg").innerHTML = "LocalDBからデータを取得しました";
                    document.getElementById("qrname_sei").value = qrname_sei;
                    document.getElementById("qrname_mei").value = qrname_mei;
                    document.getElementById("qrtel").value      = qrtel;
                    document.getElementById("qrmms").value      = qrmms;
                    document.getElementById("qrsms").value      = qrsms;
                }else{
                    document.getElementById("msg").innerHTML = "LocalDBにデータがありません";
                }
            });
        }
    );
}

// データ削除
function deleteDB(){
    ret = confirm("削除してよいですか");
    if(ret == true)
    {
        myDB.transaction(
            function(tx){
                // 既存データを削除
                tx.executeSql('DELETE FROM qrcodeable');
                document.getElementById("qrname_sei").value = "";
                document.getElementById("qrname_mei").value = "";
                document.getElementById("qrtel").value      = "";
                document.getElementById("qrmms").value      = "";
                document.getElementById("qrsms").value      = "";
            },
            function(err){ alert("データベースエラー : "+err.code); },
            function (){ document.getElementById("msg").innerHTML = "Message : データを削除しました" }
        );
    }
}

// Draw QR Code
var getid = function(id) {
    return document.getElementById(id)
};

draw_qrcode = function() {
    var qrname_sei  = getid('qrname_sei').value;
    var qrname_mei  = getid('qrname_mei').value;
    var qrtel       = getid('qrtel').value;
    var qrmms       = getid('qrmms').value;
    var qrsms       = getid('qrsms').value;
    var cari        = getid('cari').value;
    //alert(cari);

    if(cari == "docomo") {
        var qrtext  = "MECARD:"
                    + "N:"      + qrname_sei + "," + qrname_mei + ";"
                    + "TEL:"    + qrtel                         + ";"
                    + "EMAIL:"  + qrmms + "@softbank.ne.jp"     + ";"
                    + "EMAIL:"  + qrsms + "@i.softbank.jp"      + ";"
                    + ";";
    }else if(cari == "softbank") {
        var qrtext  = "MEMORY:"                             + "\r\n"
                    + "NAME1:"  + qrname_sei + qrname_mei   + "\r\n"
                    + "MAIL1:"  + qrmms                     + "\n\n"
                    + "MAIL2:"  + qrsms                     + "\n\n"
                    + "MAIL1:"  + qrtel                     + "\n\n"
                    + "";
    }else if(cari == "au") {
        var qrtext  = "MEMORY:"                             + "\r\n"
                    + "NAME1:"  + qrname_sei + qrname_mei   + "\r\n"
                    + "MAIL1:"  + qrmms                     + "\n\n"
                    + "MAIL2:"  + qrsms                     + "\n\n"
                    + "MAIL1:"  + qrtel                     + "\n\n"
                    + "";

    }

    var etext = encodeURIComponent(qrtext);
    var size  = "250";
    //var size  = getid('qrsize').value;
    getid('qrimg').alt = etext;
    getid('qrimg').src = getid('qrurl').value = [
        'http://chart.apis.google.com/chart?cht=qr',
        'chs=' + size + 'x' + size,
        //'choe=' + oe,
        'choe=Shift_JIS',
        'chl=' + etext
            ].join('&');
    getid('msg').innerHTML = "Message : QRCodeを作成しました" + "<br />\r\n" + "( for "+ cari + ")";
}



