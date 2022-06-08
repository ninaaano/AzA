const mongoose = require('mongoose');
const Msg = require('./models/messages');

const httpServer = require("http").createServer();
const io = require('socket.io')(httpServer,{
    cors:{
        origin:"*",
        method:["GET","POST","OPTIONS"]
    }
});
httpServer.listen(3000);
const mongoDB = 'mongodb+srv://admin:admin@cluster0.wwomr.mongodb.net/aza-message-test?retryWrites=true&w=majority'

const moment = require('moment');
const { $or, $and } = require('sift');
const { result } = require('lodash');
require('moment-timezone');

mongoose.connect(mongoDB,{ 
    useNewUrlParser: true,
    useUnifiedTopology: true
}).then(()=> {
    console.log("[server.js] mongodb connected");
}).catch(err => console.log(err));

io.on('connection', (socket) => {
    console.log("[server.js] :: connected");
    
    socket.emit("getUserId", () => {console.log("[server.js] :: connected 2");});

    // const emitList = () => {

    //     Msg.find({$or: [{senderId: 'user01'}, {receiverId: 'user01'}]})
    //     .sort({messageCreateAt: 1})
    //     .then((result) => {
    //        console.log(result);
    //        socket.emit('') 
    //     }


    // }



/*    const emitMessage = () => {
    
        // readMessage(senderId, receiverId) :: messageReadAt
        Msg.updateMany(
            {$and: [{messageReadAt: {$exists: false}}, {senderId: 'admin', receiverId: 'user01'}]},
            {$set: {"messageReadAt": moment().tz("Asia/Seoul").format("YYYY-MM-DD HH:mm:ss")}}
            ).then((result) => {console.log(result)});


        // getMessage(senderId, receiverId) ::     
        Msg.find({$or: [{senderId: 'user01', receiverId: 'admin'},
            {senderId: 'admin', receiverId: 'user01'}]})
            .sort({messageCreateAt: 1})
            .then((result) => {
            console.log(result);
            socket.emit('output-messages', result);
            });

    };*/

    const emitMessage = (userId, otherId) => {
    
        // readMessage(senderId, receiverId) :: messageReadAt
        Msg.updateMany(
            {$and: [{messageReadAt: {$exists: false}}, {senderId: otherId, receiverId: userId}]},
            {$set: {"messageReadAt": moment().tz("Asia/Seoul").format("YYYY-MM-DD HH:mm:ss")}}
            ).then((result) => {console.log(result)});


        // getMessage(senderId, receiverId) ::     
        Msg.find({$or: [{senderId: otherId, receiverId: userId},
            {senderId: userId, receiverId: otherId}]})
            .sort({messageCreateAt: 1})
            .then((result) => {
            console.log(result);
            socket.emit('output-messages', result);
            });

    };
    
    

    //emitMessage();

    //socket.emit('message', 'Hello'); //debugging

    socket.on('disconnect', () => {
        console.log("[server.js] :: disconnected")
    });

    socket.on('chatmessage', msg => {
        
        const message = new Msg({
            
            senderId: 'user01',
            receiverId: 'admin',
            messageContent: msg,
            messageCreateAt: moment().tz("Asia/Seoul").format("YYYY-MM-DD HH:mm:ss"),
            //messageReadAt: "",
      
        });
        
        message.save().then(() => {

            io.emit('message', message);

        })
    })

    socket.on('deleteMessage', messageId => {

        Msg.findByIdAndDelete(messageId)
        .then((result) => {
            console.log(`deletemessage : ${result}`);
            socket.emit('deleteHandler', messageId);
        })
    })

    
})
