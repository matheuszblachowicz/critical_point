//IMPORTACOES
const express = require('express') //ONLINE
const exphbs = require('express-handlebars') //ONLINE
const session = require('express-session') //ONLINE
const mysql = require ('mysql') //ONLINE
const path = require ('path') //OFFLINE
const multer = require('multer') //ONLINE

//CONEXAO COM O BANCO DE DADOS

const conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'critical_point' //PARTE IMPORTANTE
})

//CONEXAO DE NOVO

conn.connect(function (err){
    if (err){
        console.log(err)
    }
    console.log('Conectou com MYSQL')
})

//ADAPTACOES DOS PACOTES NPM

const app = express()

const hbs = exphbs.create ({
    partialsDir: ["views/partials"]
})

//MOTOR GRAFICO

app.use(express.static('public'))

//MOTOR
app.engine ('handlebars',hbs.engine)
app.set('view engine','handlebars')

//TRATAMENTO DE IMAGENS - código do Ciello

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'public/uploads')
    },
    filename: function (req, file, cb) {
        // Extração da extensão do arquivo original:
        const extensaoArquivo = file.originalname.split('.')[1];

        // Cria um código randômico que será o nome do arquivo
        const novoNomeArquivo = require('crypto')
            .randomBytes(10)
            .toString('hex');

        // Indica o novo nome do arquivo:
        cb(null, `${novoNomeArquivo}.${extensaoArquivo}`)
    }
});

const upload = multer({ storage });

//INICIO DAS ROTAS


//SESSÃO

app.use(session({secret: 'mandioca', resave: true, saveUninitialized: true}));
app.use(express.json())
app.use(express.urlencoded({extended: true}))
app.use(express.static(path.join(__dirname, 'static')))


//LOGIN ACONTECENDO - código do Ciello alterado

app.post('/logar', (req, res) => {
    const user = req.body.username
    const senha = req.body.pass
    const sql = `SELECT * FROM contas_02 WHERE C_USERNAME = '${user}' && C_SENHA = '${senha}'`
    if (user && senha) {
        conn.query(sql, function (erro, results, fields) {
            if (erro) throw erro
            if (results.length > 0) {
                var string = JSON.stringify(results);
                console.log(string)
                var json = JSON.parse(string);
                console.log(json)
                req.session.logado = true
                req.session.ddd = json[0].ID
                req.session.usuario = json[0].C_USERNAME
                req.session.email = json[0].C_EMAIL
                req.session.foto = json[0].C_FOTO
                res.redirect('/')
            } else {
                req.session.logado = false
                res.redirect('/login')
            }
            res.end()
        })
    } else {
        res.send('Entre Novamente com o Email e a Senha')
        res.end()
    }
})

//PAGINA INICIAL

app.get('/',(req,res) =>{
    var perfil_01 = '/login'
    const user = req.session.usuario
    var avatar_02 = "/img/no_image.png"
    const sql = `SELECT * FROM jooj_02`
    var hidden_desaparece_log = ''
    var hidden_aparece_log = 'hidden'
    var estilo = ''
    if(req.session.logado){
        perfil_01 = '/editar'
        avatar_02 = "/uploads/"+req.session.foto
        hidden_desaparece_log = 'hidden'
        hidden_aparece_log = ''
        estilo = 'rounded-full border-2 border-white'
    } else{
    console.log(hidden_desaparece_log)
    }
   
    conn.query(sql,function(err,dados){
        if(err){
            console.log(err)
        } else {
            if (req.session.logado) {
                console.log(dados)
                res.render('kal', {user, avatar_02, perfil_01, dados,hidden_desaparece_log,hidden_aparece_log,estilo})
            } else {
                console.log(dados)
                res.render('kal', {avatar_02, perfil_01, dados,hidden_desaparece_log,hidden_aparece_log,estilo})
            }
        }
    })
    
})

//PAGINA DE JOGOS

