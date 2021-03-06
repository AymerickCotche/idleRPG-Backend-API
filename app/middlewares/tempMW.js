const jwt = require('../services/jwt');
const dbCache = require('../services/cache');
const User = require('../models/user');
const Character = require('../models/character');

module.exports = {
    async subscribeUser (request, response, next) {
        try {
            const user = await new User(request.body).save();
            response.locals.user = user;
            next();
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
    },

    async createCharacter (request, response, next) {
        try {
            response.locals.user.img_path = 'une/image';
            const instance = await new Character(response.locals.user);
            const character = await instance.create();
            // const token = jwt.makeToken(response.locals.user.id);
            // response.setHeader('Authorization', token);
            // await dbCache.set("user-0"+response.locals.user.id, token, {EX: 4*60*60, NX: false});
            // response.status(201).json(character);
            next();
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
    }

}