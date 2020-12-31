var express = require('express');
var app = express();
var URL = require('url')
const sql = require('mssql')
var bodyParser = require('body-parser');/*post方法*/
app.use(bodyParser.json({ limit: '3000mb' }));// 添加json解析   设置上传图片大小
app.use(bodyParser.urlencoded({ limit: '3000mb', extended: false })); //设置上传图片大小
//standard tedious config object : http://tediousjs.github.io/tedious/api-connection.html#function_newConnection
var config = {
    user: 'sa',
    password: 'Luciano',
    server: 'localhost',
    port: 1433,
    database: 'Luciano_DB',
    options: {
        encrypt: false, // 是否加密，本地为false, 部署后为true 
    },
    pool: {
        min: 0,
        max: 10,
        idleTimeoutMillis: 3000
    }
}

// app.post('/upload', function (req, res) {
//   let sampleFile;
//   let uploadPath;
//   if (!req.files || Object.keys(req.files).length === 0) {
//     res.status(400).send('No files were uploaded.');
//     return;
//   }

//   // console.log('req.files >>>', req.files); // eslint-disable-line

//   sampleFile = req.files.sampleFile;

//   uploadPath = __dirname + '/uploads/' + sampleFile.name;

//   sampleFile.mv(uploadPath, function (err) {
//     if (err) {
//       return res.status(500).send(err);
//     }

//     // res.send('File uploaded to ' + uploadPath);
//     //  res.send('上传成功');
//     //插入数据到数据库表中
//     //写一个存储过程
//     // @photoname nvarchar(50),
//     // @author nvarchar(50),
//     // @photourl nvarchar(max)
//     sql.connect(config, function (err) {
//       if (err) {
//         console.log(err);
//       }
//       var request = new sql.Request();

//       request.input('photoname', sql.NVarChar, '开心');
//       request.input('author',sql.NVarChar,'Luciano');
//       request.input('photourl',sql.NVarChar,sampleFile.name)
//       request.execute('myphoto', function (err, recordsets) {
//         if (err) {
//           console.log(err);
//         }
//         var str = JSON.stringify(recordsets);
//         res.send(recordsets);
//         console.log(recordsets);
//       })
//     })
//   })
// });
app.get('/note/', function (req, res) {
    sql.connect(config).then(() => {
        return sql.query`select * from Luciano_Note order by insertTime desc`
    }).then(result => {
        var data = result.recordset;
        // res.send(data);
        // res.render('albums', {
        //   title: '我的相册',
        //   id: '2',
        //   data: data
        // })
        // conn.close();
        res.send(data);
    }).catch(err => {
        // ... error checks
    })
    sql.on('error', err => {
        // ... error handler
    })
});

app.get('/albums', function (req, res) {
    sql.connect(config).then(() => {
        return sql.query`select * from albums`
    }).then(result => {
        var data = result.recordset;
        res.send(data);
    }).catch(err => {
        console.log(err);
    });
    sql.on('error', err => {
        console.log(err);
    })
});

app.get('/photo', function (req, res) {
    var params = URL.parse(req.url, true).query

    var id = params.ph
    sql.connect(config).then(() => {
        return sql.query`select * from Luciano_Photo where albumsid=${id}`

    }).then(result => {
        var data = result.recordset;
        res.send(data);
    }).catch(err => {
        console.log(err);
    });
    sql.on('error', err => {
        console.log(err);
    })

});

app.get('/search:userid', function (req, res) {
    var par = req.params.userid.replace(':', '');
    sql.connect(config, function (err) {
        if (err) {
            console.log(err);
        }
        var request = new sql.Request();
        var test = par;
        request.input('content', sql.NVarChar, test);
        console.log(test)
        request.execute('Luciano_TS', function (err, recordsets) {
            if (err) {
                console.log(err);
            }
            var str = JSON.stringify(recordsets);
            res.send(recordsets);
            console.log(recordsets);
        })
    })
});

app.post('/login', function (req, res) {
    var username = req.body.username;
    var password = req.body.password;
    sql.connect(config).then(() => {
        return sql.query`select * from Luciano_Login where username=${username} and password=${password}`

    }).then(result => {
        var data = result.recordset;
        res.send(data);
    }).catch(err => {
        console.log(err);
    });
    sql.on('error', err => {
        console.log(err);
    })
});
app.post('/publish', function (req, res) {
    // var params=req.body
    var content = req.body.content
    var title = req.body.title
    sql.connect(config, function (err) {
        if (err) {
            console.log(err);
        }
        var request = new sql.Request();
        request.input('content', sql.NVarChar, content);
        request.input('title', sql.NVarChar, title)
        request.execute('Luciano_insert_Note', function (err, recordsets) {
            if (err) {
                console.log(err);
            }
            var str = JSON.stringify(recordsets);
            res.send(recordsets);
            console.log(recordsets);
        })
    })
})


app.post('/login', function (req, res) {
    var username = req.body.username;
    var password = req.body.password;
    sql.connect(config).then(() => {
        return sql.query`select * from Luciano_Login where username=${username} and password=${password}`

    }).then(result => {
        var data = result.recordset;
        res.send(data);
    }).catch(err => {
        console.log(err);
    });
    sql.on('error', err => {
        console.log(err);
    })
});

/**
 * 增加计划
 */
app.post('/addPlan', function (req, res) {
    var mydate = req.body.mydate;
    var content = req.body.content;
    sql.connect(config, function (err) {
        if (err) {
            console.log(err);
        }
        var request = new sql.Request();
        request.input('mydate', sql.Date, mydate);
        request.input('content', sql.NVarChar, content);
        request.execute('AddPlan', function (err, recordsets) {
            if (err) {
                console.log(err);
            }
            var str = JSON.stringify(recordsets);
            res.send(recordsets);
            console.log(recordsets);
        })
    })
})

/**
 * 查看日历计划
 */
app.post('/seePlan', function (req, res) {
    //添加搜索条件
    var mydate = req.body.mydate; //条件判断
    sql.connect(config, function (err) {
        if (err) {
            console.log(err);
        }
        var request = new sql.Request();
        request.input('mydate', sql.NVarChar(100), mydate);
        request.execute('seePlan', function (err, recordsets) {
            if (err) {
                console.log(err);
            }
            var str = JSON.stringify(recordsets);
            res.send(recordsets);
            console.log(recordsets);
        })
    })

});

//修改日历计划
app.post('/upDateSeePlan', function (req, res) {
    //添加参数
    var mydate = req.body.myDate;
    
    var mycontent=req.body.myConten;
    console.log(mycontent,mydate);
    sql.connect(config, function (err) {
        if (err) {
            console.log(err);
        }
        var request = new sql.Request();
        request.input('myConten',sql.NVarChar(100),mycontent);
        request.input('myDate',sql.NVarChar(100),mydate);
        request.execute('LucianoPlan_Update',function(err,recordsets){
            if(err){
                console.log(err);
            }
            var str=JSON.stringify(recordsets);
            res.send(recordsets);
            console.log(str);
        })
    })
});

app.listen(8000, () => {
    console.log('app listening on 8000');
    // console.log(path.join(__dirname, "public", "file.html"));
})