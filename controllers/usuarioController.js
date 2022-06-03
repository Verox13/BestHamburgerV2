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
        const idProduto = req.params.id
        const getCarrinho = await Produto.findByPk(idProduto)
        req.session.carrinho = []

        if (getCarrinho) {
            req.session.carrinho.id = getCarrinho.id;
            req.session.carrinho.nome = getCarrinho.nome;
            req.session.carrinho.preco = getCarrinho.preco;
            req.session.carrinho.descricao = getCarrinho.descricao
        } else {
            req.session.carrinho.id = ""
            req.session.carrinho.nome = ""
            req.session.carrinho.preco = ""
            req.session.carrinho.descricao = ""
        }
        // carrinho = [];
        // carrinho.push(getCarrinho)
        // if (carrinho) {
        //     carrinho.push(getCarrinho)
        // } else {
        //     carrinho = [];
        //     carrinho.push(getCarrinho)
        // }
        // console.log(req.session.carrinho)
        res.redirect("carrinho")
    },
    carrinho: function(req, res) {
        console.log(req.session.user)
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
        let user = req.session.user;
        console.log(user.id);
        const { local, bairro, numero, rua, referencia, cep } = req.body;
        let enderecoCadastrado = await Endereco.create({
            local: local,
            bairro: bairro,
            numero: numero,
            rua: rua,
            referencia: referencia,
            cep: cep,
            usuario_id: user.id


        });
        return res.render("pagamento");

    },

    pedidos: function(req, res) {
        res.render("pedidos");
    },
};

module.exports = usuarioController;