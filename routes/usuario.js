var express = require("express");
var router = express.Router();
var usuarioController = require("../controllers/usuarioController.js");
// var uploadAvatar = require("../middlewares/multer.js");
var authenticator = require('../middlewares/authenticator')


router.get("/perfil/editar", authenticator, usuarioController.telaEditarPerfil);
router.get("/pagamento", authenticator, usuarioController.pagamento);
router.get("/comprar", usuarioController.comprar);
router.get("/trocarsenha", authenticator, usuarioController.trocarSenha);
router.get("/endereco", authenticator, usuarioController.endereco);
router.post("/endereco", usuarioController.CadastrarEndereco);
router.get("/pedidos", usuarioController.pedidos);

//Rotas Carrinho

router.get("/carrinho", usuarioController.carrinho);
router.post("/addproduto/:id", usuarioController.addProduto);
module.exports = router;