app.get('/lista_jogos', (req,res) =>{
  
        //PAGINA DE JOGOS - IMAGENS
        var perfil_01 = '/login'
        var avatar_02 = "/img/no_image.png"
        var hidden_desaparece_log = ''
        var hidden_aparece_log = 'hidden'
        var estilo = ''
        if(req.session.logado){
            var perfil_01 = '/editar'
            avatar_02 = "/uploads/"+req.session.foto
            hidden_desaparece_log = 'hidden'
            hidden_aparece_log = ''
            estilo = 'rounded-full border border-white'
        } else{
        console.log(avatar_02)
        }
        
    const sql = `SELECT * FROM jooj_02`
    conn.query(sql, function(err,dados){
        if (err){
            console.log(err)
        } 
        console.log(dados)
        res.render('home', {dados, avatar_02, perfil_01,hidden_desaparece_log,hidden_aparece_log,estilo})
    })
    
})

    //PAGINA DE JOGOS
app.get('/dois/:ID',(req,res)=> {

    var perfil_01 = '/login'
    var avatar_02 = "/img/no_image.png"
    var hidden_desaparece_log = ''
    var hidden_aparece_log = 'hidden'
    var estilo = ''
    if(req.session.logado){
        perfil_01 = '/editar'
        avatar_02 = "/uploads/"+req.session.foto
        hidden_desaparece_log = 'hidden'
        hidden_aparece_log = ''
        estilo = 'rounded-full border border-white'
    } else{
    console.log(avatar_02)
    }

    //DADOS UNICOS A SEREM MOSTRADOS NA PAGINA
    const ID = req.params.ID
    const sql = `SELECT * FROM jooj_02 WHERE ID = ${ID}`

    const comen = `SELECT * FROM comen_03 WHERE ID_JOOJ = ${ID}`

    const notas = `SELECT * FROM notas_01 WHERE JOOJ_ID = ${ID}`
    

    conn.query(sql, function(err,dados){
        if (err){
            console.log(err)
        }
        
        conn.query(comen,function (err,comens){
            if(err){
                console.log(err)
            }
            conn.query(notas,function(err,notas){
                if(err){
                    console.log(err)
                }
                    console.log(comens)
                    console.log(dados)
                    console.log(notas)
                    res.render('tri',{perfil_01,dados,comens,notas,avatar_02, hidden_desaparece_log,hidden_aparece_log,estilo})
            })
        })

    })
    
    
})

//AVALICOES SENDO CADASTRADAS

app.post('/notas/:ID', (req, res)=>{
    const nota = req.body.da
    const his = req.body.hist
    const div = req.body.dive
    const jog = req.body.joga
    const atm = req.body.atmo
    const id_jooj = req.params.ID

    const sql = `INSERT INTO notas_01 (N_JOGO, N_HISTORIA, N_DIVERSAO, N_JOGABILIDADE, N_ATMOSFERA, JOOJ_ID) VALUES ('${nota}','${his}','${div}','${jog}','${atm}','${id_jooj}')`
    
    console.log(nota)
    console.log(id_jooj)

    conn.query(sql,function(err,dados){
        if(err){
            console.log(err)
        }
        res.end
    })
    res.redirect('/dois/'+ id_jooj)
})

//COMENTARIO NA PAGINA DE JOOJ ACONTECENDO

app.post ('/comen/:ID', (req,res)=>{

    var usuca = 'Usuário não cadastrado'
    var avatar_02 = "no_image.png"
    if(req.session.logado){
        avatar_02 = req.session.foto
        usuca = req.session.usuario
    } else {
        console.log(avatar_02, usuca)
    }

    const ususu = usuca
    const comen = req.body.comentarios
    const foto = avatar_02
    const id_jooj = req.params.ID

    const sql = `INSERT INTO comen_03 (D_USER, D_COMEN, D_FOTO, ID_JOOJ) VALUES ('${ususu}','${comen}','${foto}','${id_jooj}')`

    conn.query(sql,function (err, dados){
        if (err){
            console.log(err)
        }
        
        res.end
    })
    res.redirect('/dois/'+ id_jooj)
})

    //AJUDA
