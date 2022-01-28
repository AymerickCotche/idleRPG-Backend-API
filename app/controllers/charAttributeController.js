const CharAttribute = require('../models/charAttribute');
const jwt = require('../services/jwt');
const dbCache = require('../services/cache');

module.exports = {


    async updateIncrement (request, response, next) {
        try {
            response.locals.user = request.body.user;
            const charAttribute = new CharAttribute(request.body).updateIncrement();
            next();
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
    }

}