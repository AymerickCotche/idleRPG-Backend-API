const CharEquipment = require('../models/charEquipment');
const jwt = require('../services/jwt');
const dbCache = require('../services/cache');

module.exports = {

    async unequipItem (request, response, next) {
        try {
            const charEquipment = await new CharEquipment(request.body).unequipItem();
            request.body.quantity = 1;
            next();
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
    },

    async equipItem (request, response, next) {
        try {
            const charEquipment = await new CharEquipment(request.body).equipItem();
            console.log(request.body);
            request.body.itemId = request.body.newItemId;
            request.body.quantity = -1;
            delete response.locals.nothingToDo;
            delete response.locals.equExists;
            console.log('on est laaa');
            next();
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
    }

}