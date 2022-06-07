var express = require('express');
const mysql = require('mysql')
const bodyParser = require('body-parser');

var app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

//CORS
app.use(function(req,res,next){
    //Access-Control-Allow-Origin
    res.header("Access-Control-Allow-Origin","*")
    res.header("Access-Control-Allow-Methods","GET,POST,PUT,DELETE,OPTIONS")
    res.header("Access-Control-Allow-Headers","Origin, X-Requested-With, Content-Type,Accep,x-client-key,x-client-token,x-client-secret,Authorization")
    next()
})

const mc = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'sistemadeformularios'
});

mc.connect();

//Agregar Formulario
app.post('/formulario',function(req,res){
    let datosFormulario = {
        descripcion: req.body.descripcion,
        url: req.body.url,
        tipo: req.body.tipo,
        titulo: req.body.titulo,
        fechavencimiento: req.body.fechavencimiento,
        estado:req.body.estado
    };
    if(mc){
        mc.query('INSERT INTO formulario SET ?', datosFormulario, function(error, result){
            if(error){
                res.status(500).json({"Mensaje":"ERROR"});
            }else{
                res.status(201).json({"Mensaje":"INSERTADO"})
            }
        });
    }
});





//Obtener publicos
app.get('/publicos', function (req, res){
    mc.query('select* from dirigido', function (err, results, fields) {
        if (err) throw error;
        return res.send({
            error:false,
            data: results,
            massage: 'Lista de publicos.'
        });
    });
});

//Obtener formularios
app.get('/formularios', function (req, res){
    mc.query('select* from formulario where estado="DISPONIBLE"', function (err, results, fields) {
        if (err) throw error;
        return res.send({
            error:false,
            data: results,
            massage: 'Lista de formularios.'
        });
    });
});

//Obtener gestiones
app.get('/gestiones', function (req, res){
    mc.query('select* from gestiona', function (err, results, fields) {
        if (err) throw error;
        return res.send({
            error:false,
            data: results,
            massage: 'Lista de gestiones.'
        });
    });
});

//Obtener logins
app.get('/logins', function (req, res){
    mc.query('select* from login', function (err, results, fields) {
        if (err) throw error;
        return res.send({
            error:false,
            data: results,
            massage: 'Lista de login.'
        });
    });
});

//Obtener usuarios
app.get('/usuarios', function (req, res){
    mc.query('select * from usuario', function (err, results, fields) {
        if (err) throw error;
        return res.send({
            error:false,
            data: results,
            massage: 'Lista de usuarios.'
        });
    });
});

//Eliminar Login
app.delete('/login/:id', function(req,res){
    let id=req.params.id;

    if(mc){
        mc.query("DELETE FROM login WHERE id = ?", id, function(error,result){
            if(error){
                return res.status(500).json({"Mensaje":"Error"});
            }else{
                return res.status(200).json({"Mensaje":"Login con id " + id + " borrado" });
            }
        });
    }
});

//Eliminar formulario
app.delete('/formulario/:id', function(req,res){
    let id=req.params.id;

    if(mc){
        mc.query("DELETE FROM formulario WHERE id = ?", id, function(error,result){
            if(error){
                return res.status(500).json({"Mensaje":"Error"});
            }else{
                return res.status(200).json({"Mensaje":"Formulario con id " + id + " borrado" });
            }
        });
    }
});

//Eliminar dirigido
app.delete('/dirigido/:IdFormulario', function(req,res){
    let IdFormulario=req.params.IdFormulario;

    if(mc){
        mc.query("DELETE FROM dirigido WHERE IdFormulario = ?", IdFormulario, function(error,result){
            if(error){
                return res.status(500).json({"Mensaje":"Error a "+error+" "+IdFormulario});
            }else{
                return res.status(200).json({"Mensaje":"Dirigido con id " + IdFormulario + " borrado" });
            }
        });
    }
});



app.listen(3000, ()=>{
    console.log('Express Server - puerto 3000 online')
});

app.get('/', (req, res, next) => {
    res.status(200).json({
        ok: true,
        message: 'Peticion realizada correctamente'
    })
})
