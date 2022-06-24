const { ARRAY } = require("sequelize");
const { Sequelize, Usuario, Endereco, Produto } = require("../models");

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
    addProduto: async(req, res) => {
        const idProduto = req.params.id;
        const getCarrinho = await Produto.findByPk(idProduto);
        let carrinho = req.session.carrinho;

        if (carrinho) {
            carrinho.push(getCarrinho);
        } else {
            carrinho = req.session.carrinho = [];
            carrinho.push(getCarrinho);
        }
        // console.log(carrinho)
        res.render("carrinho", { carrinho: carrinho });
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
};

module.exports = usuarioController;