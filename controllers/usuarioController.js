const { Sequelize, Usuario, Endereco } = require("../models");


const usuarioController = {
    cadastroProduto: function(req, res) {
        res.render("cadastro-produto");
    },
    telaEditarPerfil: function(req, res) {
        res.render("perfil-editar");
    },
    pagamento: function(req, res) {
        res.render("pagamento");
    },
    carrinho: function(req, res) {
        res.render("carrinho");
    },
    chat: function(req, res) {
        res.render("chat");
    },
    comprar: function(req, res) {
        res.render("comprar");
    },

    trocarSenha: function(req, res) {
        res.render("trocarsenha");
    },

    endereco: function(req, res) {
        res.render("endereco");
    },

    CadastrarEndereco: async function(req, res) {
        const errors = validationResult(req);
        console.log(errors)
        if (!errors.isEmpty()) {
            res.render("endereco", {
                errors: errors.mapped(),
                old: req.body,
            });
        } else {
            const { local, bairro, numero, rua, referencia, cep } = req.body;
            let enderecoCadastrado = await Endereco.create({
                local: local,
                bairro: bairro,
                numero: numero,
                rua: rua,
                referencia: referencia,
                cep: cep,

            });
            return res.render("pagamento");
        }
    },

    pedidos: function(req, res) {
        res.render("pedidos");
    },
};

module.exports = usuarioController;