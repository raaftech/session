'use strict'

const
    sessionPath = '/home/maurice/Source/Projects/Trunk/Session/',
    express = require('express'),
    app = express(),
    spawn = require('child_process').spawn,
    io = require('socket.io').listen(5355);

app.configure(function() {
    app.use(function(req,res,next) {
        res.header('Access-Control-Allow-Origin', '*');
        return next();
    });
    app.use(express.json());
    app.use(express.urlencoded());
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
                    guests: [],
                    members: []
                }
            }]
        },
        sessionCmd = spawn(
            'bash', [
                sessionPath + 'session.sh',
                'detail',
                req.params.component,
                '--nocheck'
        ]),
        buffer = '';

    sessionCmd.stdout.on('data', function (data) {
        buffer += data;
    });

    sessionCmd.on('exit', function() {
        let
            data = buffer.toString(),
            rows = data.split('\n');
        rows.forEach(function (row) {

            if(row != '' && row.charAt(0) != '#') {
                let
                    item = row.split('='),
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
                else if(key === 'members') {
                    let members = val.split(',');
                    members.forEach(function (member) {
                        responseObj['data'][0]['relations']['members'].push({'name': member});
                    });
                }
                else{
                    responseObj['data'][0][key] = val;
                }
            }
        });
        if(responseObj['data'][0]['type'] === 'group') {
            if(responseObj['data'][0].hasOwnProperty('mode') === false) {
                responseObj['data'][0]['mode'] = 'serial';
            }
        }
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
                sessionPath + 'session.sh',
                'state',
                req.params.component
        ]);


    sessionCmd.stdout.on('data', function (data) {
        let
            rows = data.toString().split("\n"),
            row = rows[0].split(':');

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

app.get('/:service/:component', function (req, res) {

    let 
        responseObj = {
            command: 'session ' + req.params.service + ' ' + req.params.component,
            data: []
        },
        sessionCmd = spawn(
            'bash', [
                sessionPath + 'session.sh',
                req.params.service,
                req.params.component,
                '--verbose'
        ]),
        buffer = '';

    sessionCmd.stdout.on('data', function (data) {
        buffer += data;
    });

    sessionCmd.on('exit', function() {
        let
            data = buffer.toString(),
            rows = data.split('\n');
        rows.pop();
        rows.forEach(function(row) {
            row = row.replace(/[\(\ \)]/g, ',').split(',');
            responseObj['data'].push({
                name: row[1],
                type: row[0]
            });
        });
        res.json(responseObj);
    });
});

app.get('*', function (req, res) {
    res.json({
        error: 'Unrecognised API call'
    });
});

app.post('/discover', function (req, res) {
    let 
        responseObj = {
            command: 'session discover ' + req.body.ip + '/' + req.body.cidr,
            data: []
        },
        sessionCmd = spawn(
            'bash', [
                sessionPath + 'session.sh',
                'discover',
                req.body.ip + '/' + req.body.cidr
        ]);

    sessionCmd.stdout.on('data', function (data) {
        let
            rows = data.toString().split("\n"),
            prts = rows[0].split(' '),
            row = prts[6].replace(/[\(\ \)]/g, ',').split(',');

        responseObj['data'].push({
            name: row[0]
        });

        io.sockets.emit('discover', {
            name: row[0]
        });
    });

    sessionCmd.on('exit', function() {
        res.json(responseObj);
    });
});

app.post('/modconf', function (req, res) {

    const
        quoting = ['vmhome','vmdata','svstatus','svstart','svstop'];

    let
        modTempl = {
            'host'   : ['type','osmt','acmt','exmt','user','admin','addr','vrmt','vmhome','vmdata'],
            'guest'  : ['type','osmt','acmt','exmt','user','admin','addr','host'],
            'group'  : ['type','mode'],
            'service': ['type','svmt','port','acmt','exmt','user','addr','host']
        },
        r = req.body,
        test = [sessionPath + 'session.sh', 'modconf', r.oldname],
        responseObj = {
            command: "session modconf " + r.oldname,
            data: []
        };

    if(r.name !== r.oldname) {
        modTempl[r.type].push('name');
    }

    if(r.type === 'service' && r.svmt === 'scripted') {
        modTempl[r.type].push('svstatus','svstart','svstop');
    }

    modTempl[r.type].forEach(function (attr) {
        let val = '';
        if(quoting.indexOf(attr) >= 0) {
            val = "--" + attr + "='" + r[attr] + "'";
        }
        else{
            val = "--" + attr + "=" + r[attr];
        }
        test.push(val);
        responseObj['command'] += ' ' + val;
    });

    let sessionCmd = spawn(
        'bash', test
    );
    // console.log(test);

    sessionCmd.stdout.on('data', function (data) {
        console.log('stdout: ' + data);
    });

    sessionCmd.stderr.on('data', function (data) {
        console.log('stderr: ' + data);
    });

    sessionCmd.on('exit', function() {
        res.json(responseObj);
    });
});
