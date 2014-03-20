'use strict'

const
    express = require('express'),
    app = express(),
    spawn = require('child_process').spawn,
    io = require('socket.io').listen(5355);

app.configure(function() {
    app.use(function(req,res,next) {
        res.header('Access-Control-Allow-Origin', '*');
        return next();
    });
});

app.listen(3000);

app.get('/detail/:component', function(req, res) {

    let 
        responseObj = {
            command: 'session detail ' + req.params.component + ' --nocheck',
            data: [{
                extraoptions: {},
                osoptions: {},
                currentstate: {},
                relations: {
                    groups: [],
                    services: [],
                    guests: []
                }
            }]
        },
        sessionCmd = spawn(
            'bash', [
                '/home/maurice/Source/Projects/Trunk/Session/session.sh',
                'detail',
                req.params.component,
                '--nocheck'
        ]);

    sessionCmd.stdout.on('data', function (data) {
        let rows = data.toString().split("\n");
        rows.forEach(function (row) {

            if(row != '' && row.charAt(0) != '#') {
                let
                    item = row.split("="),
                    key = item[0],
                    val = item[1].replace(/\'/g, '');

                if(key === 'vmhome' || key === 'vmdata') {
                    responseObj['data'][0]['extraoptions'][key] = val;
                }
                else if(key === 'osstop' || key === 'osreboot' || key === 'oslisten') {
                    responseObj['data'][0]['osoptions'][key] = val;
                }
                else if(key === 'acstate' || key === 'exstate' || key === 'state') {
                    responseObj['data'][0]['currentstate'][key] = val;
                }
                else if(key === 'groups') {
                    responseObj['data'][0]['relations']['groups'].push({'name': val});
                }
                else if(key === 'services') {
                    responseObj['data'][0]['relations']['services'].push({'name': val});
                }
                else if(key === 'guests') {
                    let guests = val.split(',');
                    guests.forEach(function (guest) {
                        responseObj['data'][0]['relations']['guests'].push({'name': guest});
                    });
                }
                else{
                    responseObj['data'][0][key] = val;
                }
            }
        });
    });

    sessionCmd.on('exit', function() {
        res.json(responseObj);
    });
});

app.get('/state/:component', function(req, res) {

    let 
        responseObj = {
            command: 'session state ' + req.params.component,
            data: []
        },
        sessionCmd = spawn(
            'bash', [
                '/home/maurice/Source/Projects/Trunk/Session/session.sh',
                'state',
                req.params.component
        ]);


    sessionCmd.stdout.on('data', function (data) {
        let
            rows = data.toString().split("\n"),
            row = rows[0].split(":");

        responseObj['data'].push({
            name: row[0],
            state: row[1].replace(' ', '')
        });

        // return json data to client (sends parts)
        // io.sockets.socket(id).emit('state', {
        io.sockets.emit('state', {
            name: row[0],
            state: row[1].replace(' ', '')
        });
    });

    sessionCmd.on('exit', function() {
        res.json(responseObj);
    });
});

app.get('/:service/:component', function(req, res) {

    let 
        responseObj = {
            command: 'session ' + req.params.service + ' ' + req.params.component,
            data: []
        },
        sessionCmd = spawn(
            'bash', [
                '/home/maurice/Source/Projects/Trunk/Session/session.sh',
                req.params.service,
                req.params.component
        ]);

    sessionCmd.stdout.on('data', function (data) {
        let rows = data.toString().split("\n");
        rows.pop();
        rows.forEach(function(row) {
            responseObj['data'].push({name: row});
        });
    });

    sessionCmd.on('exit', function() {
        res.json(responseObj);
    });
});

app.get('*', function (req, res) {
    res.json({
        error: 'Unrecognised API call'
    });
});