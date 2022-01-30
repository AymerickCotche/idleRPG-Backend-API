const CharEquipment = require('../models/charEquipment');
const jwt = require('../services/jwt');
const dbCache = require('../services/cache');

module.exports = {

    async checkExists (request, response, next) {
        try {
            const equExists = await new CharEquipment(request.body).checkEquipment();
            response.locals.equExists = equExists;
            next();
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
    },

    async getOldItemId (request, response, next) {
        try {
            if(response.locals.equExists === false) {
                console.log(response.locals.equExists);
                next();
            }
            request.body.newItemId = request.body.itemId;
            const itemId = await new CharEquipment(request.body).getOldItemId();
            request.body.itemId = itemId;
            next();
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
    },
}