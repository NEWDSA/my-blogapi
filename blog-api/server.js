var express = require('express');
var app = express();
var URL=require('url')
const sql = require('mssql')
    //standard tedious config object : http://tediousjs.github.io/tedious/api-connection.html#function_newConnection
var config = {
    user: 'sa',
    password: '123',
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
app.get('/note/', function(req, res) {
    sql.connect(config).then(() => {
        return sql.query `select * from Luciano_Note`
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
app.get('/albums', function(req, res) {
    sql.connect(config).then(() => {
        return sql.query `select * from albums`
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

app.get('/photo', function(req, res) {
   var params=URL.parse(req.url,true).query
   console.log(params.id);
    sql.connect(config).then(() => {
        return sql.query `select * from Luciano_Photo where id=${params.id}`
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

app.get('/search:userid', function(req, res) {
    var par = req.params.userid.replace(':', '');
    sql.connect(config, function(err) {
        if (err) {
            console.log(err);
        }
        var request = new sql.Request();
        var test = par;
        request.input('content', sql.NVarChar, test);
        console.log(test)
        request.execute('Luciano_TS', function(err, recordsets) {
            if (err) {
                console.log(err);
            }
            var str = JSON.stringify(recordsets);
            res.send(recordsets);
            console.log(recordsets);
        })
    })
});



app.listen(8000, () => {
    console.log('app listening on 8000');
    // console.log(path.join(__dirname, "public", "file.html"));
})