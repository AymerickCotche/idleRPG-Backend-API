const Entity = require('../models/entity');
const jwt = require('../services/jwt');
const dbCache = require('../services/cache');

module.exports = {

    async findAll(request, response, next) {
        try {
            const entities = await Entity.findAll();
            response.locals.entities = entities;
            next();
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message);
        }
    }

}