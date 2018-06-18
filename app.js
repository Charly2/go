var express = require('express');
var path = require('path');
var session = require('express-session')
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var routes = require('./routes/index');



var producto = require('./routes/api/producto');




var app = express();
app.use(express.static(path.join(__dirname, 'public')));
app.use(cookieParser());
var sess = {
    secret: 'keyboard cat',
    saveUninitialized: true,
    resave: false,
    cookie: {}
};
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');
app.use(session(sess));

app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});

app.use(function(req, res, next){
    res.io = io;
    next();
});

var productoModel = require("./models/producto");


app.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});


app.get('/nuevo', function(req, res, next) {
  res.render('save', { title: 'Express' });
});


app.get('/cars', function(req, res, next) {

  res.render('cars', { title: 'Express' });
});

app.get('/carsData', function(req, res, next) {
  
  productoModel.gellAllCar(function (error,data) {
            res.io.emit("getAlls", );
            console.log(data[0]);
            res.status(202).json(data);
        });
});


app.post('/nuevo', function(req, res, next) {
console.log(req.body);

  productoModel.save([req.body.n,req.body.p,req.body.s,req.body.f],function (error,data) {
            if (error){
                res.redirect('/nuevo');
            }else{
                res.io.emit("save", req.body);
                res.redirect('/nuevo');
                
            }
  });
});

app.post('/carrito', function(req, res, next) {
  console.log(req.body);
    productoModel.saveCar([req.body.n,req.body.c],function(error,data){
      if (error) {

      }else{
        res.io.emit("carrito", req.body);
        res.send("ok");
      }
    });
     
});



app.use('/producto',producto);








// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

if (app.get('env') === 'development') {
  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error: err
    });
  });
}

if (app.get('env') === 'production') {
    app.set('trust proxy', 1) // trust first proxy
    sess.cookie.secure = true // serve secure cookies
}


app.use(function(err, req, res, next) {
  res.status(err.status || 500);
  res.render('error', {
    message: err.message,
    error: {}
  });
});


var server = require('http').Server(app);
var io = require('socket.io')(server);

module.exports = {app: app, server: server};
