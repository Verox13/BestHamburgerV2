const { validationResult } = require("express-validator");
const { Sequelize, Usuario, Produto } = require("../models");
const bcrypt = require("bcryptjs");
const Op = Sequelize.Op;


const principalController = {
    index: async function(req, res) {
        let produtos = await Produto.findAll({ where: { tipo: 'Acompanhamento' } })

        res.render("home", { produtos });
    },
    getLogin: function(req, res) {
        req.session.destroy();
        res.render("login");
    },
    postLogin: async function(req, res) {
        const { email, senha } = req.body;
        const user = await Usuario.findOne({ where: { email: email } });
        const checkPassword = await bcrypt.compare(senha, user.senha);
        if (checkPassword && email == user.email) {
            req.session.user = {};
            req.session.user.avatar = user.avatar;
            req.session.user.nome = user.nome;
            req.session.user.sobrenome = user.sobrenome;
            req.session.user.cpf = user.cpf;
            req.session.user.data_de_nascimento = user.data_de_nascimento;
            req.session.user.telefone = user.telefone;
            req.session.user.genero = user.genero;
            req.session.user.cep = user.cep;
            req.session.user.endereco = user.endereco;
            req.session.user.numero = user.numero;
            req.session.user.estado = user.estado;
            req.session.user.cidade = user.cidade;
            req.session.user.email = user.email;
            res.redirect("/");
        } else {
            res.render("login");
        }
    },
    telaCadastro: function(req, res) {
        const novoUsuario = '';
        res.render("cadastro-usuario", { novoUsuario });
    },
    cadastrar: async function(req, res) {
        const errors = validationResult(req);
        console.log(errors)
        if (!errors.isEmpty()) {
            res.render("cadastro-usuario", {
                errors: errors.mapped(),
                old: req.body,
            });
        } else {
            const { nome, sobrenome, cpf, celular, email, genero, data_de_nascimento, senha } = req.body;
            let hash = bcrypt.hashSync(senha, 10);
            let usuarioCadastrado = await Usuario.create({
                nome: nome,
                sobrenome: sobrenome,
                cpf: cpf,
                telefone: celular,
                email: email,
                genero: genero,
                data_de_nascimento: data_de_nascimento,
                senha: hash
            });
            return res.render("login");
        }
    },
    telaContato: function(req, res) {
        res.render("contato");
    },
    recuperarSenha: function(req, res) {
        res.render("solicitacaosenha");
    },
    telaRecuperar: function(req, res) {
        res.render("solicitacaosenha");
    },
    logout: function(req, res) {
        req.session.destroy();
        res.redirect("/");
    },
};

module.exports = principalController;