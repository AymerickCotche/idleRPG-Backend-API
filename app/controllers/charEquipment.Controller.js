const CharEquipment = require('../models/charEquipment');
const jwt = require('../services/jwt');
const dbCache = require('../services/cache');

module.exports = {


    async unequipItem (request, response, next) {
        try {
            const charEquipment = new CharEquipment(request.body).unequipItem();
            response.locals.user = request.body.user;
            next();
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
    },

    async equipItem (request, response, next) {
        try {
            const charEquipment = new CharEquipment(request.body).equipItem();
            response.locals.user = request.body.user;
            next();
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
    }

}