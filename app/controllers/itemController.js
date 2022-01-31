const Item = require('../models/item');
const jwt = require('../services/jwt');
const dbCache = require('../services/cache');

module.exports = {

    async findAll(request, response, next) {
        try {
            const items = await Item.findAll();
            response.locals.items = items;
            next();
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message);
        }
    }

}