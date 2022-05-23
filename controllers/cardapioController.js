const { validationResult } = require("express-validator");
const { Sequelize, Usuario, Produto } = require("../models");
const bcrypt = require("bcryptjs");
const Op = Sequelize.Op;

const cardapioController = {

    homeHamburgeres: async function(req, res) {
        let produtos = await Produto.findAll({ where: { tipo: 'hamburger' } })

        res.render("home-hamburgeres", { produtos });
    },

    homeBurgerVeg: async function(req, res) {
        let produtos = await Produto.findAll({ where: { tipo: "hamburger vegetariano" } })

        res.render("home-burgerveg", { produtos });
    },

    homeSobremesa: async function(req, res) {
        let produtos = await Produto.findAll({ where: { tipo: "sobremesa" } })

        res.render("home-sobremesa", { produtos });
    },

    homeBebidas: async function(req, res) {
        let produtos = await Produto.findAll({ where: { tipo: "bebida" } })

        res.render("home-bebidas", { produtos });
    },

    homeAcompanhamentos: async function(req, res) {
        let produtos = await Produto.findAll({ where: { tipo: "acompanhamento" } })

        res.render("home-acompanhamentos", { produtos });
    },

    homeCachorroQuente: async function(req, res) {
        let produtos = await Produto.findAll({ where: { tipo: "cachorro quente" } })

        res.render("home-cachorroquente", { produtos });
    },



}

module.exports = cardapioController;