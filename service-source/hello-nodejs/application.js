'use strict';

const Hapi = require('hapi');
const Joi = require('joi');

const _host = process.env.OPENSHIFT_NODEJS_IP || '0.0.0.0';
const _port = process.env.OPENSHIFT_NODEJS_PORT || 8080;

const server = new Hapi.Server();
server.connection({ host:_host, port:_port });

server.start(() => {
    console.log('Server running HAPI v%s at: %s', server.version, server.info.uri);
});

server.route({
    method: 'GET',
    path: '/hello/{name?}',
    config: {
        description: 'Service saying hello!',
        notes: 'Name parameter defaults to \'HAPI World\' if not specified',
        validate: {
            params: {
                name: Joi.string().min(2).max(10)
            }
        }
    },
    handler: function (request, reply) {
        const namestring = request.params.name? request.params.name : 'HAPI World';
        reply('Hello, '+namestring+'!!!');
    }
});


