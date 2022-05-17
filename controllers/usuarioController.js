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

    pedidos: function(req, res) {
        res.render("pedidos");
    },
};

module.exports = usuarioController;