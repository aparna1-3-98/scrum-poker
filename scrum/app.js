var mysql = require('mysql');
var express = require('express');
var session = require('express-session');
var bodyParser = require('body-parser');
var path = require('path');
var alert = require('alert-node');


var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'scrumpoker'
});


var ID;
var app = express();
app.use(session({
    secret: 'secret',
    resave: true,
    saveUninitialized: true
}));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.get('/', function (request, response) {
    response.sendFile(path.join(__dirname + '/login.html'));
});

app.set('views', path.join('views'));
app.set('view engine', 'ejs');

app.post('/auth', function (request, response) {
    var username = request.body.username;
    var password = request.body.password;
    var role = request.body.role;
    if (username && password && role) {
        connection.query('SELECT * FROM registration WHERE username = ? AND password = ? AND role= ?', [username, password,role], function (error, results, fields) {
            if (results.length > 0) {
                request.session.loggedin = true;
                request.session.username = username;
                ID=results[0].id;
                if (role == 'owner') {
                    response.render('owner', {
                        result: results
                    });
                }
                else {
                    response.render('developer', {
                        result: results
                    });
                }
            } else {
                response.send('Incorrect Username and/or Password!');
            }
            response.end();
        });
    } else {
        response.send('Please enter Username and Password!');
        response.end();
    }
});

app.get('/story.ejs', function (request, response) {
    response.render('story');
});

app.post('/stadd', function (request, response) {
    var title = request.body.title;
    var discription = request.body.discription;
    var d = '-';
    if (title && discription) {
        connection.query('INSERT INTO story (title,discription,uid,value,did,point) VALUES(?,?,?,?,?,?) ', [title, discription, ID, d, d, d], function (error, results, field) {
            response.render('owner');
           
        })
    }

});

app.get('/pview.ejs', function (request, response) {
    console.log(ID);
    connection.query("SELECT * FROM `story` WHERE id NOT IN (SELECT sid FROM point WHERE did=?)",[ID],function (error, result, field) {
        response.render('pview', {
            resul:result
         })
    });
});
app.get('/pending.ejs/:id', function (request, response) {

    //console.log(request.params.id);
    connection.query("SELECT * FROM story WHERE id=?", [request.params.id], function (error, result, field) {
        response.render('pending', {
            resul: result
        })
    });
  
});
app.post('/pending.ejs/point', function (request, response) {
    var i = request.body.id;
    var title = request.body.title;
    var discription = request.body.discription;
    var point = request.body.point;
    var comment = request.body.comment;
    connection.query('INSERT INTO point (sid,title,discription,point,did,comments) VALUES(?,?,?,?,?,?) ', [i, title, discription, point, ID,comment], function (error, result, field) {
        response.redirect('/developer.ejs');
    });
});
app.get('/developer.ejs', function (request, response) {
    response.render('developer');
});

app.get('/dview.ejs', function (request, response) {
    connection.query("SELECT * FROM story WHERE value!='-'", function (error, result, field) {
        response.render('dview', {
            resul: result
        });
    });

});
app.post('/vie.ejs', function (request,response) {
    response.render('developer');
});

app.post('/vi', function (request, response) {
    response.render('owner');
});

app.get('/conclude.ejs', function (request, response) {
    connection.query("SELECT * FROM story WHERE value ='-'", function (error, result, field) {
        response.render('conclude', {
            resul: result
        });
    });
});
app.get('/concl.ejs/:id', function (request, response) {
    var id = request.params.id;
    
    try {
        connection.query('SELECT COUNT(sid) FROM point WHERE sid=? ', [id], function (error, result, field) {
            var count=result[0]['COUNT(sid)'];

            if (count == 4) {
                connection.query("SELECT * FROM point WHERE sid=?", [id], function (error, result, field) {
                    response.render('concl', {
                        resul: result
                    });
                });
            }else {
                alert("Some developers are not add their choice!");
                }

             
        });
    }
    
    catch (e) {
        console.log(e);
    }
        
    });
app.post('/concl.ejs/cpoint',function (request,response) {
    var id = request.body.id;
    var point = request.body.cpoint;
    //console.log(id);
    //console.log(point);
    connection.query("UPDATE story SET value=? WHERE id=?", [point, id], function (error, result, field) {
        response.redirect('/owner.ejs');
    });
});

app.get('/owner.ejs', function (request, response) {
    response.render('owner');
});


app.get('/view.ejs', function (request, response) {
    connection.query("SELECT * FROM story WHERE value!='-'", function (error, result, field) {
        response.render('view', {
            resul: result
        });
    });
});
app.get('/logout', function (request, response) {
    response.sendFile(path.join(__dirname + '/login.html'));
});
    app.listen(4000);