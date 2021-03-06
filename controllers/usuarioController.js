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
    addProduto: (req,res) => {
        const idProduto = req.params.id
        res.send(idProduto)
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
            let user =req.session.user;
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