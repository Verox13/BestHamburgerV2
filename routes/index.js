var express = require("express");
const cardapioController = require("../controllers/cardapioController.js");
var router = express.Router();
var principalController = require("../controllers/principalController.js");
var validator = require("../middlewares/express-validator");

router.get("/", principalController.index);
/*ROTAS CARDAPIO*/
router.get("/home-hamburgeres", cardapioController.homeHamburgeres);
router.get("/home-burgerveg", cardapioController.homeBurgerVeg);
router.get("/home-sobremesa", cardapioController.homeSobremesa);
router.get("/home-bebidas", cardapioController.homeBebidas);
router.get("/home-acompanhamentos", cardapioController.homeAcompanhamentos);
router.get("/home-cachorroquente", cardapioController.homeCachorroQuente);
router.get("/home-combos", cardapioController.homeCombos);
router.get("/login", principalController.getLogin);
router.post("/login", principalController.postLogin);
router.get("/cadastrar", principalController.telaCadastro);
router.post("/cadastrar", validator.validacoesCadastro, principalController.cadastrar);
router.get("/contato", principalController.telaContato);
router.get("/recuperar", principalController.telaRecuperar);
router.post("/recuperar", principalController.telaRecuperar);
router.get("/logout", principalController.logout);


module.exports = router;