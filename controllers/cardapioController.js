const { validationResult } = require("express-validator");
const { Sequelize, Usuario, Produto } = require("../models");
const bcrypt = require("bcryptjs");
const Op = Sequelize.Op;

const cardapioController = {

    homeHamburgeres: async function(req, res) {
        let produtos = await Produto.findAll({ where: { tipo: 'hamburger' } })

        res.render("home-hamburgeres", { produtos });
    },


}

module.exports = cardapioController;