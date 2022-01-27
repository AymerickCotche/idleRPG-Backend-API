const jwt = require('../services/jwt');
const dbCache = require('../services/cache');
const User = require('../models/user');


module.exports = {
    async login (request, response, next) {
        try {
            const user = await new User(request.body).doLogin();
            response.locals.user = user;
            next();
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
    }
}