const Character = require('../models/character');
const jwt = require('../services/jwt');
const dbCache = require('../services/cache');

module.exports = {

    async findOne (request, response) {
        try {
            const user = response.locals.user;
            const items = response.locals.items;
            const entities = response.locals.entities;
            const id = Number(user.id);
            const character = await Character.findOne(id);
            if (!character)
                return response.status(404).json(`No character found for the user with id ${id}`);
            const token = jwt.makeToken(id);
            response.setHeader('Authorization', token);
            await dbCache.set("user-0"+id, token, {EX: 4*60*60, NX: false});
            response.status(200).json({user, character, items, entities});
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
    },

    async create (request, response) {
        try {
            const user = response.locals.user;
            const items = response.locals.items;
            const entities = response.locals.entities;
            const character = await new Character(request.body).create();
            const token = jwt.makeToken(request.userId);
            response.setHeader('Authorization', jwt.makeToken(request.userId));
            await dbCache.set("user-0"+request.userId, token, {EX: 4*60*60, NX: false});
            response.status(201).json({user, character, items, entities});
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
    }
}