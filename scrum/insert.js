var mysql = require('mysql');

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "scrumpoker"
});

con.connect(function (err) {
    if (err) throw err;
    console.log("Connected!");
    var sql = "INSERT INTO registration (id,name, role,username,password) VALUES ?";
    var values = [
        ['1','John','owner','jj','jj'],
        ['2','Peter','developer','pp','pp'],
        ['3', 'Mery', 'developer', 'mm', 'mm'],
        ['4', 'Krish', 'developer', 'kk', 'kk'],
        ['5', 'Sony', 'developer', 'ss', 'ss'],
    ];
    con.query(sql, [values], function (err, result) {
        if (err) throw err;
        console.log("Number of records inserted: " + result.affectedRows);
    });
});