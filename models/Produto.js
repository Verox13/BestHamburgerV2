const Produto = (sequelize, DataTypes) => {
    const produto = sequelize.define(
        'Produto', {
            nome: {
                type: DataTypes.STRING,
                allownull: false
            },
            preco: {
                type: DataTypes.DECIMAL,
                allownull: false
            },
            descricao: {
                type: DataTypes.STRING,
                allownull: false
            },

            img: {
                type: DataTypes.STRING,
                allownull: false
            },

            tipo: {
                type: DataTypes.STRING,
                allownull: false
            },

        }, {
            tableName: "produto",
            timestamps: false
        }
    )
    Produto.associate = (models => {
        Produto.belongsToMany(models.Pedido, { as: "pedido", through: "pedido_produto", foreignKey: 'produto_id', otherKey: "pedido_id", timestamps: false })
    })

    return produto
}

module.exports = Produto