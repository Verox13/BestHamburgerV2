var express = require("express");
var router = express.Router();
var usuarioController = require("../controllers/usuarioController.js");
var authenticator = require("../middlewares/authenticator");

router.get("/perfil/editar", authenticator, usuarioController.telaEditarPerfil);
router.get("/pagamento", authenticator, usuarioController.pagamento);
router.get("/comprar", usuarioController.comprar);
router.get("/trocarsenha", authenticator, usuarioController.trocarSenha);

//Rotas Carrinho

router.get("/addproduto/carrinho", usuarioController.carrinho);
router.post("/addproduto/:id", usuarioController.addProduto);
module.exports = router;