app.get('/ajuda', (req,res)=>{
    var perfil_01 = '/login'
    var avatar_02 = "/img/no_image.png"
    var hidden_desaparece_log = ''
    var hidden_aparece_log = 'hidden'
    var estilo = ''
    if(req.session.logado){
        perfil_01 = '/editar'
        avatar_02 = "/uploads/"+req.session.foto
        hidden_desaparece_log = 'hidden'
        hidden_aparece_log = ''
        estilo = 'rounded-full border border-white'
    } else{
    console.log(avatar_02)
    }
    res.render('ajuda',{avatar_02,perfil_01, hidden_desaparece_log,hidden_aparece_log,estilo})
})

    //SOBRE NOS

    
app.get('/bene', (req,res)=>{
    var perfil_01 = "/login"
    var avatar_02 = "/img/no_image.png"
    var hidden_desaparece_log = ''
    var hidden_aparece_log = 'hidden'
    var estilo = ''
    if(req.session.logado){
        perfil_01 = "/editar"
        avatar_02 = "/uploads/"+req.session.foto
        hidden_desaparece_log = 'hidden'
        hidden_aparece_log = ''
        estilo = 'rounded-full border border-white'
    } else{
    console.log(avatar_02)
    }
    res.render('bene',{avatar_02,perfil_01, hidden_desaparece_log,hidden_aparece_log,estilo})
  })
    
  //EDITAR PERFIL

app.get('/editar', (req,res)=>{

    var perfil_01 = '/editar'
    var avatar_02 = "/img/no_image.png"
    var hidden_desaparece_log = ''
    var hidden_aparece_log = 'hidden'
    var estilo = ''
    if(req.session.logado){
        avatar_02 = "/uploads/"+req.session.foto
        hidden_desaparece_log = 'hidden'
        hidden_aparece_log = ''
        estilo = 'rounded-full border border-white'
    } else{
    console.log(avatar_02)
    }

    if(req.session.logado){
        console.log(req.session.ddd)
        const sql = `SELECT * FROM contas_02 WHERE ID = ${req.session.ddd}`

        conn.query(sql,function(err,dados){
            if(err){

            }else{
                console.log(dados)
                res.render('perfil',{perfil_01, avatar_02, dados, hidden_desaparece_log,hidden_aparece_log,estilo})
            }
        })
    } else {
        redirect('/404')
    }

})

//EDITANDO

app.get('/uplo', (req,res)=>{

    var perfil_01 = '/editar'
    var avatar_02 = "/img/no_image.png"
    var hidden_desaparece_log = ''
    var hidden_aparece_log = 'hidden'
    var estilo = ''
    if(req.session.logado){
        avatar_02 = "/uploads/"+req.session.foto
        hidden_desaparece_log = 'hidden'
        hidden_aparece_log = ''
        estilo = 'rounded-full border border-white'
    } else{
    console.log(avatar_02)
    }

    if(req.session.logado){
        console.log(req.session.ddd)
        const sql = `SELECT * FROM contas_02 WHERE ID = ${req.session.ddd}`

        conn.query(sql,function(err,dados){
            if(err){

            }else{
                console.log(dados)
                res.render('perfil_editando',{perfil_01, avatar_02, dados, hidden_desaparece_log,hidden_aparece_log,estilo})
            }
        })
    } else {
        redirect('/404')
    }

})

    //LOGIN

app.get('/login',(req,res)=>{
    res.render('login', {layout: false})
})

//CADASTRO

app.get('/cadastrar',(req,res)=>{
    res.render('cadastro', {layout: false})
})

//INSERINDO DADOS NO BD - código do Ciello

app.post('/cadastrando', upload.single('foto'), (req, res) => {
    const usuario = req.body.username
    const email = req.body.email
    const senha = req.body.pass
    //const caminho = req.file.destination
    const arquivo = req.file.filename
    const foto = arquivo
    const sql = `INSERT INTO contas_02 (C_USERNAME,C_EMAIL,C_SENHA,C_FOTO)
    VALUES ('${usuario}','${email}','${senha}','${foto}')`
    conn.query(sql, function (err, dados) {
        if (err) {
            console.log(err)
        }
        res.redirect('/')
    })
})

//LOGOUT

app.get('/logout', (req,res)=>{
    req.session.logado = false
    res.redirect('/')
})

//SERVER

app.listen(1238,()=>{
    console.log('Servidor ONLINE// PORTA: 1238')
})